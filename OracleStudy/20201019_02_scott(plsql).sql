SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 데이터 입력 시 특정 항목의 데이터만 입력하면
--                  ------------------
--                  (학번, 이름, 국어점수, 영어점수, 수학점수)
--   내부적으로 총점, 평균, 등급 항목에 대한 처리가 함께 이루어질 수 있도록 하는
--   프로시저를 작성한다. (생성한다.)
--   프로시저명 : PRC_SUNGJUK_INSERT()
/*
실행 예)
EXEC PRC_SUNGJUK_INSERT(1, '안혜지', 90, 80, 70);

프로시저 호출로 처리된 결과
학번    이름   국어점수  영어점수  수학점수  총점  평균  등급
 1     안혜지      90       80        70      240    80   B
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(
)
IS 
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN  TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS 
    -- 선언부
    -- INSERT 쿼리문 수행을 하기 위해 필요한 변수
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 실행부
    -- 추가로 선언한 주요 변수들에 값을 담아내야 한다.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- COMMIT
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.


--○ TBL_SUNGJUK 테이블에서 특정 학생의 점수
--   (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시
--   총점, 평균, 등급까지 함께 수정되는 프로시저를 생성한다.
--   프로시저명 : PRC_SUNGJUK_UPDATE()
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

프로시저 호출로 처리된 결과
학번    이름   국어점수  영어점수  수학점수  총점  평균  등급
 1     안혜지      50       50        50     150    50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN    IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR       IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT TBL_SUNGJUK.TOT%TYPE;
    V_AVG TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60) 
        THEN V_GRADE := 'D';
    ELSE 
        V_GRADE := 'F';
    END IF;
    
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT
      , TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.


--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는)
--   프로시저를 생성한다. (작성한다.)
--   단, IP 와 PW 가 일치하는 경우에만 수정을 진행할 수 있도록 처리한다.
--   프로시저명 : PRC_STUDENTS_UPDATE()
/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006', '010-7979-7979', '강원도 횡성');
--==>> 데이터 수정 X

EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-7979-7979', '강원도 횡성');
--==>> 데이터 수정 ○
*/

-- TEACHER'S CODE
-- 1. JOIN
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE ( SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2
            ON T1.ID = T2.ID )  T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
     
    COMMIT;
END;

-- 2. JOIN 하지 않는방법
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;
    V_FLAG  NUMBER := 0;
BEGIN
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = V_ID;
    
    IF (V_PW = V_PW2)
        THEN V_FLAG := 1;
    ELSE
        V_FLAG := 2;
    END IF;
     
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND V_FLAG = 1;
     
    COMMIT;
END;

-- MY CODE
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS 
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND 0 <> (SELECT COUNT(*)
                FROM TBL_IDPW T
                WHERE T.ID = V_ID
                  AND T.PW = V_PW);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.


DESC TBL_INSA;

--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   으로 구성된 컬럼 중
--   NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   의 데이터 입력 시
--   NUM 컬럼(사원번호)의 값은
--   기존 부여된 사원 번호의 마지막 번호 그 다음 번호를 
--   자동으로 입력 처리할 수 있는 프로시저로 구성한다.
--   프로시저명 : PRC_INSA_INSERT()
/*
실행 예)
EXEC PRC_INSA_INSERT('김보경', '940524-2234567', SYSDATE, '서울', '010-5896-0858'
                   , '개발부', '대리', 3000000, 3000000);
프로시저 호출로 처리된 결과
1061  김보경  940524-2234567  SYSDATE  서울  010-5896-0858  개발부  대리  3000000  3000000
*/

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN      TBL_INSA.NAME%TYPE
, V_SSN         IN      TBL_INSA.SSN%TYPE
, V_IBSADATE    IN      TBL_INSA.IBSADATE%TYPE
, V_CITY        IN      TBL_INSA.CITY%TYPE
, V_TEL         IN      TBL_INSA.TEL%TYPE
, V_BUSEO       IN      TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN      TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN      TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN      TBL_INSA.SUDANG%TYPE
)
IS
    V_MAXNUM    TBL_INSA.NUM%TYPE;
BEGIN
    SELECT NVL(MAX(NUM), 0) INTO V_MAXNUM    -- 안에 데이터가 없을 경우 MAX는 NULL이 될것이다.
    FROM TBL_INSA;                           -- 그러므로 NVL로 처리를 해줘야 한다.
    
    INSERT INTO TBL_INSA
    VALUES(V_MAXNUM + 1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL
         , V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.
    


--○ TBL_상품, TBL_입고 테이블을 대상으로
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 함께 변동될 수 있는 기능을 가진 프로시저를 작성한다.
--   단, 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 X)
--   TBL_입고 테이블 구성 컬럼
--   : 입고번호, 상품코드, 입고일자, 입고수량, 입고단가
--   프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)

DESC TBL_상품;

CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN  TBL_입고.상품코드%TYPE 
, V_입고수량    IN  TBL_입고.입고수량%TYPE 
, V_입고단가    IN  TBL_입고.입고단가%TYPE 
)
IS
    MAX입고번호  TBL_입고.입고번호%TYPE;
BEGIN
    SELECT NVL(MAX(입고번호), 0) INTO MAX입고번호
    FROM TBL_입고;
   
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
    VALUES(MAX입고번호 + 1, V_상품코드, V_입고수량, V_입고단가);
   
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 예외 처리
    EXCEPTION 
        WHEN OTHERS THEN ROLLBACK;
    -- OTHERS -> STANDARD하게 진행된 상황이 아닐때 뭔가 위에서 문제가 생겼을때
    -- ROLLBACK -> 롤백
    COMMIT;
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.



