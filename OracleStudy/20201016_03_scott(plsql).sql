SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.

--○ SCOTT.TBL_INSA 테이블의 여러 명의 데이터 여러개를 변수에 저장
--   (반복문 활용)
DECLARE
    V_INSA  TBL_INSA%ROWTYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN

    LOOP
    
        SELECT NAME, TEL, BUSEO
                INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
        FROM TBL_INSA
        WHERE NUM = V_NUM; -- WHERE NUM = 1001, 1002, ...;
    
        DBMS_OUTPUT.PUT_LINE(V_INSA.NAME   || ' - ' 
                        || V_INSA.TEL || ' - ' 
                        || V_INSA.BUSEO);
                      
        EXIT WHEN V_NUM >= 1060;
    
        V_NUM := V_NUM + 1;
    
    END LOOP;
    
END;
--==>> 생략


--------------------------------------------------------------------------------

-- ■■■ FUNCTION(함수) ■■■--

-- 1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로
--    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
--    직접 스토어드 함수를 만들 수 있다. (-> 사용자 정의 함수)
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나
--    저장 프로시저처럼 EXECUTE 문을 통해 실행 할 수 있다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] FUNCTION 함수면
[( 매개변수명1 자료형
 , 매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문;
    ...
    RETURN 값;
    
    [EXCEPTION]
        -- 예외 처리 구문;
        
END;
*/

--※ 사용자 정의 함수(스토어드 함수)는
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,
--   FUNCTION 은 반드시 단일 값만 반환한다.


--○ TBL_INSA 테이블 전용 성별 확인 함수 정의(생성)
--   함수명 : FN_GENDER()
--                     ↑ SSN(주민등록번호) -> '771212-1234567' -> 'YYMMDD-NNNNNNN'

SELECT FN_GENDER('771212-1234567')
FROM DUAL;
--==>> 남자
-- 함수는 테이블에 의존적인 객체가 아니다.

CREATE OR REPLACE FUNCTION FN_GENDER( V_SSN VARCHAR2 ) -- 매개변수   : 자릿수(길이) 지정 안함
RETURN VARCHAR2                                        -- 반환자료형 : 자릿수(길이) 지정 안함
IS 
    -- 선언부 -> 주요 변수 선언
    V_RESULT    VARCHAR2(20);
BEGIN
    -- 실행부 -> 연산 및 처리
    IF ( SUBSTR(V_SSN, 8, 1) IN ('1', '3') )
        THEN V_RESULT := '남자';
    ELSIF ( SUBSTR(V_SSN, 8, 1) IN ('2', '4') )
        THEN V_RESULT := '여자';
    ELSE
        V_RESULT := '성별확인불가';
    END IF;
    
    -- 결과값 반환
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.




--○ 임의의 두 정수를 매개변수(입력 파라미터)로 입력받아 -> (A, B)
--   A 의 B 승의 값을 반환하는 사용자 정의 함수를 작성한다.
--  함수명 : FN_POW()
/*
사용 예)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000
*/

/*
CREATE [OR REPLACE] FUNCTION 함수면
[( 매개변수명1 자료형
 , 매개변수명2 자료형
)]
RETURN 데이터타입
IS
    -- 주요 변수 선언
BEGIN
    -- 실행문;
    ...
    RETURN 값;
    
    [EXCEPTION]
        -- 예외 처리 구문;
        
END;
*/

CREATE OR REPLACE FUNCTION FN_POW(N NUMBER, P NUMBER)
RETURN NUMBER
IS 
    CAL_COUNT NUMBER := 0;
    RESULT NUMBER := 1;
BEGIN
    WHILE CAL_COUNT < P LOOP
        RESULT := RESULT * N;
        CAL_COUNT := CAL_COUNT + 1;
    END LOOP;
    
    RETURN RESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블 기반의 급여 계산 함수를 정의한다.
--   급여는 [(기본급*12)+수당] 으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)

CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := VBASICPAY * 12 + NVL(VSUDANG, 0);
    RETURN VRESULT;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.


--○ TBL_INSA 테이블에서 입사일을 기준으로
--   현재까지의 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)

-- 1
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2010-10-10', 'YYYY-MM-DD'))/12
FROM DUAL;
--==>> 10.0180060546097172441258462763839107925

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('2010-10-10', 'YYYY-MM-DD'))/12) ||'년'||
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '개월'
FROM DUAL;
       
-- 3
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE) "근무시간"
FROM TBL_INSA;


CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12)||'년'||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '개월';

    RETURN VRESULT;
END;


CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12, 1);

    RETURN VRESULT;
END;


-- 내 코드
CREATE OR REPLACE FUNCTION FN_WORKYEAR(DDATE DATE)
RETURN NUMBER
IS
    NRESULT NUMBER;
BEGIN
    NRESULT := (SYSDATE - DDATE);
    NRESULT := TRUNC(NRESULT / 365, 1);

    RETURN NRESULT;
END;


--------------------------------------------------------------------------------

--※ 참고

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK 이 필요하다.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- 실행하면 자동으로 COMMIT 된다.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- 정적 PL/SQL문 -> DML문, TCL문만 사용 가능하다.
-- 동적 PL/SQL문 -> DML문, DDL문, DCL문, TCL문 사용 가능하다.

--------------------------------------------------------------------------------

--■■■ PROCEDURE(프로시저) ■■■--

-- 1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 업무의 흐름을
--    미리 작성하여 데이터베이스 내에 저장해 두었다가
--    필요할 때 마다 호출하여 실행할 수 있도록 처리해주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDUREF 프로시저명
[( 매개변수 IN 데이터타입            -- 입력 파라미터 (필수 X)
 , 매개변수 OUT 데이터타입           -- 출력 파라미터 (필수 X)
 , 매개변수 INOUT 테이터타입         -- 입출력 파라미터 (필수 X)
)]
IS
    [-- 주요 변수 선언;]
BEGIN
    -- 실행 구문;
    ...
    [EXCEPTION] 
        -- 예외 처리 구문;
END;
*/

--※ FUNCTION 과 비교했을 때 [RETURN 자료형] 부분이 존재하지 않으며,
--   [RETURN] 문 자체도 존재하지 않으며,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN, OUT, INOUT 으로 구분된다.

-- 3. 실행(호출)
/*
EXEC[UTE] 프로시저명[(인수1, 인수2, ...)];
*/

--※ 프로시저 실습을 위한 테이블 생성 및 준비 구문은
--   [20201016_04_scott.sql] 파일 참조~!!!

--○ 프로시저 생성
--   프로시저명 : PRC_STDENTS_INSERT('batman', 'java006$', '김일웅', '010-2222-2222', '서울 마포구')

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
-- 매개변수 선언
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES (V_ID, V_PW);
    
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT이(가) 컴파일되었습니다.