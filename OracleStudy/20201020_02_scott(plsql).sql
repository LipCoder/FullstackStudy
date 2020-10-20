SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저 작성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울', '경기', '대전' 만 입력이 가능하도록 구성
--   이 지역 이외의 다른 지역을 프로시저 호출을 통해 입력하고자 하는 경우
--   (즉, 입력을 시도하는 경우)
--   예외에 대한 처리를 하려고 한다.
--   프로시저명 : PRC_MEMBER_INSERT()
/*
실행 예)
EXEC PRC_MEMBER_INSERT('안혜지', '010-1111-1111', '서울');
--==>> 데이터 입력 ○

EXEC PRC_MEMBER_INSERT('박해진', '010-2222-2222', '부산');
--==>> 데이터 입력 Ⅹ
*/

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT 
( V_NAME    IN  TBL_MEMBER.NAME%TYPE
, V_TEL     IN  TBL_MEMBER.TEL%TYPE
, V_CITY    IN  TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;

BEGIN
    
    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지
    -- 아닌지의 여부를 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울', '경기', '대전'))
        -- 예외 발생 CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR; -- USER_DEFINE_ERROR라는 예외를 발생(THROW)
        
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- 쿼리문 구성 -> INSERT -> TBL_MEMBER
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- 커밋
    COMMIT;
    
    -- 예외 처리 구문
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '서울,경기,대전만 입력이 가능합니다.');
        WHEN OTHERS
            THEN ROLLBACK;
        
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.



--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고수량보다 많은 경우...
--   출고 액션을 취소할 수 있도록 처리한다. (출고가 이루어지지 않도록...)
--   프로시저명 : PRC_출고_INSERT()
/*
실행 예)
EXEC PRC_출고_INSERT('H003', 10, 500);

*/
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드     IN      TBL_출고.상품코드%TYPE
, V_출고수량     IN      TBL_출고.출고수량%TYPE
, V_출고단가     IN      TBL_출고.출고단가%TYPE
)
IS
    V_MAX출고번호   TBL_출고.출고번호%TYPE;
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT NVL(MAX(출고번호), 0) INTO V_MAX출고번호 
    FROM TBL_출고;
    
    SELECT 재고수량 INTO V_재고수량  
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF (V_재고수량 - V_출고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES ((V_MAX출고번호 + 1), V_상품코드, V_출고수량, V_출고단가);
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고수량이 부족합니다.');
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
, V_출고단가    IN TBL_출고.출고단가%TYPE
)
IS
    -- 쿼리문 수행을 위한 추가 변수 선언
    V_출고번호  TBL_출고.출고번호%TYPE;
    V_재고수량  TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 에러 변수
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 쿼리문 수행 이전에 수행 여부를 확인하는 과정에서
    -- 재고 파악 -> 기존의 재고수량을 파악하는 과정이 선행되어야 한다.
    -- 그래야 출고 수량과 비교가 가능하기 때문에...
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;


    -- 출고를 정상적으로 진행해줄 것인지에 대한 여부 확인
    -- 파악한 재고수량보다 출고수량이 많으면 예외 발생
    IF (V_출고수량 > V_재고수량)
        -- 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호), 0) INTO V_출고번호
    FROM TBL_출고;


    -- 쿼리문 구성 -> INSERT -> TBL_출고
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES(V_출고번호 + 1, V_상품코드, V_출고수량, V_출고단가);
    
    
    -- 쿼리문 구성 -> UPDATE -> TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    
    -- 커밋
    COMMIT;
    
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!');
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성
--   프로시저명 : PRC_출고_UPDATE()
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/

-- teacher's code
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
(
    -- ① 매개변수 구성
    V_출고번호       IN   TBL_출고.출고번호%TYPE
  , V_출고수량       IN   TBL_출고.출고수량%TYPE
)
IS
    -- ④ 필요한 변수 선언
    V_상품코드      TBL_상품.상품코드%TYPE;
    V_이전출고수량  TBL_출고.출고수량%TYPE;  
    V_재고수량      TBL_상품.재고수량%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    -- ⑤ 선언한 변수에 값 담아내기
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;


    -- ⑦ 재고수량 파악
    --    출고 정상수행여부 판단 필요
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    
    -- ⑧ 파악한 재고수량에 따라 데이터 변경 실시 여부 판단
    --    (재고수량 + 이전출고수량 < 현재출고수량 인 상황이라면... 사용자 정의 예외 발생)
    IF ( (V_재고수량 + V_이전출고수량) < V_출고수량 )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ② 수행될 쿼리문 체크 (UPDATE -> TBL_출고 / UPDATE -> TBL_상품)
    UPDATE TBL_출고
    SET 출고수량 = V_출고수량
    WHERE 출고번호 = V_출고번호;
    
    -- ③ 
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_이전출고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    
    -- ⑥ 커밋
    COMMIT;
    
    
    -- ⑨ 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '제고 부족~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.

-- my code
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호       IN   TBL_출고.출고번호%TYPE
, V_변경할수량     IN   TBL_출고.출고수량%TYPE
)
IS
    V_상품코드  TBL_상품.상품코드%TYPE;
    V_현재출고수량  TBL_출고.출고수량%TYPE := -1;
    V_재고수량  TBL_상품.재고수량%TYPE := -1;
    
    USER_DEFINE_ERROR0   EXCEPTION;
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    IF (NULL = (SELECT 출고번호 FROM TBL_출고 WHERE 출고번호 = V_출고번호))
        THEN RAISE USER_DEFINE_ERROR0;

    END IF;

    -- 출고번호에 알맞는 상품코드 저장
    SELECT 상품코드 INTO V_상품코드
    FROM TBL_출고
    WHERE  출고번호 = V_출고번호;
    
    -- 상품코드에 맞는 상품의 재고 저장
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    -- 현재 출고번호에서 출고한 수량 저장
    SELECT 출고수량 INTO V_현재출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- 알맞은 변수를 검색하지 못한 경우
    IF (V_현재출고수량 = -1 OR V_재고수량 = -1)
        THEN RAISE USER_DEFINE_ERROR1;
    -- 변경한수량이 전재 상품수량보다 큰경우
    ELSIF (V_현재출고수량 + V_재고수량 < V_변경할수량)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 업데이트
    UPDATE TBL_상품 
    SET 재고수량 = (V_현재출고수량 + V_재고수량) - V_변경할수량
    WHERE 상품코드 = V_상품코드;
    
    UPDATE TBL_출고
    SET 출고수량 = V_변경할수량
    WHERE 출고번호 = V_출고번호;
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR0
            THEN RAISE_APPLICATION_ERROR('-20003', '출고번호를 찾을 수 없습니다.');
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR('-20004', '상품을 찾을 수 없습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR('-20005', '변경할 수량이 재고수량보다 큽니다.');
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.



--○ 과제
--   - 제출 파일 : 20201020_02_scott(plsql)_홍길동.sql
--   - 제출 내용
--   다음 프로시저를 생성한다.
--    * PRC_입고_UDPATE(입고번호, 입고수량) 
--    * PRC_입고_DELETE(입고번호)
--    * PRC_출고_DELETE(출고번호)
--    --> 이미 출고된 상황을 생각해주자.



--------------------------------------------------------------------------------

--■■■ CURSOR(커서) ■■■--

-- 1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된
--    작업 영역에서 SQL 문을 실행하고 그 과정에서 발생한 정보를
--    저장하기 위해 커서(CURSOR)를 사용하며,
--    커서에는 암시적인 커서와 명시적인 커서가 있다.

-- 2. 암시적 커서는 모든 SQL 문에 존재하며
--    SQL 문 실행 수 오직 하나의 행(ROW)만 출력하게 된다.
--    그러나 SQL 문을 실행한 결과물(RESULT SET)이
--    여러 행(ROW)으로 구성된 경우
--    커서(CURSOR)를 명시적으로 선언하야 여러 행(ROW)을 다룰 수 있다.


--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM = 1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
END;
--==>> 홍길동 -- 011-2356-4528


--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
END;
--==>> 에러 발생
--     (ORA-01422: exact fetch returns more than requested number of rows)


--○ 커서 이용 전 황황(다중 행 접근 시 - 반복문 활용)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
        V_NUM := V_NUM + 1;
        
        EXIT WHEN V_NUM >= 1061;
        
    END LOOP;
END;


--○ 커서 이용 후 상황
DECLARE 
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서변수 선언(-> 커서 정의)
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한 행 한 행 받아다가 처리하는 행위 -> [FETCH]
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태... NOTFOUND
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
    
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_INSA_SELECT;
    
END;

-- 커서 장점 : NUM을 몰라도 된다.
--             증가 하는 NUM이 1씩 증가하지 않더라도 모든 데이터를 가져올 수 있다.


--------------------------------------------------------------------------------

--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다.

-- 1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때
--    자동적으로 실행되는(유발되는, 촉발되는) 객체로
--    이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.
--    TRIGGER 는 무결성 뿐 아니라
--    다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성
-- 잘못된 트랜잭션 방지
-- 복잡한 보안 권한 강제 수행
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행
-- 복잡한 업무 규칙 강제 적용
-- 투명한 이벤트 로깅 제공
-- 복잡한 감사 제공
-- 동기 테이블 복제 유지관리
-- 테이블 액세스 통계 수집

-- 2. TRIGGER 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.

-- 3. 특징 및 종류

-- BEFORE : 사전, AFTER : 사후
-- STATEMENT : 한개만, ROW : 모든행

--    - BEFORE STATEMENT
--      SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행
--    - BEFORE ROW
--      SQL 구문이 실행되기 전에(DML 작업을 수행하기 전에)
--      각 행(ROW)에 대해 한 번씩 실행
--    - AFTER STATEMENT
--      SQL 구문이 실행된 후에 그 문장에 대해 한 번 실행
--    - AFTER ROW
--      SQL 구문이 실행된 후에(DML 작업을 수행한 후에)
--      각 행(ROW)에 대해 한 번씩 실행


-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명  -- 장착이되는 테이블
    [FOR EACH ROW [WHEN TRIGGER 조건]]
[DECLARE]
    -- 선언 구문;
BEGIN
    -- 실행 구문;
END;
*/


--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■
-- ※ DML 작업에 대한 이벤트 기록

--○ TRIGGER(트리거) 생성(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    -- 이벤트 종류 구분 (조건문을 통한 분기)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    --COMMIT;
    -- ※ TRIGGER 내에서는 COMMIT / ROLLBACK 구문 사용 불가~!!!
END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.



--■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업 수행 전에 작업에 대한 가능 여부 확인

--○ 트리거 작성(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (작업시간이 오전 8시 이전이거나... 오후 6시 이후라면...)
        THEN 작업을 수행하지 못하도록 처리하겠다.
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_CHAR(SYSDATE, 'HH24') 이 오전 8시 이전이거나... 
        TO_CHAR(SYSDATE, 'HH24') 이 오후 6시 이후라면...)
        THEN 작업을 수행하지 못하도록 처리하겠다.
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8
        OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08:00 ~ 18:00 까지만 가능합니다');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.


