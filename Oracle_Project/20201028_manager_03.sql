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


DESC STUDENTS;
DESC OPEN_COURSES;
DESC COURSES;
DESC REGISTER_COURSES;
DESC OPEN_SUBJECTS
DESC SUBJECTS;
DESC RESULTS;

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
                           || '수강 과정명 : ' || V_COU_NAME
                           || '수강 과목명 : ' || V_SUB_NAME
                           || '수강 과목 총점 : ' || TO_CHAR(V_R_TOT));
    
    END LOOP;
    
    CLOSE CUR_SELECT_STU;
END;
--==>> Procedure PRC_STU_PRINT이(가) 컴파일되었습니다.

SELECT *
FROM PROFESSORS;

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

SELECT *
FROM STUDENTS;

-- 추가 기능 권한에 만족하지 못한 계정으로 호출하는 경우
EXEC PRC_INSERT_COU_WITH_ACCOUNT('접근 권한 불가 테스트', 'ST_0001', '1234567');
--==>> ORA-20098: 권한이 없습니다.

-- 없는 계정으로 호출하는 경우
EXEC PRC_INSERT_COU_WITH_ACCOUNT('없는 계정 테스트', 'no_id', 'no_pw');
--==>> ORA-20098: 권한이 없습니다.

SELECT *
FROM ADMIN;

EXEC PRC_INSERT_COU_WITH_ACCOUNT('계정 권한 테스트중', 'ADM_0001', '1223344');
--==>> 

SELECT *
FROM COURSES;

DESC DISTRIBUTIONS;

-- 진주 프로시저 문제 해결 과정
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
    
    V_RC_CODE   RESISTER_COURSES.RC_CODE%TYPE;
    V_OS_CODE   OPEN_SUBJECTS.OS_CODE%TYPE;
    V_OC_CODE   OPEN_COUSES.OC_CODE%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    /*RE_CODE랑 점수 3개를 받아서 성적을 업데이트 해야하는데 
    저 점수들이 배점기준에 맞는지 살펴봐야돼서 
    배점 변수를 만들었거든요 .. 
    조건문에서 쓰려고 .. 
    근데 저 배점변수들을 초기화 못하겠어요 
    배점을 못얻어오겠어요 ;;*/
    
    -- 성적에 개설과목이 있고 개설과목으로 배점으로가지고 온다.
    
    SELECT * 
    FROM RESULTS;
    
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






