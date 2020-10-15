SELECT USER
FROM DUAL;
--==>> HR


--�� EMPLOYEES ���̺��� ������ SALARY �� 10% �λ��Ѵ�.
--   ��, �μ����� 'IT'�� �����鸸 �����Ѵ�.
--   (�� ���濡 ���� ��� Ȯ�� �� ROLLBACK �� �����Ѵ�.)
SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT'); 
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

ROLLBACK;
--==>> �ѹ� �Ϸ�.
                    
                    
--�� EMPLOYEES ���̺��� JOB_TITLE �� [Sales Manager] �� �������
--   SALARY �� �ش� ����(����)�� �ְ�޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���� ������ �� �ֵ��� ó���Ѵ�.
--   (�� ���濡 ���� ��� Ȯ�� �� ROLLBACK �� �����Ѵ�.)

SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;
--==>> Sales Manager = SA_MAN


UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
  AND EXTRACT(YEAR FROM HIRE_DATE) < 2006;
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.           


--�� EMPLOYEES ���̺��� SALARY ��
--   �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
--   Finance -> 10% �λ�
--   Executive -> 15% �λ�
--   Accounting -> 20% �λ�
--   (�� ���濡 ���� ��� Ȯ�� �� ROLLBACK �� �����Ѵ�.)

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = (CASE DEPARTMENT_ID 
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY * 1.1
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY * 1.15
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY * 1.2
                   ELSE SALARY
              END) -- CASE WHEN THEN ELSE END �������� ELSE�� ������ ���������� �ٶ����� �ൿ�� �ƴϴ�.
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting') );
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
                    
ROLLBACK;
--==>> �ѹ� �Ϸ�



--------------------------------------------------------------------------------

--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴ� �� ����ϴ� ����

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

-- EMPLOYEES ���̺� ����(������ ����)
CREATE TABLE TBL_EMPLOYEES
AS
SELECT *
FROM EMPLOYEES;
--==>> Table TBL_EMPLOYEES��(��) �����Ǿ����ϴ�.

DESC EMPLOYEES;

SELECT *
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	2007-06-21	SH_CLERK	2600		124	50

DELETE
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.



--�� EMPLOYEES ���̺��� �������� ������ �����Ѵ�.
--   ��, �μ����� 'IT'�� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ��� ������)
--   �ٸ� ���ڵ忡 ���� �������ϰ� �ִ� ���
--   �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
--   �׿� ���� ������ �˾ƾ� �Ѵ�.

DELETE
FROM TBL_EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME = 'IT');
--==>> 5�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMPLOYEES;

ROLLBACK;
--==>> �ѹ� �Ϸ�.

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME = 'IT');
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)
                      

--------------------------------------------------------------------------------

--���� ��(VIEW) ����--

-- 1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--    �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸��
--    ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸�� ��Ƽ�
--    �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--    ������ ���̺��̶�... �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--    �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̸�
--    �� ������ �����س��� SQL �����̶�� �� �� �ִ�.

-- 2. ���� �� ����
-- CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY]

-- �� ���� �����ʹ� ���������� ����Ǵ°� �ƴϴ�. 
--    ���� ��� �����߾��� SQL �������� ���ư� ���̴�.

-- �� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.


--�� ��(VIEW)�� ���� ��ȸ
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
CITY            NOT NULL VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/


--�� ��(VIEW) �ҽ� Ȯ�� -- CHECK~!!!
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';
--==>> 
/*
VIEW_EMPLOYEES

"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID"

*/

SELECT *
FROM (SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID
);


