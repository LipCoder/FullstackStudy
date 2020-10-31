-- ○ 개설과정 생성
DESC COURSES;
DESC OPEN_COURSES;

SELECT 'HI'||1
FROM DUAL;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_OC
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_OC이(가) 생성되었습니다.
CREATE OR REPLACE PROCEDURE PRC_INSERT_OC
( V_COU_CODE             IN  OPEN_COURSES.COU_CODE%TYPE
, V_PRO_ID               IN  OPEN_COURSES.PRO_ID%TYPE
, V_CLR_CODE             IN  OPEN_COURSES.CLR_CODE%TYPE
, V_COU_START_DATE       IN  OPEN_COURSES.COU_START_DATE%TYPE
, V_COU_END_DATE         IN  OPEN_COURSES.COU_END_DATE%TYPE
)
IS
    DATE_EXCEPTION   EXCEPTION;
BEGIN
    IF(V_COU_START_DATE > V_COU_END_DATE)
        THEN RAISE DATE_EXCEPTION;
    END IF;
    
    INSERT INTO OPEN_COURSES( OC_CODE, COU_CODE, PRO_ID, CLR_CODE
                            , COU_START_DATE, COU_END_DATE)
    VALUES( 'OC_' || TO_CHAR(SEQ_OC.NEXTVAL), V_COU_CODE, V_PRO_ID, V_CLR_CODE
          , V_COU_START_DATE, V_COU_END_DATE);
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION 
        WHEN DATE_EXCEPTION 
            THEN RAISE_APPLICATION_ERROR(-20090, '날짜 연월일이 잘못되었습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_OC이(가) 컴파일되었습니다.

-- ○ 개설과정 수정
CREATE OR REPLACE PROCEDURE PRC_UPDATE_OC
( V_OC_CODE              IN  OPEN_COURSES.OC_CODE%TYPE
, V_COU_CODE             IN  OPEN_COURSES.COU_CODE%TYPE
, V_PRO_ID               IN  OPEN_COURSES.PRO_ID%TYPE
, V_CLR_CODE             IN  OPEN_COURSES.CLR_CODE%TYPE
, V_COU_START_DATE       IN  OPEN_COURSES.COU_START_DATE%TYPE
, V_COU_END_DATE         IN  OPEN_COURSES.COU_END_DATE%TYPE
)
IS
    DATE_EXCEPTION   EXCEPTION;
BEGIN
    IF(V_COU_START_DATE > V_COU_END_DATE)
        THEN RAISE DATE_EXCEPTION;
    END IF;
    
    UPDATE OPEN_COURSES
    SET COU_CODE = V_COU_CODE, PRO_ID = V_PRO_ID, CLR_CODE = V_CLR_CODE
      , COU_START_DATE = V_COU_START_DATE, COU_END_DATE = V_COU_END_DATE
    WHERE OC_CODE = V_OC_CODE; 
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION 
        WHEN DATE_EXCEPTION 
            THEN RAISE_APPLICATION_ERROR(-20090, '날짜 연월일이 잘못되었습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_UPDATE_OC이(가) 컴파일되었습니다.

-- ○ 개설과정 삭제
CREATE OR REPLACE PROCEDURE PRC_DELETE_OC
( V_OC_CODE              IN  OPEN_COURSES.OC_CODE%TYPE)
IS
BEGIN
    DELETE 
    FROM OPEN_COURSES
    WHERE OC_CODE = V_OC_CODE; 
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION 
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_DELETE_OC이(가) 컴파일되었습니다.

-- ○ 개설과정 출력
-- (출력정보 : 과정명, 강의실, 과목명, 과목 기간, 교재명, 교수자 명)
DESC TEXTBOOKS;
DESC PROFESSORS;
DESC CLASSROOMS;
DESC OPEN_SUBJECTS;
DESC SUBJECTS;

CREATE OR REPLACE PROCEDURE PRC_PRINT_OC
IS
    V_COU_NAME      COURSES.COU_NAME%TYPE;
    V_CLR_INFO      CLASSROOMS.CLR_INFO%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_PR_NAME       PROFESSORS.PR_NAME%TYPE;


    -- 커서 생성
    CURSOR CUR_OC_SELECT
    IS
    -- 과정명 JOIN 과목명 JOIN 교재명 JOIN 교수자명
    SELECT C.COU_NAME, CL.CLR_INFO, S.SUB_NAME, OS.S_DATE, OS.E_DATE, T.TB_NAME, P.PR_NAME
    FROM OPEN_COURSES OC, COURSES C, CLASSROOMS CL, OPEN_SUBJECTS OS, SUBJECTS S
       , TEXTBOOKS T, PROFESSORS P
    WHERE OC.COU_CODE = C.COU_CODE
      AND OC.CLR_CODE = CL.CLR_CODE
      AND OC.OC_CODE = OS.OC_CODE
      AND OS.SUB_CODE = S.SUB_CODE
      AND OS.TB_CODE = T.TB_CODE
      AND OS.PRO_ID = P.PRO_ID;
BEGIN
    -- 커서 오픈
    OPEN CUR_OC_SELECT;
      
    -- 한 행씩 받아서 처리
    LOOP
        -- 한 행씩 받아옴
        FETCH CUR_OC_SELECT INTO V_COU_NAME, V_CLR_INFO, V_SUB_NAME
                               , V_S_DATE, V_E_DATE, V_TB_NAME, V_PR_NAME;
        
        -- 데이터가 없으면 루프 종료       
        EXIT WHEN CUR_OC_SELECT%NOTFOUND;
        
        -- (출력정보 : 과정명, 강의실, 과목명, 과목 기간, 교재명, 교수자 명)
        DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COU_NAME 
                              || ' 강의실 : ' || V_CLR_INFO
                              || ' 과목명 : ' || V_SUB_NAME 
                              || ' 과목 기간 : ' || V_S_DATE || ' ~ ' || V_E_DATE 
                              || ' 교재명 : ' || V_SUB_NAME 
                              || ' 교수자 명 : ' || V_PR_NAME);
                            
    END LOOP;
    
    -- 커서 클로즈  
    CLOSE CUR_OC_SELECT;
END;
--==>> Procedure PRC_PRINT_OC이(가) 컴파일되었습니다.

-- 확인
SET SERVEROUTPUT ON;
EXEC PRC_PRINT_OC;


-- ○ 과정 생성
DESC COURSES;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_COU
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_COU이(가) 생성되었습니다.

CREATE OR REPLACE PROCEDURE PRC_INSERT_COU
(V_COU_NAME COURSES.COU_NAME%TYPE)
IS
BEGIN

    INSERT INTO COURSES(COU_CODE, COU_NAME)
    VALUES('COU_'||TO_CHAR(SEQ_COU.NEXTVAL), V_COU_NAME);

    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_COU이(가) 컴파일되었습니다.

--○ 과정 수정
CREATE OR REPLACE PROCEDURE PRC_UPDATE_COU
( V_COU_CODE COURSES.COU_CODE%TYPE
, V_COU_NAME COURSES.COU_NAME%TYPE)
IS
BEGIN

    UPDATE COURSES
    SET COU_NAME = V_COU_NAME
    WHERE COU_CODE = V_COU_CODE;
    
    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_UPDATE_COU이(가) 컴파일되었습니다.


--○ 과정 삭제
CREATE OR REPLACE PROCEDURE PRC_DELETE_COU
( V_COU_CODE COURSES.COU_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM COURSES
    WHERE COU_CODE = V_COU_CODE;
    
    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_DELETE_COU이(가) 컴파일되었습니다.


--○ 과정 출력
CREATE OR REPLACE PROCEDURE PRC_PRINT_COU
IS
    V_COU_NAME  COURSES.COU_NAME%TYPE;
    
    -- 커서 생성
    CURSOR CUR_COU
    IS
    SELECT COU_NAME
    FROM COURSES;
    
BEGIN
    -- 커서 오픈
    OPEN CUR_COU;
    
    LOOP 
        FETCH CUR_COU INTO V_COU_NAME;
    
        EXIT WHEN CUR_COU%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_COU_NAME);
    
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_COU;
END;
--==>> Procedure PRC_PRINT_COU이(가) 컴파일되었습니다.

EXEC PRC_PRINT_COU;


-- 권한 여부 확인 함수
CREATE OR REPLACE FUNCTION FUNC_CHECK_AUTHORITY
( V_ID VARCHAR2
, V_PW VARCHAR2)
RETURN VARCHAR2
IS
    V_NUM   NUMBER(1) := 0;
BEGIN
    -- 관리자 검사
    SELECT COUNT(*) INTO V_NUM 
    FROM ADMIN 
    WHERE ADM_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'ADMIN';
    END IF;
    
    -- 교수 검사
    SELECT COUNT(*) INTO V_NUM 
    FROM PROFESSORS 
    WHERE PRO_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'PROFESSORS';
    END IF;
    
    -- 학생 검사
    SELECT COUNT(*) INTO V_NUM 
    FROM STUDENTS 
    WHERE ST_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'STUDENTS';
    END IF;

    RETURN 'NO_ACCOUNT';
END;
--==>> Function FUNC_CHECK_AUTHORITY이(가) 컴파일되었습니다.


-- 사용법
CREATE OR REPLACE PROCEDURE PRC_TEST
(/*매개변수들*/
  -- id와 pw를 받음
  V_ID  IN  VARCHAR2
, V_PW  IN  VARCHAR2
)
IS
    /*선언부*/
    
    -- 권한 예외처리 선언
    AUTHORITY_EXCEPTION EXCEPTION;
    NO_ACCOUNT_EXCEPTION EXCEPTION;

    V_CHECK_ACCOUNT VARCHAR2(20);
BEGIN

    V_CHECK_ACCOUNT := FUNC_CHECK_AUTHORITY(V_ID, V_PW);

    -- 권한 프로시저 확인
    IF('ADMIN' <> V_CHECK_ACCOUNT)
        THEN RAISE AUTHORITY_EXCEPTION;
    ELSIF('NO_ACCOUNT' = V_CHECK_ACCOUNT)
        THEN RAISE NO_ACCOUNT_EXCEPTION;
    END IF;
    
    
    /*실행부*/

    -- 예외처리
    EXCEPTION
        WHEN AUTHORITY_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20098, '권한이 없습니다.');
                 ROLLBACK;
        WHEN NO_ACCOUNT_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20099, '계정이 존재하지 않습니다.');
                 ROLLBACK;
END;
--==>> Procedure PRC_TEST이(가) 컴파일되었습니다.

