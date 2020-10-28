SELECT USER
FROM DUAL;
--==>> MANAGER

--���������ν���

--������ ������ ����
CREATE SEQUENCE SEQ_SUB
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_INSERT
( V_NAME    IN SUBJECTS.SUB_NAME%TYPE
)
IS
BEGIN
    
    -- INSERT��
    INSERT INTO SUBJECTS(SUB_CODE, SUB_NAME)
    VALUES('SU_' || SEQ_SUB.NEXTVAL,V_NAME);
    
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure PRC_SUBJECTS_INSERT��(��) �����ϵǾ����ϴ�.


-----------------------------------------------------------------------------
--������� ���ν���

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_UPDATE
( V_CODE    IN SUBJECTS.SUB_CODE%TYPE
, V_NAME    IN SUBJECTS.SUB_NAME%TYPE
)
IS
BEGIN
    -- ������Ʈ��
    UPDATE SUBJECTS
    SET SUB_NAME = V_NAME
    WHERE SUB_CODE = V_CODE;
    
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

----------------------------------------------------------------------------

--������� ���ν���

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_DELETE
( V_CODE    IN SUBJECTS.SUB_CODE%TYPE )
IS
BEGIN
    -- DELETE ��
    DELETE
    FROM SUBJECTS
    WHERE SUB_CODE = V_CODE;
    
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

---------------------------------------------------------------------------
--��������������ν���

CREATE OR REPLACE PROCEDURE PRC_SUBJECTS_PRINT
IS 
    V_CODE  SUBJECTS.SUB_CODE%TYPE;
    V_NAME  SUBJECTS.SUB_NAME%TYPE;
    
 CURSOR CUR_SUBJECTS_SELECT
    IS
    SELECT SUB_CODE, SUB_NAME
    FROM SUBJECTS;
BEGIN
    --Ŀ�� ����
    OPEN CUR_SUBJECTS_SELECT;
    
    LOOP
        FETCH CUR_SUBJECTS_SELECT INTO V_CODE,V_NAME;
        
        EXIT WHEN CUR_SUBJECTS_SELECT%NOTFOUND;
        
        --���
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_NAME);
        
    END LOOP;
    
    --Ŀ�� Ŭ����
    CLOSE CUR_SUBJECTS_SELECT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>Procedure PRC_SUBJECTS_PRINT��(��) �����ϵǾ����ϴ�.
---------------------------------------------------------------------------
--������ ���ν���

--������ ������ ����
CREATE SEQUENCE SEQ_TB
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_INSERT
(V_NAME    IN TEXTBOOKS.TB_NAME%TYPE
)
IS
BEGIN
    --INSERT�� ����
    INSERT INTO TEXTBOOKS(TB_CODE, TB_NAME)
    VALUES('TB_' || SEQ_TB.NEXTVAL, V_NAME);
    
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure PRC_TEXTBOOKS_INSERT��(��) �����ϵǾ����ϴ�.

----------------------------------------------------------------------------

--������� ���ν���

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_UPDATE
( V_CODE    IN TEXTBOOKS.TB_CODE%TYPE
, V_NAME    IN TEXTBOOKS.TB_NAME%TYPE
)
IS
BEGIN
    --UPDATE�� ����
    UPDATE TEXTBOOKS
    SET TB_NAME = V_NAME
    WHERE TB_CODE = V_CODE;
    
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

----------------------------------------------------------------------------

--������� ���ν���

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_DELETE
( V_CODE    IN TEXTBOOKS.TB_CODE%TYPE
)
IS
BEGIN
    --DELETE�� ����
    DELETE
    FROM TEXTBOOKS
    WHERE TB_CODE = V_CODE;
    
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;



-- ����������� ���ν��� �����
-- ��������������ν���

CREATE OR REPLACE PROCEDURE PRC_TEXTBOOKS_PRINT
IS 
    V_CODE  TEXTBOOKS.TB_CODE%TYPE;
    V_NAME  TEXTBOOKS.TB_NAME%TYPE;
    
 CURSOR CUR_TEXTBOOKS_SELECT
    IS
    SELECT TB_CODE, TB_NAME
    FROM TEXTBOOKS;
BEGIN
    --Ŀ�� ����
    OPEN CUR_TEXTBOOKS_SELECT;
    
    LOOP
        FETCH CUR_TEXTBOOKS_SELECT INTO V_CODE,V_NAME;
        
        EXIT WHEN CUR_TEXTBOOKS_SELECT%NOTFOUND;
        
        --���
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_NAME);
        
    END LOOP;
    
    --Ŀ�� Ŭ����
    CLOSE CUR_TEXTBOOKS_SELECT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>Procedure PRC_TEXTBOOKS_PRINT��(��) �����ϵǾ����ϴ�.

----------------------------------------------------------------------------

--������û ���ν���(���,����,����,��� ���ν���)
--������û ��� ���ν���

--������ ����
CREATE SEQUENCE SEQ_RC
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE PRC_RC_INSERT
( V_OCODE   IN REGISTER_COURSES.OC_CODE%TYPE            --�������� �޾ƿ��ϱ� RC_CODE �Ű����� �� �ʿ�X
, V_ID      IN REGISTER_COURSES.ST_ID%TYPE
)
IS
BEGIN
    INSERT INTO REGISTER_COURSES(RC_CODE,OC_CODE,ST_ID)
    VALUES('RC_' || SEQ_RC.NEXTVAL,V_OCODE,V_ID);
        
    --Ŀ��
    COMMIT;
    
    --����ó��
     EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

-------------------------------------------------------------------------------


--������û ���ν���(���,����,���� ���ν���)
--������û ���� ���ν���
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
            
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure REGISTER_COURSES_UPDATE��(��) �����ϵǾ����ϴ�.
-----------------------------------------------------------------------------

--������û ���ν���(���,����,���� ���ν���)
--������û ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_RC_DELETE
( V_RCODE   IN REGISTER_COURSES.RC_CODE%TYPE )
IS
BEGIN
   DELETE 
   FROM REGISTER_COURSES
   WHERE RC_CODE=V_RCODE;
            
    --Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;

-------------------------------------------------

-- ���� ���� Ȯ�� �Լ�(����)
CREATE OR REPLACE FUNCTION FUNC_CHECK_AUTHORITY
( V_ID VARCHAR2
, V_PW VARCHAR2)
RETURN VARCHAR2
IS
    V_NUM   NUMBER(1) := 0;
BEGIN
    -- ������ �˻�
    SELECT COUNT(*) INTO V_NUM 
    FROM ADMIN 
    WHERE ADM_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'ADMIN';
    END IF;
    
    -- ���� �˻�
    SELECT COUNT(*) INTO V_NUM 
    FROM PROFESSORS 
    WHERE PRO_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'PROFESSORS';
    END IF;
    
    -- �л� �˻�
    SELECT COUNT(*) INTO V_NUM 
    FROM STUDENTS 
    WHERE ST_ID = V_ID 
      AND PW = V_PW;  
    
    IF (0 <> V_NUM)
        THEN RETURN 'STUDENTS';
    END IF;

    RETURN 'NO_ACCOUNT';
END;
--==>> Function FUNC_CHECK_AUTHORITY��(��) �����ϵǾ����ϴ�.


-- ����
CREATE OR REPLACE PROCEDURE PRC_TEST
(/*�Ű�������*/
  -- id�� pw�� ����
  V_ID  IN  VARCHAR2
, V_PW  IN  VARCHAR2
)
IS
    /*�����*/
    
    -- ���� ����ó�� ����
    AUTHORITY_EXCEPTION EXCEPTION;
    NO_ACCOUNT_EXCEPTION EXCEPTION;

    V_CHECK_ACCOUNT VARCHAR2(20);
BEGIN

    V_CHECK_ACCOUNT := FUNC_CHECK_AUTHORITY(V_ID, V_PW);

    -- ���� ���ν��� Ȯ��
    IF( ('ADMIN' OR 'PROCESSOR' OR 'STUDENTS')  <> V_CHECK_ACCOUNT)
        THEN RAISE AUTHORITY_EXCEPTION;
    ELSIF('NO_ACCOUNT' = V_CHECK_ACCOUNT)
        THEN RAISE NO_ACCOUNT_EXCEPTION;
    END IF;
    
    
    /*�����*/

    -- ����ó��
    EXCEPTION
        WHEN AUTHORITY_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20098, '������ �����ϴ�.');
                 ROLLBACK;
        WHEN NO_ACCOUNT_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20099, '������ �������� �ʽ��ϴ�.');
                 ROLLBACK;
END;
--==>> Procedure PRC_TEST��(��) �����ϵǾ����ϴ�.

---------------------------------------------------------------

-- ���� ����� ���� (���� �߰� ���ν���)
CREATE OR REPLACE PROCEDURE PRC_INSERT_COU_WITH_ACCOUNT
( V_COU_NAME COURSES.COU_NAME%TYPE
, V_ID  IN VARCHAR2
, V_PW  IN VARCHAR2
)
IS
    -- ���� ����ó�� ����
    AUTHORITY_EXCEPTION EXCEPTION;
    NO_ACCOUNT_EXCEPTION EXCEPTION;

    V_CHECK_ACCOUNT VARCHAR2(20);
BEGIN
    V_CHECK_ACCOUNT := FUNC_CHECK_AUTHORITY(V_ID, V_PW);

     -- ���� ���� ���� Ȯ��
    IF('NO_ACCOUNT' = V_CHECK_ACCOUNT)
        THEN RAISE NO_ACCOUNT_EXCEPTION;
    END IF;
    
    -- ���� ���� Ȯ��
    IF('ADMIN' <> V_CHECK_ACCOUNT)
        THEN RAISE AUTHORITY_EXCEPTION;
    END IF;
   
   
    -- �����
    INSERT INTO COURSES(COU_CODE, COU_NAME)
    VALUES('COU_'||TO_CHAR(SEQ_COU.NEXTVAL), V_COU_NAME);

    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN AUTHORITY_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20098, '������ �����ϴ�.');
                 ROLLBACK;
        WHEN NO_ACCOUNT_EXCEPTION
            THEN RAISE_APPLICATION_ERROR(-20099, '������ �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_COU_WITH_ACCOUNT��(��) �����ϵǾ����ϴ�.

------------------------------------------------------------------------------

SELECT *
FROM STUDENTS;

-- �߰� ��� ���ѿ� �������� ���� �������� ȣ���ϴ� ���
EXEC PRC_INSERT_COU_WITH_ACCOUNT('���� ���� �Ұ� �׽�Ʈ', 'ST_0001', '1234567');
--==>> ORA-20098: ������ �����ϴ�.

-- ���� �������� ȣ���ϴ� ���
EXEC PRC_INSERT_COU_WITH_ACCOUNT('���� ���� �׽�Ʈ', 'no_id', 'no_pw');
--==>> ORA-20098: ������ �����ϴ�.

---------------------------------------------------------------
-- �� �������� ����
DESC COURSES;
DESC OPEN_COURSES;

-- ������ ����
CREATE SEQUENCE SEQ_OC
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_OC��(��) �����Ǿ����ϴ�.
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
    
    -- ����ó��
    EXCEPTION 
        WHEN DATE_EXCEPTION 
            THEN RAISE_APPLICATION_ERROR(-20090, '��¥ �������� �߸��Ǿ����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_OC��(��) �����ϵǾ����ϴ�.

-- �� �������� ����
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
    
    -- ����ó��
    EXCEPTION 
        WHEN DATE_EXCEPTION 
            THEN RAISE_APPLICATION_ERROR(-20090, '��¥ �������� �߸��Ǿ����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_UPDATE_OC��(��) �����ϵǾ����ϴ�.

-- �� �������� ����
CREATE OR REPLACE PROCEDURE PRC_DELETE_OC
( V_OC_CODE              IN  OPEN_COURSES.OC_CODE%TYPE)
IS
BEGIN
    DELETE 
    FROM OPEN_COURSES
    WHERE OC_CODE = V_OC_CODE; 
    
    COMMIT;
    
    -- ����ó��
    EXCEPTION 
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_DELETE_OC��(��) �����ϵǾ����ϴ�.

-- �� �������� ���
-- (������� : ������, ���ǽ�, �����, ���� �Ⱓ, �����, ������ ��)
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


    -- Ŀ�� ����
    CURSOR CUR_OC_SELECT
    IS
    -- ������ JOIN ����� JOIN ����� JOIN �����ڸ�
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
    -- Ŀ�� ����
    OPEN CUR_OC_SELECT;
      
    -- �� �྿ �޾Ƽ� ó��
    LOOP
        -- �� �྿ �޾ƿ�
        FETCH CUR_OC_SELECT INTO V_COU_NAME, V_CLR_INFO, V_SUB_NAME
                               , V_S_DATE, V_E_DATE, V_TB_NAME, V_PR_NAME;
        
        -- �����Ͱ� ������ ���� ����       
        EXIT WHEN CUR_OC_SELECT%NOTFOUND;
        
        -- (������� : ������, ���ǽ�, �����, ���� �Ⱓ, �����, ������ ��)
        DBMS_OUTPUT.PUT_LINE('������ : ' || V_COU_NAME 
                              || ' ���ǽ� : ' || V_CLR_INFO
                              || ' ����� : ' || V_SUB_NAME 
                              || ' ���� �Ⱓ : ' || V_S_DATE || ' ~ ' || V_E_DATE 
                              || ' ����� : ' || V_SUB_NAME 
                              || ' ������ �� : ' || V_PR_NAME);
                            
    END LOOP;
    
    -- Ŀ�� Ŭ����  
    CLOSE CUR_OC_SELECT;
END;
--==>> Procedure PRC_PRINT_OC��(��) �����ϵǾ����ϴ�.

-- Ȯ��
SET SERVEROUTPUT ON;
EXEC PRC_PRINT_OC;


-- �� ���� ����
DESC COURSES;

-- ������ ����
CREATE SEQUENCE SEQ_COU
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_COU��(��) �����Ǿ����ϴ�.

CREATE OR REPLACE PROCEDURE PRC_INSERT_COU
(V_COU_NAME COURSES.COU_NAME%TYPE)
IS
BEGIN

    INSERT INTO COURSES(COU_CODE, COU_NAME)
    VALUES('COU_'||TO_CHAR(SEQ_COU.NEXTVAL), V_COU_NAME);

    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_INSERT_COU��(��) �����ϵǾ����ϴ�.

--�� ���� ����
CREATE OR REPLACE PROCEDURE PRC_UPDATE_COU
( V_COU_CODE COURSES.COU_CODE%TYPE
, V_COU_NAME COURSES.COU_NAME%TYPE)
IS
BEGIN

    UPDATE COURSES
    SET COU_NAME = V_COU_NAME
    WHERE COU_CODE = V_COU_CODE;
    
    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_UPDATE_COU��(��) �����ϵǾ����ϴ�.


--�� ���� ����
CREATE OR REPLACE PROCEDURE PRC_DELETE_COU
( V_COU_CODE COURSES.COU_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM COURSES
    WHERE COU_CODE = V_COU_CODE;
    
    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_DELETE_COU��(��) �����ϵǾ����ϴ�.


--�� ���� ���
CREATE OR REPLACE PROCEDURE PRC_PRINT_COU
IS
    V_COU_NAME  COURSES.COU_NAME%TYPE;
    
    -- Ŀ�� ����
    CURSOR CUR_COU
    IS
    SELECT COU_NAME
    FROM COURSES;
    
BEGIN
    -- Ŀ�� ����
    OPEN CUR_COU;
    
    LOOP 
        FETCH CUR_COU INTO V_COU_NAME;
    
        EXIT WHEN CUR_COU%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_COU_NAME);
    
    END LOOP;
    
    -- Ŀ�� Ŭ����
    CLOSE CUR_COU;
END;
--==>> Procedure PRC_PRINT_COU��(��) �����ϵǾ����ϴ�.

EXEC PRC_PRINT_COU;

-------------------------------------------------------

-- �л� ���, ����, ����


-- �л� ��� ������ ����
CREATE SEQUENCE SEQ_STU
START WITH 1
INCREMENT BY 1;


-- �л� INSERT
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

    -- ����ó��
    EXCEPTION
      WHEN OTHERS
        THEN ROLLBACK;
        
    -- Ŀ��
    COMMIT;
END;


-- �л� DELETE
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_DELETE
( V_ST_ID    IN    STUDENTS.ST_ID%TYPE
)
IS
BEGIN
    -- DELETE
    DELETE
    FROM STUDENTS
    WHERE ST_ID = V_ST_ID;
    
    -- ����ó��
    EXCEPTION
        WHEN OTHERS
          THEN  ROLLBACK;
END;

-- �л� UPDATE
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

    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
            
END;

--�� �л� ���� ���
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
        
        DBMS_OUTPUT.PUT_LINE('�л� �̸� : ' || V_ST_NAME
                           || ' / ���� ������ : ' || V_COU_NAME
                           || ' / ���� ����� : ' || V_SUB_NAME
                           || ' / ���� ���� ���� : ' || TO_CHAR(V_R_TOT));
    
    END LOOP;
    
    CLOSE CUR_SELECT_STU;
END;
--==>> Procedure PRC_STU_PRINT��(��) �����ϵǾ����ϴ�.

-------------------------------------------

-- ������ ���, ����, ���� ���ν���(������ ����) (�Է����� : ������ �̸�, ���ڸ�) (�⺻ �н������ �ֹι�ȣ ���ڸ�)

-- 1. ������ ��� ���ν��� (PRC_PROFESSORS_INSERT)

-- ������ ����
CREATE SEQUENCE SEQ_PRO
NOCACHE;
--==>> Sequence SEQ_PRO��(��) �����Ǿ����ϴ�.

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_INSERT
( V_PR_NAME     PROFESSORS.PR_NAME%TYPE 
, V_JUBUN       PROFESSORS.JUBUN%TYPE
)
IS  
    USER_DEFINE_ERROR   EXCEPTION;
    V_PR_NAME2          PROFESSORS.PR_NAME%TYPE; 
BEGIN
    -- �ֹ� ���ڸ� �� �չ�ȣ�� '1', '2', '3', 4' �� �ƴ� �ٸ� ���ڰ� ������
    -- ���ܹ߻�
    IF (SUBSTR(V_JUBUN, 1, 1) NOT IN ('1', '2', '3', '4') )
        THEN RAISE USER_DEFINE_ERROR;   
    END IF;

    -- INSERT ������
    INSERT INTO PROFESSORS(PRO_ID,PW, JUBUN, PR_NAME)
    VALUES( ('PR_' || TO_CHAR(SEQ_PRO.NEXTVAL)),V_JUBUN, V_JUBUN, V_PR_NAME);
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20020, '��Ȯ�� �ֹι�ȣ ���ڸ��� �ƴմϴ�.');
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_INSERT��(��) �����ϵǾ����ϴ�.


-- 2. ������ ���� ���ν���(PRC_PROFESSORS_UPDATE)(�Է� : �ٲ��̸�, �ٲܺ��, ����ID)
--    �̸��� ������ ��, ���� ������ �̸��� ������ ��� �׸��� ����ID�� �Ѱ��ְ�
--    ���ο� ������ UPDATE �ǵ����ϴ� ���ν���

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_UPDATE
( V_PR_NAME    PROFESSORS.PR_NAME%TYPE
, V_PW          PROFESSORS.PW%TYPE
, V_PRO_ID      PROFESSORS.PRO_ID%TYPE
)
IS
BEGIN
    -- UPDATE ������
    UPDATE PROFESSORS
    SET PR_NAME = V_PR_NAME, PW = V_PW
    WHERE PRO_ID = V_PRO_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_UPDATE��(��) �����ϵǾ����ϴ�.



-- 3. ������ ���� ���ν���(PRC_PROFESSORS_DELETE) (�Է� : ����ID)

CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_DELETE
( V_PRO_ID      PROFESSORS.PRO_ID%TYPE
)
IS
BEGIN
    -- DELETE ������
    DELETE
    FROM PROFESSORS
    WHERE PRO_ID = V_PRO_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_PROFESSORS_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

-- ������ ���� ��� ���ν���(������ ����) (PRC_PROFESSORS_PRINT)
-- (��� ���� : �����̸�, ������ ����, ����Ⱓ, �����, ���ǽ�, ���� ���� ����)
CREATE OR REPLACE PROCEDURE PRC_PROFESSORS_PRINT
IS
    -- �ֿ� ���� ����
    V_PR_NAME      PROFESSORS.PR_NAME%TYPE;
    V_SUB_NAME      SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE        OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE        OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME       TEXTBOOKS.TB_NAME%TYPE;
    V_CLR_INFO      CLASSROOMS.CLR_INFO%TYPE;
    V_SUB_STATUS    VARCHAR2(20);

    -- Ŀ������ ����
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
    -- Ŀ�� ����
    OPEN CUR_PRO_SELECT;

    -- ��� ������
    LOOP
    
    FETCH CUR_PRO_SELECT INTO V_PR_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_CLR_INFO;
    
    EXIT WHEN CUR_PRO_SELECT%NOTFOUND;
    
    -- ���� ���� ����
    -- ���� �����Ϻ��� ���糯¥�� �̸��� = '������'
    -- ���� �����Ϻ��� ���糯¥�� �ڰ� ������ ���̸� = '������'
    -- ���� �����Ϻ��� ���糯¥�� �ڸ� = '����'   
    IF (SYSDATE > V_E_DATE)
            THEN V_SUB_STATUS := '���� ����';
              
    ELSIF (SYSDATE >= V_S_DATE AND SYSDATE <= V_E_DATE)
            THEN V_SUB_STATUS := '������';
                 
    ELSIF (SYSDATE < V_S_DATE)
            THEN V_SUB_STATUS := '���� ����';
    
    ELSE
        V_SUB_STATUS := '�غ���';
    END IF;
    
    
    
    -- ��� 
    DBMS_OUTPUT.PUT_LINE(  '�����̸� : ' || V_PR_NAME 
                        || ' ������ ���� : ' || V_SUB_NAME
                        || ' ����Ⱓ : ' || V_S_DATE || ' ~ '|| V_E_DATE
                        || ' ����� : ' || V_TB_NAME
                        || ' ���ǽ� : ' || V_CLR_INFO
                        || ' ���� ���� ���� : ' || V_SUB_STATUS);
    

    END LOOP;
    
    CLOSE CUR_PRO_SELECT; 
   
END;
--==>> Procedure PRC_PROFESSORS_PRINT��(��) �����ϵǾ����ϴ�.

------------------------------------------------------------

-- ���ǽ�
DESC CLASSROOMS;

--�۰��ǽ� ����
CREATE SEQUENCE SEQ_CLR
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_CLR��(��) �����Ǿ����ϴ�.

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
--==>> Procedure PRC_INSERT_CLR��(��) �����ϵǾ����ϴ�.

--�۰��ǽ� ����
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
--==>> Procedure PRC_UPDATE_CLR��(��) �����ϵǾ����ϴ�.


--�۰��ǽ� ����
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
--==>> Procedure PRC_DELETE_CLR��(��) �����ϵǾ����ϴ�.

--�۰��ǽ� ���

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
        
        DBMS_OUTPUT.PUT_LINE('���ǽ����� : ' || V_CLR_INFO
                           ||' ������ : ' || V_COU_NAME);
    
    END LOOP;
    
    CLOSE CUR_SELECT_CLR;
END;
--==>> Procedure PRC_PRINT_CLR��(��) �����ϵǾ����ϴ�.




------------------------------------------------------------

--������� ������
CREATE SEQUENCE SEQ_DIS
INCREMENT BY 1
START WITH 1;



--������� ���ν���(��������)
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
            THEN    RAISE_APPLICATION_ERROR(-20001, '������ ������ 100�Դϴ� ���缭 �־��ּ���~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--�������� ���ν���(��������)
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
            THEN    RAISE_APPLICATION_ERROR(-20001, '������ ������ 100�Դϴ� ���缭 �־��ּ���~');
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--�������� ���ν���
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

--�������� ������
CREATE SEQUENCE SEQ_OS
INCREMENT BY 1
START WITH 1;

DROP SEQUENCE SEQ_OS;


--�������� �Է� ���ν���
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
            THEN    RAISE_APPLICATION_ERROR(-20002, '���������ϰ� �������� Ȯ���ϼ���~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;
    
    

--�������� ��� ���ν���
CREATE OR REPLACE PROCEDURE PRC_OS_PRINT

IS
    
    V_COU_NAME  COURSES.COU_NAME%TYPE;
    V_CLR_INFO  CLASSROOMS.CLR_INFO%TYPE;
    V_SUB_NAME  SUBJECTS.SUB_NAME%TYPE;
    V_S_DATE    OPEN_SUBJECTS.S_DATE%TYPE;
    V_E_DATE    OPEN_SUBJECTS.E_DATE%TYPE;
    V_TB_NAME   TEXTBOOKS.TB_NAME%TYPE;
    V_PR_NAME  PROFESSORS.PR_NAME%TYPE;
    
    --Ŀ������
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
        -- �� �྿ �޾ƿ�
        FETCH CUR_OS_SELECT INTO V_SUB_NAME, V_CLR_INFO, V_COU_NAME,
                                V_S_DATE, V_E_DATE, V_TB_NAME, V_PR_NAME;
                                
        
        
        
        -- �����Ͱ� ������ ���� ����       
        EXIT WHEN CUR_OS_SELECT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('������ : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('���ǽ� : ' || V_CLR_INFO);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('����Ⱓ : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('�����ڸ� : ' || V_PR_NAME);
        
    END LOOP;
    
    CLOSE CUR_OS_SELECT;
    
    
                  
    COMMIT;
    
END;
    




DESC PROFESSORS;
DESC TEXTBOOKS;







SELECT * FROM PROFESSORS;







--�������� ���� ���ν���
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
            THEN    RAISE_APPLICATION_ERROR(-20002, '���������ϰ� �������� Ȯ���ϼ���~');
            ROLLBACK;
        WHEN OTHERS
            THEN    ROLLBACK;
END;


--�������� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_OS_DELETE
( V_OS_CODE IN  OPEN_SUBJECTS.OS_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM OPEN_SUBJECTS
    WHERE OS_CODE = V_OS_CODE;
    
    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;




--�ߵ�Ż�� ������
CREATE SEQUENCE SEQ_DR
INCREMENT BY 1
START WITH 1;


--�ߵ�Ż���Է� ���ν���
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



--�ߵ�Ż�� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_DR_DELETE
( V_DR_CODE IN  DROPOUT.DR_CODE%TYPE)
IS
BEGIN

    DELETE
    FROM DROPOUT
    WHERE DR_CODE = V_DR_CODE;
    
    COMMIT;
    
    -- ����ó��    
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
END;



--�ߵ�Ż������ ���ν���
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

--���� 11. ���� �Է�(������ ����)����--

���� ��)
EXEC PRC_RESULTS_INSERT(����ID, �л�ID, ���������ڵ�, �������, �Ǳ�����, �ʱ�����);

-- ���� �Է� ���ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_INSERT
( V_PRO_ID      PROFESSORS.PRO_ID%TYPE      -- ���� ID
, V_ST_ID       STUDENTS.ST_ID%TYPE         -- �л� ID
, V_OS_CODE     OPEN_SUBJECTS.OS_CODE%TYPE  -- ���������ڵ�
, V_ATD_RESULT  RESULTS.ATD_RESULT%TYPE     -- ��� ����
, V_PRC_RESULT  RESULTS.PRC_RESULT%TYPE     -- �Ǳ� ����
, V_WRT_RESULT  RESULTS.WRT_RESULT%TYPE     -- �ʱ� ����
)
IS    
    -- ������ ���࿡ �ʿ��� ������ ����
    V_RC_CODE   REGISTER_COURSES.RC_CODE%TYPE;  -- ������û �ڵ�
    V_ATD_DIS   DISTRIBUTIONS.ATD_DIS%TYPE;     -- �⼮ ����
    V_PRC_DIS   DISTRIBUTIONS.PRC_DIS%TYPE;     -- �Ǳ� ����
    V_WRT_DIS   DISTRIBUTIONS.WRT_DIS%TYPE;     -- �ʱ� ����
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
    -- ������û �ڵ� ���� �ʱ�ȭ
    -- ��������, ����, ������û ���̺��� �����ؼ� �Է¹��� �л�ID�� ������û �ڵ�� �ʱ�ȭ �Ͽ���.
    SELECT RC.RC_CODE INTO V_RC_CODE
    FROM OPEN_SUBJECTS OS , RESULTS R , REGISTER_COURSES RC 
    WHERE OS.OS_CODE = R.OS_CODE AND R.RC_CODE = RC.RC_CODE
      AND ST_ID = V_ST_ID;
      
    -- �⼮ ���� ���� �ʱ�ȭ
    SELECT ATD_DIS INTO V_ATD_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- �Ǳ� ���� ���� �ʱ�ȭ
    SELECT PRC_DIS INTO V_PRC_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- �ʱ� ���� ���� �ʱ�ȭ
    SELECT WRT_DIS INTO V_WRT_DIS
    FROM DISTRIBUTIONS DT, OPEN_SUBJECTS OS
    WHERE OS.OS_CODE = DT.OS_CODE
      AND OS.OS_CODE = V_OS_CODE;
    
    -- ���ǹ� : �Է¹��� �⼮, �Ǳ�, �ʱ� �������� ���� ������ ������� üũ�Ѵ�.
    IF ((V_ATD_DIS>=V_ATD_RESULT AND V_ATD_RESULT >=0)
        AND (V_PRC_DIS>=V_PRC_RESULT AND V_PRC_RESULT >=0)
        AND (V_WRT_DIS>=V_WRT_RESULT AND V_WRT_RESULT >=0))
        
        THEN
            -- INSERT ������ ����
            INSERT INTO RESULTS (RE_CODE, RC_CODE, OS_CODE, RE_DATE, ATD_RESULT, PRC_RESULT, WRT_RESULT)
            VALUES ('RE_' || TO_CHAR(SEQ_RE_CODE.NEXTVAL), V_RC_CODE, V_OS_CODE, SYSDATE
                   , V_ATD_RESULT, V_PRC_RESULT, V_WRT_RESULT);            
    ELSE
        RAISE USER_DEFINE_ERROR;
        
    END IF;
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó��
    EXCEPTION         
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20004, '������ ���� ���ؿ� ���� �ʽ��ϴ�.'); -- �Լ�
    WHEN OTHERS
        THEN ROLLBACK;
    
END;

--���� 11-2. ���� ����(������ ����)����--

���� ��)
EXEC PRC_RESULTS_UPDATE(�����ڵ�, �������, �Ǳ�����, �ʱ�����);

-- ���� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_UPDATE
( V_RE_CODE   RESULTS.RE_CODE%TYPE
, V_ATD_RESULT  RESULTS.ATD_RESULT%TYPE     -- ��� ����
, V_PRC_RESULT  RESULTS.PRC_RESULT%TYPE     -- �Ǳ� ����
, V_WRT_RESULT  RESULTS.WRT_RESULT%TYPE     -- �ʱ� ����
)
IS 
    -- ������ ���࿡ �ʿ��� ������ ����
    V_ATD_DIS   DISTRIBUTIONS.ATD_DIS%TYPE;     -- �⼮ ����
    V_PRC_DIS   DISTRIBUTIONS.PRC_DIS%TYPE;     -- �Ǳ� ����
    V_WRT_DIS   DISTRIBUTIONS.WRT_DIS%TYPE;     -- �ʱ� ����
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    -- ���� ������ �ʱ�ȭ
    SELECT DT.ATD_DIS, DT.PRC_DIS, DT.WRT_DIS INTO V_ATD_DIS, V_PRC_DIS, V_WRT_DIS
    FROM RESULTS R, OPEN_SUBJECTS OS, DISTRIBUTIONS DT
    WHERE R.RE_CODE = V_RE_CODE
      AND OS.OS_CODE = R.OS_CODE
      AND DT.OS_CODE = OS.OS_CODE;
    
      
    
    -- ���ǹ� : �Է¹��� �⼮, �Ǳ�, �ʱ� �������� ���� ������ ������� üũ�Ѵ�.
    IF ((V_ATD_DIS>=V_ATD_RESULT AND V_ATD_RESULT >=0)
        AND (V_PRC_DIS>=V_PRC_RESULT AND V_PRC_RESULT >=0)
        AND (V_WRT_DIS>=V_WRT_RESULT AND V_WRT_RESULT >=0))
        
        THEN
            -- UPDATE ������ ����
            UPDATE RESULTS
            SET ATD_RESULT = V_ATD_RESULT
              , PRC_RESULT = V_PRC_RESULT
              , WRT_RESULT = V_WRT_RESULT
            WHERE RE_CODE = V_RE_CODE;
        
    ELSE
        RAISE USER_DEFINE_ERROR;
        
    END IF;
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó��
    EXCEPTION         
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20004, '������ ���� ���ؿ� ���� �ʽ��ϴ�.'); -- �Լ�
    WHEN OTHERS
        THEN ROLLBACK;
    
END;
--==>> Procedure PRC_RESULTS_UPDATE��(��) �����ϵǾ����ϴ�.


--���� 11-3. ���� ����(������ ����)����--


���� ��)
EXEC PRC_RESULTS_DELETE(�����ڵ�);

-- ���� ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_DELETE
( V_RE_CODE     RESULTS.RE_CODE%TYPE -- ���� �ڵ�
)
IS 
    -- ������ ���࿡ �ʿ��� ������ ����
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN    
    
    DELETE
    FROM RESULTS
    WHERE RE_CODE = V_RE_CODE;
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_RESULTS_DELETE��(��) �����ϵǾ����ϴ�.

-------------------------------------------------------------

-- ������ ����������ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_MAN_PRINT
IS
    -- Ŀ�� ���� ����
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
    -- Ŀ�� ����
    OPEN CUR_RESULTS_MAN_SELECT;
    
    -- FETCH
    LOOP
    
        FETCH CUR_RESULTS_MAN_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_MAN_SELECT%NOTFOUND;
        
        -- ���
    
        DBMS_OUTPUT.PUT_LINE('�л� �̸� : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('������ : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('���� �Ⱓ : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('������� : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('�ʱ����� : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('�Ǳ����� : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('���� : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('��� : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
    
    END LOOP;
    
    
    
    -- Ŀ�� Ŭ����
    CLOSE CUR_RESULTS_MAN_SELECT;
    
END;
--==>> Procedure PRC_RESULTS_MAN_PRINT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

-- ���� ����������ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_PRO_PRINT
( V_PRO_ID  IN PROFESSORS.PRO_ID%TYPE
)
IS

    -- Ŀ�� ����
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
    -- Ŀ�� ����
    OPEN CUR_RESULTS_PRO_SELECT;
    
    -- FETCH
    LOOP
        
        FETCH CUR_RESULTS_PRO_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_PRO_SELECT%NOTFOUND;
        
        -- ���
            
        DBMS_OUTPUT.PUT_LINE('�л� �̸� : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('������ : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('���� �Ⱓ : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('������� : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('�ʱ����� : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('�Ǳ����� : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('���� : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('��� : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
         
    END LOOP;
    
    -- Ŀ�� �ݱ�
    CLOSE CUR_RESULTS_PRO_SELECT;
    
END;
--==>> Procedure PRC_RESULTS_PRO_PRINT��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------

-- �л� ����������ν���
CREATE OR REPLACE PROCEDURE PRC_RESULTS_STU_PRINT
( V_ST_ID   IN  STUDENTS.ST_ID%TYPE
)
IS
        -- Ŀ�� ����
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
    -- Ŀ�� ����
    OPEN CUR_RESULTS_STU_SELECT;
    
    -- FETCH
    LOOP
        
        FETCH CUR_RESULTS_STU_SELECT INTO V_ST_NAME, V_COU_NAME, V_SUB_NAME, V_S_DATE, V_E_DATE, V_TB_NAME, V_ATD, V_WRT, V_PRC, V_TOT, V_RANK;
        
        EXIT WHEN CUR_RESULTS_STU_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE('�л� �̸� : ' || V_ST_NAME);
        DBMS_OUTPUT.PUT_LINE('������ : ' || V_COU_NAME);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_SUB_NAME);
        DBMS_OUTPUT.PUT_LINE('���� �Ⱓ : ' || V_S_DATE || ' ~ ' || V_E_DATE);
        DBMS_OUTPUT.PUT_LINE('����� : ' || V_TB_NAME);
        DBMS_OUTPUT.PUT_LINE('������� : ' || V_ATD);
        DBMS_OUTPUT.PUT_LINE('�ʱ����� : ' || V_WRT);
        DBMS_OUTPUT.PUT_LINE('�Ǳ����� : ' || V_PRC);
        DBMS_OUTPUT.PUT_LINE('���� : ' || V_TOT);
        DBMS_OUTPUT.PUT_LINE('��� : ' || V_RANK);
        DBMS_OUTPUT.PUT_LINE('');
        
    END LOOP;
    
    -- Ŀ�� �ݱ�
    CLOSE CUR_RESULTS_STU_SELECT;

END;
--==>> Procedure PRC_RESULTS_STU_PRINT��(��) �����ϵǾ����ϴ�.