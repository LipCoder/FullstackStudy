SELECT USER
FROM DUAL;
--==>> MANAGER

--과목등록프로시저

--과목등록 시퀀스 생성
CREATE SEQUENCE SEQ_SUB
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_INSERT
( V_NAME    IN SUBJECTS.SUB_NAME%TYPE
)
IS
BEGIN
    
    -- INSERT문
    INSERT INTO SUBJECTS(SUB_CODE, SUB_NAME)
    VALUES('SU_' || SEQ_SUB.NEXTVAL,V_NAME);
    
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure PRC_SUBJECTS_INSERT이(가) 컴파일되었습니다.


-----------------------------------------------------------------------------
--과목수정 프로시저

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_UPDATE
( V_CODE    IN SUBJECTS.SUB_CODE%TYPE
, V_NAME    IN SUBJECTS.SUB_NAME%TYPE
)
IS
BEGIN
    -- 업데이트문
    UPDATE SUBJECTS
    SET SUB_NAME = V_NAME
    WHERE SUB_CODE = V_CODE;
    
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

----------------------------------------------------------------------------

--과목삭제 프로시저

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_DELETE
( V_CODE    IN SUBJECTS.SUB_CODE%TYPE )
IS
BEGIN
    -- DELETE 문
    DELETE
    FROM SUBJECTS
    WHERE SUB_CODE = V_CODE;
    
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

---------------------------------------------------------------------------
--과목정보출력프로시저

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_PRINT
IS 
    V_CODE  SUBJECTS.SUB_CODE%TYPE;
    V_NAME  SUBJECTS.SUB_NAME%TYPE;
    
 CURSOR CUR_SUBJECTS_SELECT
    IS
    SELECT SUB_CODE, SUB_NAME
    FROM SUBJECTS;
BEGIN
    --커서 오픈
    OPEN CUR_SUBJECTS_SELECT;
    
    LOOP
        FETCH CUR_SUBJECTS_SELECT INTO V_CODE,V_NAME;
        
        EXIT WHEN CUR_SUBJECTS_SELECT%NOTFOUND;
        
        --출력
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_NAME);
        
    END LOOP;
    
    --커서 클로즈
    CLOSE CUR_SUBJECTS_SELECT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>Procedure PRC_SUBJECTS_PRINT이(가) 컴파일되었습니다.
---------------------------------------------------------------------------
--교재등록 프로시저

--교재등록 시퀀스 생성
CREATE SEQUENCE SEQ_TB
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_INSERT
(V_NAME    IN TEXTBOOKS.TB_NAME%TYPE
)
IS
BEGIN
    --INSERT문 수행
    INSERT INTO TEXTBOOKS(TB_CODE, TB_NAME)
    VALUES('TB_' || SEQ_TB.NEXTVAL, V_NAME);
    
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure PRC_TEXTBOOKS_INSERT이(가) 컴파일되었습니다.

----------------------------------------------------------------------------

--교재수정 프로시저

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_UPDATE
( V_CODE    IN TEXTBOOKS.TB_CODE%TYPE
, V_NAME    IN TEXTBOOKS.TB_NAME%TYPE
)
IS
BEGIN
    --UPDATE문 수행
    UPDATE TEXTBOOKS
    SET TB_NAME = V_NAME
    WHERE TB_CODE = V_CODE;
    
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

----------------------------------------------------------------------------

--교재삭제 프로시저

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_DELETE
( V_CODE    IN TEXTBOOKS.TB_CODE%TYPE
)
IS
BEGIN
    --DELETE문 수행
    DELETE
    FROM TEXTBOOKS
    WHERE TB_CODE = V_CODE;
    
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;



-- 교재정보출력 프로시저 만들기
-- 교재정보출력프로시저

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_PRINT
IS 
    V_CODE  TEXTBOOKS.TB_CODE%TYPE;
    V_NAME  TEXTBOOKS.TB_NAME%TYPE;
    
 CURSOR CUR_TEXTBOOKS_SELECT
    IS
    SELECT TB_CODE, TB_NAME
    FROM TEXTBOOKS;
BEGIN
    --커서 오픈
    OPEN CUR_TEXTBOOKS_SELECT;
    
    LOOP
        FETCH CUR_TEXTBOOKS_SELECT INTO V_CODE,V_NAME;
        
        EXIT WHEN CUR_TEXTBOOKS_SELECT%NOTFOUND;
        
        --출력
        DBMS_OUTPUT.PUT_LINE('교재명 : ' || V_NAME);
        
    END LOOP;
    
    --커서 클로즈
    CLOSE CUR_TEXTBOOKS_SELECT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>Procedure PRC_TEXTBOOKS_PRINT이(가) 컴파일되었습니다.

----------------------------------------------------------------------------

--수강신청 프로시저(등록,수정,삭제,출력 프로시저)
--수강신청 등록 프로시저

--시퀀스 생성
CREATE SEQUENCE SEQ_RC
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE PRC_RC_INSERT
( V_OCODE   IN REGISTER_COURSES.OC_CODE%TYPE            --시퀀스로 받아오니까 RC_CODE 매개변수 줄 필요X
, V_ID      IN REGISTER_COURSES.ST_ID%TYPE
)
IS
BEGIN
    INSERT INTO REGISTER_COURSES(RC_CODE,OC_CODE,ST_ID)
    VALUES('RC_' || SEQ_RC.NEXTVAL,V_OCODE,V_ID);
        
    --커밋
    COMMIT;
    
    --예외처리
     EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

-------------------------------------------------------------------------------


--수강신청 프로시저(등록,수정,삭제 프로시저)
--수강신청 수정 프로시저
CREATE OR REPLACE PROCEDURE PRC_RC_UPDATE
( V_RCODE   IN REGISTER_COURSES.RC_CODE%TYPE
, V_OCODE   IN REGISTER_COURSES.OC_CODE%TYPE            
, V_ID      IN REGISTER_COURSES.ST_ID%TYPE
)
IS
BEGIN
   UPDATE REGISTER_COURSES
   SET  OC_CODE = V_OCODE,ST_ID = V_ID
   WHERE RC_CODE=V_RCODE;
            
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure REGISTER_COURSES_UPDATE이(가) 컴파일되었습니다.
-----------------------------------------------------------------------------

--수강신청 프로시저(등록,수정,삭제 프로시저)
--수강신청 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_RC_DELETE
( V_RCODE   IN REGISTER_COURSES.RC_CODE%TYPE )
IS
BEGIN
   DELETE 
   FROM REGISTER_COURSES
   WHERE RC_CODE=V_RCODE;
            
    --커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

-------------------------------------------------

-- 권한 여부 확인 함수(최종)
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
    IF( ('ADMIN' OR 'PROCESSOR' OR 'STUDENTS')  <> V_CHECK_ACCOUNT)
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

---------------------------------------------------------------

-- 권한 적용된 예시 (과정 추가 프로시저)
CREATE OR REPLACE PROCEDURE PRC_INSERT_COU_WITH_ACCOUNT
( V_COU_NAME COURSES.COU_NAME%TYPE
, V_ID  IN VARCHAR2
, V_PW  IN VARCHAR2
)
IS
    -- 권한 예외처리 선언
    AUTHORITY_EXCEPTION EXCEPTION;
    NO_ACCOUNT_EXCEPTION EXCEPTION;

    V_CHECK_ACCOUNT VARCHAR2(20);
BEGIN
    V_CHECK_ACCOUNT := FUNC_CHECK_AUTHORITY(V_ID, V_PW);

     -- 계정 존재 여부 확인
    IF('NO_ACCOUNT' = V_CHECK_ACCOUNT)
        THEN RAISE NO_ACCOUNT_EXCEPTION;
    END IF;
    
    -- 계정 권한 확인
    IF('ADMIN' <> V_CHECK_ACCOUNT)
        THEN RAISE AUTHORITY_EXCEPTION;
    END IF;
   
   
    -- 실행부
    INSERT INTO COURSES(COU_CODE, COU_NAME)
    VALUES('COU_'||TO_CHAR(SEQ_COU.NEXTVAL), V_COU_NAME);

    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN AUTHORITY_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20098, '권한이 없습니다.');
                 ROLLBACK;
        WHEN NO_ACCOUNT_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20099, '계정이 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_COU_WITH_ACCOUNT이(가) 컴파일되었습니다.

------------------------------------------------------------------------------

SELECT *
FROM STUDENTS;

-- 추가 기능 권한에 만족하지 못한 계정으로 호출하는 경우
EXEC PRC_INSERT_COU_WITH_ACCOUNT('접근 권한 불가 테스트', 'ST_0001', '1234567');
--==>> ORA-20098: 권한이 없습니다.

-- 없는 계정으로 호출하는 경우
EXEC PRC_INSERT_COU_WITH_ACCOUNT('없는 계정 테스트', 'no_id', 'no_pw');
--==>> ORA-20098: 권한이 없습니다.

---------------------------------------------------------------
-- ○ 개설과정 생성
DESC COURSES;
DESC OPEN_COURSES;

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

-------------------------------------------------------

-- 학생 등록, 수정, 삭제


-- 학생 등록 시퀀스 생성
CREATE SEQUENCE SEQ_STU
START WITH 1
INCREMENT BY 1;


-- 학생 INSERT
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_JUBUN	IN	STUDENTS.JUBUN%TYPE
, V_ST_NAME	IN	STUDENTS.ST_NAME%TYPE
)
IS
BEGIN

    -- INSERT
    INSERT INTO STUDENTS(ST_ID, PW, JUBUN, ST_NAME)
    VALUES(TO_CHAR('ST_' || SEQ_STU.NEXTVAL)
          , V_JUBUN, V_JUBUN, V_ST_NAME);

    -- 예외처리
    EXCEPTION
      WHEN OTHERS
        THEN ROLLBACK;
        
    -- 커밋
    COMMIT;
END;


-- 학생 DELETE
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_DELETE
( V_ST_ID    IN    STUDENTS.ST_ID%TYPE
)
IS
BEGIN
    -- DELETE
    DELETE
    FROM STUDENTS
    WHERE ST_ID = V_ST_ID;
    
    -- 예외처리
    EXCEPTION
        WHEN OTHERS
          THEN  ROLLBACK;
END;

-- 학생 UPDATE
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ST_ID   IN  STUDENTS.ST_ID%TYPE
, V_PW      IN  STUDENTS.PW%TYPE
, V_ST_NAME IN  STUDENTS.ST_NAME%TYPE
)
IS
BEGIN
    -- UPDATE
    UPDATE STUDENTS
    SET PW = V_PW
      , ST_NAME = V_ST_NAME
    WHERE ST_ID = V_ST_ID;

    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
            
END;

--○ 학생 정보 출력
CREATE OR REPLACE PROCEDURE PRC_STU_PRINT
IS
  V_ST_NAME  STUDENTS.ST_NAME%TYPE;
  V_COU_NAME COURSES.COU_NAME%TYPE;
  V_SUB_NAME SUBJECTS.SUB_NAME%TYPE;
  
  V_R_ATD    RESULTS.ATD_RESULT%TYPE;
  V_R_PRC    RESULTS.PRC_RESULT%TYPE;
  V_R_WRT    RESULTS.WRT_RESULT%TYPE;
  
  V_R_TOT    NUMBER(4);
  
  CURSOR CUR_SELECT_STU
  IS
  SELECT STU.ST_NAME, C.COU_NAME, SUB.SUB_NAME
       , R.ATD_RESULT, R.PRC_RESULT, R.WRT_RESULT
  FROM STUDENTS STU, REGISTER_COURSES RC, OPEN_COURSES OC 
     , COURSES C, OPEN_SUBJECTS OS, SUBJECTS SUB, RESULTS R
  WHERE STU.ST_ID = RC.ST_ID
    AND RC.OC_CODE = OC.OC_CODE
    AND OC.COU_CODE = C.COU_CODE
    AND OC.OC_CODE = OS.OC_CODE
    AND (RC.RC_CODE = R.RC_CODE AND OS.OS_CODE = R.OS_CODE);
   
BEGIN
    OPEN CUR_SELECT_STU;
    
    LOOP
        FETCH CUR_SELECT_STU INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME
                                 ,V_R_ATD, V_R_PRC, V_R_WRT;
        
        EXIT WHEN CUR_SELECT_STU%NOTFOUND;
        
        V_R_TOT := V_R_ATD + V_R_PRC + V_R_WRT;
        
        DBMS_OUTPUT.PUT_LINE('학생 이름 : ' || V_ST_NAME
                           || ' / 수강 과정명 : ' || V_COU_NAME
                           || ' / 수강 과목명 : ' || V_SUB_NAME
                           || ' / 수강 과목 총점 : ' || TO_CHAR(V_R_TOT));
    
    END LOOP;
    
    CLOSE CUR_SELECT_STU;
END;
--==>> Procedure PRC_STU_PRINT이(가) 컴파일되었습니다.

-------------------------------------------

-- 교수자 등록, 수정, 삭제 프로시저(관리자 권한) (입력정보 : 교수자 이름, 뒷자리) (기본 패스워드로 주민번호 뒷자리)

-- 1. 교수자 등록 프로시저 (PRC_PROFESSORS_INSERT)

-- 시퀀스 생성
CREATE SEQUENCE SEQ_PRO
NOCACHE;
--==>> Sequence SEQ_PRO이(가) 생성되었습니다.

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_INSERT
( V_PR_NAME     PROFESSORS.PR_NAME%TYPE 
, V_JUBUN       PROFESSORS.JUBUN%TYPE
)
IS  
    USER_DEFINE_ERROR   EXCEPTION;
    V_PR_NAME2          PROFESSORS.PR_NAME%TYPE; 
BEGIN
    -- 주번 뒷자리 맨 앞번호가 '1', '2', '3', 4' 가 아닌 다른 숫자가 들어오면
    -- 예외발생
    IF (SUBSTR(V_JUBUN, 1, 1) NOT IN ('1', '2', '3', '4') )
        THEN RAISE USER_DEFINE_ERROR;   
    END IF;

    -- INSERT 쿼리문
    INSERT INTO PROFESSORS(PRO_ID,PW, JUBUN, PR_NAME)
    VALUES( ('PR_' || TO_CHAR(SEQ_PRO.NEXTVAL)),V_JUBUN, V_JUBUN, V_PR_NAME);
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20020, '정확한 주민번호 뒷자리가 아닙니다.');
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_INSERT이(가) 컴파일되었습니다.


-- 2. 교수자 수정 프로시저(PRC_PROFESSORS_UPDATE)(입력 : 바꿀이름, 바꿀비번, 교수ID)
--    이름만 수정할 시, 새로 수정할 이름과 기존의 비번 그리고 교수ID를 넘겨주고
--    새로운 정보가 UPDATE 되도록하는 프로시저

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_UPDATE
( V_PR_NAME    PROFESSORS.PR_NAME%TYPE
, V_PW          PROFESSORS.PW%TYPE
, V_PRO_ID      PROFESSORS.PRO_ID%TYPE
)
IS
BEGIN
    -- UPDATE 쿼리문
    UPDATE PROFESSORS
    SET PR_NAME = V_PR_NAME, PW = V_PW
    WHERE PRO_ID = V_PRO_ID;
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_UPDATE이(가) 컴파일되었습니다.



-- 3. 교수자 삭제 프로시저(PRC_PROFESSORS_DELETE) (입력 : 교수ID)

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_DELETE
( V_PRO_ID      PROFESSORS.PRO_ID%TYPE
)
IS
BEGIN
    -- DELETE 쿼리문
    DELETE
    FROM PROFESSORS
    WHERE PRO_ID = V_PRO_ID;
    
    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

-- 교수자 정보 출력 프로시저(관리자 권한) (PRC_PROFESSORS_PRINT)
-- (출력 정보 : 교수이름, 배정된 과목, 과목기간, 교재명, 강의실, 강의 진행 여부)
CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_PRINT
IS
    -- 주요 변수 선언
    V_PR_NAME      PROFESSORS.PR_NAME%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_CLR_INFO      CLASSROOMS.CLR_INFO%TYPE;
    V_SUB_STATUS    VARCHAR2(20);

    -- 커서변수 선언
    CURSOR  CUR_PRO_SELECT
    IS
    SELECT P.PR_NAME, S.SUB_NAME, OS.S_DATE, OS.E_DATE, T.TB_NAME, C.CLR_INFO
    FROM PROFESSORS P JOIN OPEN_SUBJECTS OS
    ON P.PRO_ID = OS.PRO_ID
                      JOIN SUBJECTS S
                      ON OS.SUB_CODE = S.SUB_CODE
                      JOIN OPEN_COURSES OC
                      ON P.PRO_ID = OC.PRO_ID
                      JOIN CLASSROOMS C
                      ON OC.CLR_CODE = C.CLR_CODE
                      JOIN TEXTBOOKS T
                      ON OS.TB_CODE = T.TB_CODE;
       
BEGIN
    -- 커서 오픈
    OPEN CUR_PRO_SELECT;

    -- 출력 쿼리문
    LOOP
    
    FETCH CUR_PRO_SELECT INTO V_PR_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_CLR_INFO;
    
    EXIT WHEN CUR_PRO_SELECT%NOTFOUND;
    
    -- 강의 진행 여부
    -- 과목 시작일보다 현재날짜가 이르면 = '개강전'
    -- 과목 시작일보다 현재날짜가 뒤고 끝보다 앞이면 = '진행중'
    -- 과목 종료일보다 현재날짜가 뒤면 = '종강'   
    IF (SYSDATE > V_E_DATE)
            THEN V_SUB_STATUS := '강의 종료';
              
    ELSIF (SYSDATE >= V_S_DATE AND SYSDATE <= V_E_DATE)
            THEN V_SUB_STATUS := '강의중';
                 
    ELSIF (SYSDATE < V_S_DATE)
            THEN V_SUB_STATUS := '강의 예정';
    
    ELSE
        V_SUB_STATUS := '준비중';
    END IF;
    
    
    
    -- 출력 
    DBMS_OUTPUT.PUT_LINE(  '교수이름 : ' || V_PR_NAME 
                        || ' 배정된 과목 : ' || V_SUB_NAME
                        || ' 과목기간 : ' || V_S_DATE || ' ~ '|| V_E_DATE
                        || ' 교재명 : ' || V_TB_NAME
                        || ' 강의실 : ' || V_CLR_INFO
                        || ' 강의 진행 여부 : ' || V_SUB_STATUS);
    

    END LOOP;
    
    CLOSE CUR_PRO_SELECT; 
   
END;
--==>> Procedure PRC_PROFESSORS_PRINT이(가) 컴파일되었습니다.

------------------------------------------------------------

-- 강의실
DESC CLASSROOMS;

--○강의실 생성
CREATE SEQUENCE SEQ_CLR
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_CLR이(가) 생성되었습니다.

CREATE OR REPLACE PROCEDURE PRC_INSERT_CLR
( V_CLR_INFO  IN CLASSROOMS.CLR_INFO%TYPE )
IS
BEGIN
    INSERT INTO CLASSROOMS(CLR_CODE, CLR_INFO)
    VALUES ('CLR_' || TO_CHAR(SEQ_CLR.NEXTVAL), V_CLR_INFO);
    
    COMMIT;

    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_CLR이(가) 컴파일되었습니다.

--○강의실 수정
CREATE OR REPLACE PROCEDURE PRC_UPDATE_CLR
( V_CLR_CODE  IN CLASSROOMS.CLR_CODE%TYPE
, V_CLR_INFO  IN CLASSROOMS.CLR_INFO%TYPE )
IS
BEGIN
    UPDATE CLASSROOMS
    SET CLR_INFO = V_CLR_INFO
    WHERE CLR_CODE = V_CLR_CODE;
    
    COMMIT;

    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_UPDATE_CLR이(가) 컴파일되었습니다.


--○강의실 삭제
CREATE OR REPLACE PROCEDURE PRC_DELETE_CLR
( V_CLR_CODE  IN CLASSROOMS.CLR_CODE%TYPE)
IS
BEGIN
    DELETE FROM CLASSROOMS
    WHERE CLR_CODE = V_CLR_CODE;
    
    COMMIT;

    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_DELETE_CLR이(가) 컴파일되었습니다.

--○강의실 출력

CREATE OR REPLACE PROCEDURE PRC_PRINT_CLR
IS
  V_CLR_INFO    CLASSROOMS.CLR_INFO%TYPE;
  V_COU_NAME    COURSES.COU_NAME%TYPE;

  CURSOR CUR_SELECT_CLR
  IS
  SELECT CLR.CLR_INFO, C.COU_NAME
  FROM CLASSROOMS CLR, OPEN_COURSES OS, COURSES C
  WHERE CLR.CLR_CODE = OS.CLR_CODE(+)
    AND OS.COU_CODE = C.COU_CODE;
  
BEGIN
    OPEN CUR_SELECT_CLR;
    
    LOOP
        FETCH CUR_SELECT_CLR INTO V_CLR_INFO, V_COU_NAME;
        
        EXIT WHEN CUR_SELECT_CLR%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('강의실정보 : ' || V_CLR_INFO
                           ||' 과정명 : ' || V_COU_NAME);
    
    END LOOP;
    
    CLOSE CUR_SELECT_CLR;
END;
--==>> Procedure PRC_PRINT_CLR이(가) 컴파일되었습니다.




------------------------------------------------------------

--배점등록 시퀀스
CREATE SEQUENCE SEQ_DIS
INCREMENT BY 1
START WITH 1;



--배점등록 프로시저(교수권한)
CREATE OR REPLACE PROCEDURE PRC_DIS_INSERT
( V_ATD_DIS IN  DISTRIBUTIONS.ATD_DIS%TYPE 
, V_WRT_DIS IN  DISTRIBUTIONS.WRT_DIS%TYPE
, V_PRC_DIS IN  DISTRIBUTIONS.PRC_DIS%TYPE
, V_OS_CODE IN  DISTRIBUTIONS.OS_CODE%TYPE
)
IS
    INERROR EXCEPTION;
BEGIN
    IF(V_ATD_DIS + V_WRT_DIS + V_PRC_DIS != 100)
        THEN RAISE INERROR;
    END IF;
    
    INSERT INTO DISTRIBUTIONS(DIS_CODE, OS_CODE, ATD_DIS, WRT_DIS, PRC_DIS)
           VALUES('DIS_'||SEQ_DIS.NEXTVAL, V_OS_CODE, V_ATD_DIS, V_WRT_DIS, V_PRC_DIS);
    
    COMMIT;

    EXCEPTION
        WHEN INERROR
            THEN    RAISE_APPLICATION_ERROR(-20001, '배점의 총합은 100입니다 맞춰서 넣어주세요~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--배점수정 프로시저(교수권한)
CREATE OR REPLACE PROCEDURE PRC_DIS_UPDATE
( V_DIS_CODE IN DISTRIBUTIONS.DIS_CODE%TYPE
, V_ATD_DIS IN  DISTRIBUTIONS.ATD_DIS%TYPE 
, V_WRT_DIS IN  DISTRIBUTIONS.WRT_DIS%TYPE
, V_PRC_DIS IN  DISTRIBUTIONS.PRC_DIS%TYPE
, V_OS_CODE IN  DISTRIBUTIONS.OS_CODE%TYPE
)
IS
    INERROR EXCEPTION;
BEGIN
    IF(V_ATD_DIS + V_WRT_DIS + V_PRC_DIS != 100)
        THEN RAISE INERROR;
    END IF;
    
    UPDATE DISTRIBUTIONS
    SET DIS_CODE = V_DIS_CODE, ATD_DIS = V_ATD_DIS, WRT_DIS = V_WRT_DIS,
        PRC_DIS = V_PRC_DIS, OS_CODE = V_OS_CODE
    WHERE DIS_CODE = V_DIS_CODE;
    
    COMMIT;
    
    EXCEPTION
        WHEN INERROR
            THEN    RAISE_APPLICATION_ERROR(-20001, '배점의 총합은 100입니다 맞춰서 넣어주세요~');
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--배점삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_DIS_DELETE
( V_DIS_CODE IN DISTRIBUTIONS.DIS_CODE%TYPE
)
IS
    INERROR EXCEPTION;
BEGIN
    
    DELETE
    FROM DISTRIBUTIONS
    WHERE DIS_CODE = V_DIS_CODE;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS
            THEN    ROLLBACK;
END;


----------------------------------------------------------

--개설과목 시퀀스
CREATE SEQUENCE SEQ_OS
INCREMENT BY 1
START WITH 1;

DROP SEQUENCE SEQ_OS;


--개설과목 입력 프로시저
CREATE OR REPLACE PROCEDURE PRC_OS_INSERT
( V_TB_CODE IN  OPEN_SUBJECTS.TB_CODE%TYPE
, V_PRO_ID IN  OPEN_SUBJECTS.PRO_ID%TYPE
, V_SUB_CODE IN  OPEN_SUBJECTS.SUB_CODE%TYPE
, V_OC_CODE IN  OPEN_SUBJECTS.OC_CODE%TYPE
, V_S_DATE IN  OPEN_SUBJECTS.S_DATE%TYPE
, V_E_DATE IN  OPEN_SUBJECTS.E_DATE%TYPE
)
IS
    INSERTERROR EXCEPTION;
    V_COU_START_DATE    OPEN_COURSES.COU_START_DATE%TYPE;
    V_COU_END_DATE      OPEN_COURSES.COU_END_DATE%TYPE;
    
BEGIN
    
    SELECT COU_START_DATE, COU_END_DATE INTO V_COU_START_DATE, V_COU_END_DATE
    FROM OPEN_COURSES
    WHERE OC_CODE = V_OC_CODE;
    
    IF(V_S_DATE < V_COU_START_DATE OR V_E_DATE > V_COU_END_DATE)
        THEN RAISE INSERTERROR;
    END IF;
    
    INSERT INTO OPEN_SUBJECTS(OS_CODE, SUB_CODE, OC_CODE, TB_CODE, PRO_ID, S_DATE, E_DATE)
    VALUES('OS_' || TO_CHAR(SEQ_OS.NEXTVAL), V_SUB_CODE, V_OC_CODE, V_TB_CODE, V_PRO_ID, V_S_DATE, V_E_DATE);
                  
    COMMIT;
    
    EXCEPTION
        WHEN INSERTERROR
            THEN    RAISE_APPLICATION_ERROR(-20002, '과정시작일과 종료일을 확인하세요~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;
    
    

--개설과목 출력 프로시저
CREATE OR REPLACE PROCEDURE PRC_OS_PRINT

IS
    
    V_COU_NAME  COURSES.COU_NAME%TYPE;
    V_CLR_INFO  CLASSROOMS.CLR_INFO%TYPE;
    V_SUB_NAME  SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE    OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE    OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME   TEXTBOOKS.TB_NAME%TYPE;
    V_PR_NAME  PROFESSORS.PR_NAME%TYPE;
    
    --커서생성
    CURSOR CUR_OS_SELECT
    IS
    SELECT SUB.SUB_NAME, CLR.CLR_INFO,COU.COU_NAME, OS.S_DATE, OS.E_DATE, TB.TB_NAME, PRO.PR_NAME  
    FROM OPEN_SUBJECTS OS, CLASSROOMS CLR, SUBJECTS SUB
        ,TEXTBOOKS TB, OPEN_COURSES OC, PROFESSORS PRO, COURSES COU
    WHERE OS.OC_CODE = OC.OC_CODE AND OS.SUB_CODE = SUB.SUB_CODE AND OS.TB_CODE = TB.TB_CODE
      AND OS.PRO_ID = PRO.PRO_ID AND OC.CLR_CODE = CLR.CLR_CODE AND OC.COU_CODE = COU.COU_CODE;
    
    
BEGIN
    
    OPEN CUR_OS_SELECT;
    
    LOOP
        -- 한 행씩 받아옴
        FETCH CUR_OS_SELECT INTO V_SUB_NAME, V_CLR_INFO, V_COU_NAME,
                                V_S_DATE, V_E_DATE, V_TB_NAME, V_PR_NAME;
                                
        
        
        
        -- 데이터가 없으면 루프 종료       
        EXIT WHEN CUR_OS_SELECT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('강의실 : ' || V_CLR_INFO);
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('과목기간 : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('교재명 : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('교수자명 : ' || V_PR_NAME);
        
    END LOOP;
    
    CLOSE CUR_OS_SELECT;
    
    
                  
    COMMIT;
    
END;
    




DESC PROFESSORS;
DESC TEXTBOOKS;







SELECT * FROM PROFESSORS;







--개설과목 수정 프로시저
CREATE OR REPLACE PROCEDURE PRC_OS_UPDATE
( V_OS_CODE IN  OPEN_SUBJECTS.OS_CODE%TYPE
, V_TB_CODE IN  OPEN_SUBJECTS.TB_CODE%TYPE
, V_PRO_ID IN  OPEN_SUBJECTS.PRO_ID%TYPE
, V_SUB_CODE IN  OPEN_SUBJECTS.SUB_CODE%TYPE
, V_OC_CODE IN  OPEN_SUBJECTS.OC_CODE%TYPE
, V_S_DATE IN  OPEN_SUBJECTS.S_DATE%TYPE
, V_E_DATE IN  OPEN_SUBJECTS.E_DATE%TYPE
)
IS
    INSERTERROR EXCEPTION;
    V_COU_START_DATE    OPEN_COURSES.COU_START_DATE%TYPE;
    V_COU_END_DATE      OPEN_COURSES.COU_END_DATE%TYPE;
    
BEGIN
    SELECT COU_START_DATE, COU_END_DATE  INTO V_COU_START_DATE, V_COU_END_DATE
    FROM OPEN_COURSES
    WHERE OC_CODE = V_OC_CODE;
    
    IF(V_S_DATE < V_COU_START_DATE OR V_E_DATE > V_COU_END_DATE)
        THEN RAISE INSERTERROR;
    END IF;
    
    UPDATE OPEN_SUBJECTS
    SET OS_CODE = V_OS_CODE, SUB_CODE = V_SUB_CODE, OC_CODE = V_OC_CODE
        ,TB_CODE = V_TB_CODE, PRO_ID = V_PRO_ID, S_DATE = V_S_DATE, E_DATE = V_E_DATE
    WHERE OS_CODE = V_OS_CODE;
    
    
                  
    COMMIT;
    
    EXCEPTION
        WHEN INSERTERROR
            THEN    RAISE_APPLICATION_ERROR(-20002, '과정시작일과 종료일을 확인하세요~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--개설과정 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_OS_DELETE
( V_OS_CODE IN  OPEN_SUBJECTS.OS_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM OPEN_SUBJECTS
    WHERE OS_CODE = V_OS_CODE;
    
    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;




--중도탈락 시퀀스
CREATE SEQUENCE SEQ_DR
INCREMENT BY 1
START WITH 1;


--중도탈락입력 프로시저
CREATE OR REPLACE PROCEDURE PRC_DR_INSERT
( V_RC_CODE   IN REGISTER_COURSES.RC_CODE%TYPE
, V_DR_REASON IN DROPOUT.DR_REASON%TYPE
)
IS
        
BEGIN
    
    
    INSERT INTO DROPOUT(DR_CODE, RC_CODE, DR_REASON)
            VALUES('DR_' || SEQ_DR.NEXTVAL, V_RC_CODE, V_DR_REASON);
                  
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS
            THEN    ROLLBACK;
END;



--중도탈락 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_DR_DELETE
( V_DR_CODE IN  DROPOUT.DR_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM DROPOUT
    WHERE DR_CODE = V_DR_CODE;
    
    COMMIT;
    
    -- 예외처리    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;



--중도탈락수정 프로시저
CREATE OR REPLACE PROCEDURE PRC_DR_UPDATE
( V_DR_CODE IN DROPOUT.DR_CODE%TYPE
, V_RC_CODE IN REGISTER_COURSES.RC_CODE%TYPE
, V_DR_REASON IN DROPOUT.DR_REASON%TYPE
)
IS
        
BEGIN
    
    UPDATE DROPOUT
    SET DR_CODE = V_DR_CODE, RC_CODE = V_RC_CODE
       , DR_REASON = V_DR_REASON
    WHERE DR_CODE = V_DR_CODE;
                  
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS
            THEN    ROLLBACK;
END;

-----------------------------------------------------

--■■■ 11. 성적 입력(교수자 권한)■■■--

실행 예)
EXEC PRC_RESULTS_INSERT(교수ID, 학생ID, 개설과목코드, 출결점수, 실기점수, 필기점수);

-- 성적 입력 프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_INSERT
( V_PRO_ID      PROFESSORS.PRO_ID%TYPE      -- 교수 ID
, V_ST_ID       STUDENTS.ST_ID%TYPE         -- 학생 ID
, V_OS_CODE     OPEN_SUBJECTS.OS_CODE%TYPE  -- 개설과목코드
, V_ATD_RESULT  RESULTS.ATD_RESULT%TYPE     -- 출결 점수
, V_PRC_RESULT  RESULTS.PRC_RESULT%TYPE     -- 실기 점수
, V_WRT_RESULT  RESULTS.WRT_RESULT%TYPE     -- 필기 점수
)
IS    
    -- 쿼리문 수행에 필요한 변수들 선언
    V_RC_CODE   REGISTER_COURSES.RC_CODE%TYPE;  -- 수강신청 코드
    V_ATD_DIS   DISTRIBUTIONS.ATD_DIS%TYPE;     -- 출석 배점
    V_PRC_DIS   DISTRIBUTIONS.PRC_DIS%TYPE;     -- 실기 배점
    V_WRT_DIS   DISTRIBUTIONS.WRT_DIS%TYPE;     -- 필기 배점
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
    -- 수강신청 코드 변수 초기화
    -- 개설과목, 성적, 수강신청 테이블을 조인해서 입력받은 학생ID의 수강신청 코드로 초기화 하였다.
    SELECT RC.RC_CODE INTO V_RC_CODE
    FROM OPEN_SUBJECTS OS , RESULTS R , REGISTER_COURSES RC 
    WHERE OS.OS_CODE = R.OS_CODE AND R.RC_CODE = RC.RC_CODE
      AND ST_ID = V_ST_ID;
      
    -- 출석 배점 변수 초기화
    SELECT ATD_DIS INTO V_ATD_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- 실기 배점 변수 초기화
    SELECT PRC_DIS INTO V_PRC_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- 필기 배점 변수 초기화
    SELECT WRT_DIS INTO V_WRT_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- 조건문 : 입력받은 출석, 실기, 필기 점수들이 배점 기준을 벗어났는지 체크한다.
    IF ((V_ATD_DIS>=V_ATD_RESULT AND V_ATD_RESULT >=0)
        AND (V_PRC_DIS>=V_PRC_RESULT AND V_PRC_RESULT >=0)
        AND (V_WRT_DIS>=V_WRT_RESULT AND V_WRT_RESULT >=0))
        
        THEN
            -- INSERT 쿼리문 수행
            INSERT INTO RESULTS (RE_CODE, RC_CODE, OS_CODE, RE_DATE, ATD_RESULT, PRC_RESULT, WRT_RESULT)
            VALUES ('RE_' || TO_CHAR(SEQ_RE_CODE.NEXTVAL), V_RC_CODE, V_OS_CODE, SYSDATE
                   , V_ATD_RESULT, V_PRC_RESULT, V_WRT_RESULT);            
    ELSE
        RAISE USER_DEFINE_ERROR;
        
    END IF;
    
    -- 커밋
    COMMIT;
    
    -- 예외 처리
    EXCEPTION         
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20004, '점수가 배점 기준에 맞지 않습니다.'); -- 함수
    WHEN OTHERS
        THEN ROLLBACK;
    
END;

--■■■ 11-2. 성적 수정(교수자 권한)■■■--

실행 예)
EXEC PRC_RESULTS_UPDATE(성적코드, 출결점수, 실기점수, 필기점수);

-- 성적 수정 프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_UPDATE
( V_RE_CODE   RESULTS.RE_CODE%TYPE
, V_ATD_RESULT  RESULTS.ATD_RESULT%TYPE     -- 출결 점수
, V_PRC_RESULT  RESULTS.PRC_RESULT%TYPE     -- 실기 점수
, V_WRT_RESULT  RESULTS.WRT_RESULT%TYPE     -- 필기 점수
)
IS 
    -- 쿼리문 수행에 필요한 변수들 선언
    V_ATD_DIS   DISTRIBUTIONS.ATD_DIS%TYPE;     -- 출석 배점
    V_PRC_DIS   DISTRIBUTIONS.PRC_DIS%TYPE;     -- 실기 배점
    V_WRT_DIS   DISTRIBUTIONS.WRT_DIS%TYPE;     -- 필기 배점
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    -- 배점 변수들 초기화
    SELECT DT.ATD_DIS, DT.PRC_DIS, DT.WRT_DIS INTO V_ATD_DIS, V_PRC_DIS, V_WRT_DIS
    FROM RESULTS R, OPEN_SUBJECTS OS, DISTRIBUTIONS DT
    WHERE R.RE_CODE = V_RE_CODE
      AND OS.OS_CODE = R.OS_CODE
      AND DT.OS_CODE = OS.OS_CODE;
    
      
    
    -- 조건문 : 입력받은 출석, 실기, 필기 점수들이 배점 기준을 벗어났는지 체크한다.
    IF ((V_ATD_DIS>=V_ATD_RESULT AND V_ATD_RESULT >=0)
        AND (V_PRC_DIS>=V_PRC_RESULT AND V_PRC_RESULT >=0)
        AND (V_WRT_DIS>=V_WRT_RESULT AND V_WRT_RESULT >=0))
        
        THEN
            -- UPDATE 쿼리문 수행
            UPDATE RESULTS
            SET ATD_RESULT = V_ATD_RESULT
              , PRC_RESULT = V_PRC_RESULT
              , WRT_RESULT = V_WRT_RESULT
            WHERE RE_CODE = V_RE_CODE;
        
    ELSE
        RAISE USER_DEFINE_ERROR;
        
    END IF;
    
    -- 커밋
    COMMIT;
    
    -- 예외 처리
    EXCEPTION         
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20004, '점수가 배점 기준에 맞지 않습니다.'); -- 함수
    WHEN OTHERS
        THEN ROLLBACK;
    
END;
--==>> Procedure PRC_RESULTS_UPDATE이(가) 컴파일되었습니다.


--■■■ 11-3. 성적 삭제(교수자 권한)■■■--


실행 예)
EXEC PRC_RESULTS_DELETE(성적코드);

-- 성적 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_DELETE
( V_RE_CODE     RESULTS.RE_CODE%TYPE -- 성적 코드
)
IS 
    -- 쿼리문 수행에 필요한 변수들 선언
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN    
    
    DELETE
    FROM RESULTS
    WHERE RE_CODE = V_RE_CODE;
    
    -- 커밋
    COMMIT;
    
END;
--==>> Procedure PRC_RESULTS_DELETE이(가) 컴파일되었습니다.

-------------------------------------------------------------

-- 관리자 성적출력프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_MAN_PRINT
IS
    -- 커서 변수 선언
    CURSOR  CUR_RESULTS_MAN_SELECT
    IS
    SELECT S.ST_NAME, C.COU_NAME, SUB.SUB_NAME
         , OS.S_DATE ,OS.E_DATE, T.TB_NAME
         , R.ATD_RESULT, R.WRT_RESULT, R.PRC_RESULT
         , R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT
         , RANK() OVER(ORDER BY (R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT) DESC)
    FROM RESULTS R JOIN REGISTER_COURSES RC
    ON R.RC_CODE = RC.RC_CODE
                   JOIN STUDENTS S
                   ON S.ST_ID = RC.ST_ID
                   JOIN OPEN_COURSES OC
                   ON OC.OC_CODE = RC.OC_CODE
                   JOIN COURSES C
                   ON C.COU_CODE = OC.COU_CODE
                   JOIN OPEN_SUBJECTS OS
                   ON OC.OC_CODE = OS.OC_CODE
                   JOIN SUBJECTS SUB
                   ON OS.SUB_CODE = SUB.SUB_CODE
                   JOIN TEXTBOOKS T
                   ON OS.TB_CODE = T.TB_CODE;
                   
    V_ST_NAME       STUDENTS.ST_NAME%TYPE;
    V_COU_NAME      COURSES.COU_NAME%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_ATD           RESULTS.ATD_RESULT%TYPE;
    V_WRT           RESULTS.WRT_RESULT%TYPE;
    V_PRC           RESULTS.PRC_RESULT%TYPE;
    V_TOT           RESULTS.PRC_RESULT%TYPE;
    V_RANK          NUMBER;
    
BEGIN
    -- 커서 오픈
    OPEN CUR_RESULTS_MAN_SELECT;
    
    -- FETCH
    LOOP
    
        FETCH CUR_RESULTS_MAN_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_MAN_SELECT%NOTFOUND;
        
        -- 출력
    
        DBMS_OUTPUT.PUT_LINE('학생 이름 : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('교육 기간 : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('교재명 : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('출결점수 : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('필기점수 : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('실기점수 : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('총점 : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('등수 : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
    
    END LOOP;
    
    
    
    -- 커서 클로즈
    CLOSE CUR_RESULTS_MAN_SELECT;
    
END;
--==>> Procedure PRC_RESULTS_MAN_PRINT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

-- 교수 성적출력프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_PRO_PRINT
( V_PRO_ID  IN PROFESSORS.PRO_ID%TYPE
)
IS

    -- 커서 변수
    CURSOR CUR_RESULTS_PRO_SELECT
    IS
    SELECT S.ST_NAME, C.COU_NAME, SUB.SUB_NAME
         , OS.S_DATE ,OS.E_DATE, T.TB_NAME
         , R.ATD_RESULT, R.WRT_RESULT, R.PRC_RESULT
         , R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT
         , RANK() OVER(ORDER BY (R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT) DESC)
    FROM RESULTS R JOIN REGISTER_COURSES RC
    ON R.RC_CODE = RC.RC_CODE
                   JOIN STUDENTS S
                   ON S.ST_ID = RC.ST_ID
                   JOIN OPEN_COURSES OC
                   ON OC.OC_CODE = RC.OC_CODE
                   JOIN COURSES C
                   ON C.COU_CODE = OC.COU_CODE
                   JOIN OPEN_SUBJECTS OS
                   ON OC.OC_CODE = OS.OC_CODE
                   JOIN SUBJECTS SUB
                   ON OS.SUB_CODE = SUB.SUB_CODE
                   JOIN TEXTBOOKS T
                   ON OS.TB_CODE = T.TB_CODE
    WHERE OC.PRO_ID = V_PRO_ID;
                   
    V_ST_NAME       STUDENTS.ST_NAME%TYPE;
    V_COU_NAME      COURSES.COU_NAME%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_ATD           RESULTS.ATD_RESULT%TYPE;
    V_WRT           RESULTS.WRT_RESULT%TYPE;
    V_PRC           RESULTS.PRC_RESULT%TYPE;
    V_TOT           RESULTS.PRC_RESULT%TYPE;
    V_RANK          NUMBER;
                   
BEGIN
    -- 커서 오픈
    OPEN CUR_RESULTS_PRO_SELECT;
    
    -- FETCH
    LOOP
        
        FETCH CUR_RESULTS_PRO_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_PRO_SELECT%NOTFOUND;
        
        -- 출력
            
        DBMS_OUTPUT.PUT_LINE('학생 이름 : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('교육 기간 : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('교재명 : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('출결점수 : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('필기점수 : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('실기점수 : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('총점 : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('등수 : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
         
    END LOOP;
    
    -- 커서 닫기
    CLOSE CUR_RESULTS_PRO_SELECT;
    
END;
--==>> Procedure PRC_RESULTS_PRO_PRINT이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------

-- 학생 성적출력프로시저
CREATE OR REPLACE PROCEDURE PRC_RESULTS_STU_PRINT
( V_ST_ID   IN  STUDENTS.ST_ID%TYPE
)
IS
        -- 커서 변수
    CURSOR CUR_RESULTS_STU_SELECT
    IS
    SELECT S.ST_NAME, C.COU_NAME, SUB.SUB_NAME
         , OS.S_DATE ,OS.E_DATE, T.TB_NAME
         , R.ATD_RESULT, R.WRT_RESULT, R.PRC_RESULT
         , R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT
         , RANK() OVER(ORDER BY (R.ATD_RESULT + R.PRC_RESULT + R.WRT_RESULT) DESC)
    FROM RESULTS R JOIN REGISTER_COURSES RC
    ON R.RC_CODE = RC.RC_CODE
                   JOIN STUDENTS S
                   ON S.ST_ID = RC.ST_ID
                   JOIN OPEN_COURSES OC
                   ON OC.OC_CODE = RC.OC_CODE
                   JOIN COURSES C
                   ON C.COU_CODE = OC.COU_CODE
                   JOIN OPEN_SUBJECTS OS
                   ON OC.OC_CODE = OS.OC_CODE
                   JOIN SUBJECTS SUB
                   ON OS.SUB_CODE = SUB.SUB_CODE
                   JOIN TEXTBOOKS T
                   ON OS.TB_CODE = T.TB_CODE
    WHERE RC.ST_ID = V_ST_ID;
                   
    V_ST_NAME       STUDENTS.ST_NAME%TYPE;
    V_COU_NAME      COURSES.COU_NAME%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_ATD           RESULTS.ATD_RESULT%TYPE;
    V_WRT           RESULTS.WRT_RESULT%TYPE;
    V_PRC           RESULTS.PRC_RESULT%TYPE;
    V_TOT           RESULTS.PRC_RESULT%TYPE;
    V_RANK          NUMBER;

BEGIN
    -- 커서 열기
    OPEN CUR_RESULTS_STU_SELECT;
    
    -- FETCH
    LOOP
        
        FETCH CUR_RESULTS_STU_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_STU_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE('학생 이름 : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('과목명 : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('교육 기간 : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('교재명 : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('출결점수 : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('필기점수 : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('실기점수 : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('총점 : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('등수 : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
        
    END LOOP;
    
    -- 커서 닫기
    CLOSE CUR_RESULTS_STU_SELECT;

END;
--==>> Procedure PRC_RESULTS_STU_PRINT이(가) 컴파일되었습니다.