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


DESC STUDENTS;
DESC OPEN_COURSES;
DESC COURSES;
DESC REGISTER_COURSES;
DESC OPEN_SUBJECTS
DESC SUBJECTS;
DESC RESULTS;

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
                           || '���� ������ : ' || V_COU_NAME
                           || '���� ����� : ' || V_SUB_NAME
                           || '���� ���� ���� : ' || TO_CHAR(V_R_TOT));
    
    END LOOP;
    
    CLOSE CUR_SELECT_STU;
END;
--==>> Procedure PRC_STU_PRINT��(��) �����ϵǾ����ϴ�.

SELECT *
FROM PROFESSORS;

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

SELECT *
FROM STUDENTS;

-- �߰� ��� ���ѿ� �������� ���� �������� ȣ���ϴ� ���
EXEC PRC_INSERT_COU_WITH_ACCOUNT('���� ���� �Ұ� �׽�Ʈ', 'ST_0001', '1234567');
--==>> ORA-20098: ������ �����ϴ�.

-- ���� �������� ȣ���ϴ� ���
EXEC PRC_INSERT_COU_WITH_ACCOUNT('���� ���� �׽�Ʈ', 'no_id', 'no_pw');
--==>> ORA-20098: ������ �����ϴ�.

SELECT *
FROM ADMIN;

EXEC PRC_INSERT_COU_WITH_ACCOUNT('���� ���� �׽�Ʈ��', 'ADM_0001', '1223344');
--==>> 

SELECT *
FROM COURSES;

DESC DISTRIBUTIONS;

-- ���� ���ν��� ���� �ذ� ����
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
    
    V_RC_CODE   RESISTER_COURSES.RC_CODE%TYPE;
    V_OS_CODE   OPEN_SUBJECTS.OS_CODE%TYPE;
    V_OC_CODE   OPEN_COUSES.OC_CODE%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    /*RE_CODE�� ���� 3���� �޾Ƽ� ������ ������Ʈ �ؾ��ϴµ� 
    �� �������� �������ؿ� �´��� ������ߵż� 
    ���� ������ ������ŵ�� .. 
    ���ǹ����� ������ .. 
    �ٵ� �� ������������ �ʱ�ȭ ���ϰھ�� 
    ������ �������ھ�� ;;*/
    
    -- ������ ���������� �ְ� ������������ �������ΰ����� �´�.
    
    SELECT * 
    FROM RESULTS;
    
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






