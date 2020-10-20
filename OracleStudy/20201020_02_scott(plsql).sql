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
BEGIN
    -- 쿼리문 수행 이전에 수행 여부를 확인하는 과정에서
    -- 재고 파악 -> 기존의 재고수량을 파악하는 과정이 선행되어야 한다.
    -- 그래야 출고 수량과 비교가 가능하기 때문에...
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;


    -- 출고를 정상적으로 진행해줄 것인지에 대한 여부 확인
    -- 파악한 재고수량보다 출고수량이 많으면 예외 발생
    

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
    
    
    
    
END;