SELECT USER
FROM DUAL;
--==>> HR


--�� %TYPE

-- 1. Ư�� ���̺� ���ԵǾ� �ִ� �÷��� �ڷ���(������Ÿ��)�� �����ϴ� ������Ÿ��

-- 2. ���� �� ����
-- ������ ���̺��.�÷���%TYPE [:= �ʱⰪ];


--�� HR.EMPLOYEES ���̺��� Ư�� �����͸� ������ ����
SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

DESC EMPLOYEES;

DECLARE
    --V_NAME  VARCHAR2(20);
    V_NAME  EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
--==>> 
/*
Alexander


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� EMPLOYEES ���̺��� ������� 108�� ���(Nancy)��
--   SALARY �� ������ ��� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

DECLARE
    -- V_SALARY     NUMBER(8, 2);
    V_SALARY   EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO V_SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 108;
    
    DBMS_OUTPUT.PUT_LINE(V_SALARY);
END;
--==>> 
/*
13208.8


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� HR.EMPLOYEES ���̺��� Ư�� ���ڵ� �׸� �������� ������ ����
--   103�� ����� FIRST_NAME, PHONE_NUMBER, EMAIL �׸��� ������ �����Ͽ� ���
DESC EMPLOYEES;
DECLARE
    -- V_F_NAME     VARCHAR2(20);
    -- V_P_NUMBER   VARCHAR2(20);
    -- V_EMAIL      VARCHAR2(25);
    V_F_NAME    EMPLOYEES.FIRST_NAME%TYPE;
    V_P_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
    V_EMAIL     EMPLOYEES.EMAIL%TYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_F_NAME, V_P_NUMBER, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_F_NAME);
    DBMS_OUTPUT.PUT_LINE(V_P_NUMBER);
    DBMS_OUTPUT.PUT_LINE(V_EMAIL);
END;
--==>>
/*
Alexander
590.423.4567
AHUNOLD


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� %ROWTYPE

-- 1. ���̺��� ���ڵ�� ���� ������ ����ü ������ ����(���� ���� �÷�)

-- 2. ���� �� ����
-- ������ ���̺��%ROWTYPE;

DECLARE
    -- V_F_NAME     VARCHAR2(20);
    -- V_P_NUMBER   VARCHAR2(20);
    -- V_EMAIL      VARCHAR2(25);
    
    --V_F_NAME    EMPLOYEES.FIRST_NAME%TYPE;
    --V_P_NUMBER  EMPLOYEES.PHONE_NUMBER%TYPE;
    --V_EMAIL     EMPLOYEES.EMAIL%TYPE;

    -- �ϳ��� ��!
    V_EMP       EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    --DBMS_OUTPUT.PUT_LINE(V_F_NAME);
    --DBMS_OUTPUT.PUT_LINE(V_P_NUMBER);
    --DBMS_OUTPUT.PUT_LINE(V_EMAIL);
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE(V_EMP.PHONE_NUMBER);
    DBMS_OUTPUT.PUT_LINE(V_EMP.EMAIL);
END;
--==>>
/*
Alexander
590.423.4567
AHUNOLD


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� HR.EMPLOYEES ���̺��� ��ü ���ڵ� �׸� �������� ������ ����
--   ��� ����� FIRST_NAME, PHONE_NUMBER, EMAIL �׸��� ������ �����Ͽ� ���

DECLARE
    V_EMP       EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL 
    FROM EMPLOYEES;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME   || ', ' 
                      || V_EMP.PHONE_NUMBER || ', ' 
                      || V_EMP.EMAIL);
END;
--==>> ���� �߻�
--     (ORA-01422: exact fetch returns more than requested number of rows)

--> ���� ���� ��(ROWS) ������ ���� ������ ������ �ϸ�
--  �����ϴ� �� ��ü�� �Ұ���������.

