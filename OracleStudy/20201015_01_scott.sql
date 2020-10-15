SELECT USER
FROM DUAL;
--==>> SCOTT


--���� UPDATE ����--

-- 1. ���̺��� ���� �����͸� ����(����)�ϴ� ����

-- 2. ���� �� ����
-- UPDATE ���̺��
-- SET �÷��� = �����Ұ�[, �÷��� = �����Ұ�, ...]
-- [WHERE ������];

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� �����ȣ 1004�� �����
--   �ֹι�ȣ�� [ 8802031234567 ] �� �����Ѵ�.

UPDATE TBL_SAWON
SET �ֹι�ȣ = '8802031234567'
WHERE �����ȣ 1004;

UPDATE TBL_SAWON
SET JUBUN = '8802031234567'
WHERE SANO = 1004;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT*
FROM TBL_SAWON;
--==>> 1004	������	8802031234567	1990-09-20	2000

--�� ���� �� COMMIT �Ǵ� ROLLBACK �� �ݵ�� ���������� ����
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� 1005�� ����� �Ի��ϰ� �޿���
--   ���� 2020-04-01, 5200 ���� �����Ѵ�.
UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2020-04-01', 'YYYY-MM-DD')
  , SAL = 5200
WHERE SANO = 1005;

SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_INSA;


--�� TBL_INSA ���̺��� ������ ����
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP��(��) �����Ǿ����ϴ�.


-- Ȯ��
SELECT *
FROM TBL_INSABACKUP;


--�� TBL_INSABACKUP ���̺���
--   ������ ����� ���常 ���� 10% �λ� 
UPDATE TBL_INSABACKUP
SET SUDANG = SUDANG * 1.1
WHERE JIKWI IN ('����', '����');

SELECT *
FROM TBL_INSABACKUP;

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_INSABACKUP ���̺���
--   ��ȭ��ȣ�� 016, 017, 018, 019 �� �����ϴ� ��ȭ��ȣ�� ���
--  �̸� ��� 010 ���� �����Ѵ�. 
SELECT *
WHERE SUBSTR(TEL, 1, 3) IN ('016', '017', '018', '019');
--==>> 24�� ��ȸ

UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL, 4)
WHERE SUBSTR(TEL, 1, 3) BETWEEN '016' AND '019';
--==>> 24�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_INSABACKUP;

COMMIT;


--------------------------------------------------------------------------------

-- DATA DICTIONARY �� ������ �� 3����
DBA_.... -- 

USER_.... -- OWNER�� '��'�� ��ü�鸸 ��ȸ

ALL_.... -- SCOTT�� ������ ��� ��ü

SELECT *
FROM ALL_CONSTRAINTS;

SELECT *
FROM ALL_CONS_COLUMNS;


-- �ڽ� ���̺��� �ڽ��÷��� �����ϴ� �θ����̺�� �θ��÷��� ã�� ���� SQL ����
SELECT FK.COSNTRAINT_NAME, FK.TABLE_NAME "�ڽ����̺�", FC.COLUMN_NAME "�ڽ��÷�"
     , PK.TABLE_NAME "�θ����̺�", PC.COLUMN_NAME "�θ��÷�"
FROM ALL_CONSTRAINTS FK, ALL_CONSTRAINTS PK, ALL_CONS_COLUMNS FC, ALL_CONS_COLUMNS PC
WHERE FK.R_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
  AND FK.CONSTRAINT_NAME = FC.CONSTRAINT_NAME
  AND PK.CONSTRAINT_NAME = PC.CONSTRAINT_NAME
  AND FK.CONSTRAINT_TYPE = 'R'
  AND PK.CONSTRAINT_TYPE = 'P'
  AND FK.TABLE_NAME = '�ڽ����̺��� ���̺��';


-- �ڽ����̺� EMP�� �ܷ�Ű �÷��� ���� �θ����̺�� �θ� �÷� ã��
SELECT FK.CONSTRAINT_NAME, FK.TABLE_NAME "�ڽ����̺�", FC.COLUMN_NAME "�ڽ��÷�"
     , PK.TABLE_NAME "�θ����̺�", PC.COLUMN_NAME "�θ��÷�"
FROM ALL_CONSTRAINTS FK, ALL_CONSTRAINTS PK, ALL_CONS_COLUMNS FC, ALL_CONS_COLUMNS PC
WHERE FK.R_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
  AND FK.CONSTRAINT_NAME = FC.CONSTRAINT_NAME
  AND PK.CONSTRAINT_NAME = PC.CONSTRAINT_NAME
  AND FK.CONSTRAINT_TYPE = 'R'
  AND PK.CONSTRAINT_TYPE = 'P'
  AND FK.TABLE_NAME = 'EMP';
