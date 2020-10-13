SELECT USER
FROM DUAL;
--==>> SCOTT


CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
);
--==>> Table DEPT��(��) �����Ǿ����ϴ�.


CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP��(��) �����Ǿ����ϴ�.


INSERT INTO DEPT VALUES   (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES   (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES   (40,'OPERATIONS','BOSTON');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 14


CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
);
--==>> Table BONUS��(��) �����Ǿ����ϴ�.


CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>> Table SALGRADE��(��) �����Ǿ����ϴ�.


INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

COMMIT;
--==>> Ŀ�� �Ϸ�.





--�� SCOTT ������ �����ִ� ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	    TABLE	
DEPT	    TABLE	
EMP	        TABLE	
SALGRADE	TABLE	
*/

SELECT *
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
EMP	        USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
BONUS	    USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
SALGRADE	USERS			VALID	10		1	255	65536	1048576	1	2147483645				YES	N									         1	         1	    N	ENABLED			NO		N	N	NO	DEFAULT	DEFAULT	DEFAULT	DISABLED	NO	NO		DISABLED	YES		DISABLED	DISABLED		NO	NO	YES	DEFAULT
*/


--�� ������ ��ȸ�� ������ ���̺����
--   � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ

SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS
EMP	        USERS
BONUS	    USERS
SALGRADE	USERS
*/

--�� ���̺� ����(���̺�� : TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
(NO     NUMBER
,NAME   VARCHAR2(10)
,ADDR   VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1��(��) �����Ǿ����ϴ�.

--�� ���̺� ����(���̺�� : TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO   NUMBER
, NAME VARCHAR2(10)
, ADDR VARCHAR2(20)
) TABLESPACE TBS_EDUA;
--==>> Table TBL_EXAMPLE2��(��) �����Ǿ����ϴ�.


--�� TBL_EXAMPLE �� TBL_EXAMPLE2 ���̺���
--   ���� � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	        USERS
EMP	            USERS
BONUS	        USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/


--------------------------------------------------------------------------------

--���� ������ �����ͺ��̽� ����--

-- ������ �����͸� ���̺� ���·� ������� ������ ���� ����
-- �׸��� �̵� ������ ���̺�� ���� ���踦 �����Ͽ� ������� ���� ����

/*==========================================
  �� SELECT ���� ó��(PARSING) ����
  
     SELECT �÷���                       -- 5
     FROM ���̺��                       -- 1
     WHERE ������                        -- 2
     GROUP BY �� -> ���� ó��            -- 3
     HAVING (GROUP BY�� ����)������      -- 4
     ORDER BY �� -> ����                 -- 6

==========================================*/

--�� SCOTT ������ ���̺� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
BONUS	        TABLE	    -- ���ʽ�(BONUS) ������ ���̺�
DEPT	        TABLE	    -- �μ�(DEPARTMENTS) ������ ���̺�
EMP	            TABLE	    -- ���(EMPLOYEES) ������ ���̺�
SALGRADE	    TABLE	    -- �޿�(SAL) ��� ������ ���̺�

TBL_EXAMPLE1	TABLE	     
TBL_EXAMPLE2	TABLE	    
*/


--�� �� ���̺��� ������ ��ȸ
SELECT *
FROM BONUS;
--==>> ��ȸ�� ������ �������� ����(��ȸ ��� ����)
-- ���̺� �����ϰ� ���̺��� ������ Ȯ�ε�����
-- �� ���̺� �����Ͱ� �Էµ��� ���� ��Ȳ

SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

SELECT *
FROM EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	80/12/17	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	    30
7521	WARD	SALESMAN	7698	81/02/22	1250	500	    30
7566	JONES	MANAGER	    7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01	2850		    30
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10
7788	SCOTT	ANALYST	    7566	87/07/13	3000		    20
7839	KING	PRESIDENT	    	81/11/17	5000		    10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
7876	ADAMS	CLERK	    7788	87/07/13	1100		    20
7900	JAMES	CLERK	    7698	81/12/03	950		        30
7902	FORD	ANALYST	    7566	81/12/03	3000		    20
7934	MILLER	CLERK	    7782	82/01/23	1300		    10
*/

SELECT *
FROM SALGRADE;
--==>>
/*
1	 700	1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/


--�� DEPT ���̺� �����ϴ� �÷��� ���� ��ȸ
DESCRIBE DEPT;
--==>>
/*
Table TBL_EXAMPLE2��(��) �����Ǿ����ϴ�.

�̸�     ��?       ����           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

-- DEPTNO   DNAME   LOC
-- ex(
-- 50       ��ȹ��  ���� -> ������ �Է� ����
-- 60       ���ߺ�       -> ������ �Է� ����
-- 70               ��õ -> ������ �Է� ����
--          �λ��  ���� -> ������ �Է� �Ұ���~!!!


--------------------------------------------------------------------------------
--���� ����Ŭ�� �ֿ� �ڷ���(DATA TYPE) ����--
/*
cf) MSSQL ������ ���� ǥ�� Ÿ��
    tinyint     0 ~ 255            1byte
    smallint    -32,768 ~ 32,767   2byte
    int         -21�� ~ 21��       4byte
    bigint      ��û ŭ            8byte
    
    MSSQL ������ �Ǽ� ǥ�� Ÿ��
    float, real
    
    MSSQL ������ ���� ǥ�� Ÿ�� 
    decimal, numeric
    
    MSSQL ������ ���� ǥ�� Ÿ��
    char, varchar, Nvarchar
*/

/*
�� ORACLE �� ���� ǥ�� Ÿ���� �� ������ ���ϵǾ� �ִ�.

1. ������ NUMBER       -> -10�� 38��-1 ~ 10�� 38��
          NUMBER(3)    -> -999 ~ 999
          NUMBER(4)    -> -9999 ~ 9999
          NUMBER(4, 1) -> -999.9 ~ 999.9

          
�� ORACLE �� ���� ǥ�� Ÿ��

2. ������ CHAR             -- ������ ũ��
          CHAR(10)         -- ������ 10Byte �Ҹ�
          CHAR(10)        <-- '���ǽ�'         6Byte ������ 10Byte �� �Ҹ�
          CHAR(10)        <-- '������ر�'   10Byte
          CHAR(10)        <-- '����¹�����' 10Byte �� �ʰ��ϹǷ� �Է� �Ұ�
          
          VARCHAR2         -- ������ ũ��
          VARCHAR2(10)    <-- '������'        6Byte
          VARCHAR2(10)    <-- 'ī�尭����'   10Byte
          VARCHAR2(10)    <-- '���������Ͽ�' 10Byte �� �ʰ��ϹǷ� �Է� �Ұ�
         
          NCHAR            -- �����ڵ� ��� ������ ũ��
          NCHAR(10)        -- 10����
          
          NVARCHAR2        -- �����ڵ� ��� ������ ũ��
          NVARCHAR2(10)    -- 10����
          
3. ��¥�� DATE
*/

SELECT HIREDATE
FROM EMP;

DESCRIBE EMP;


--�� ��¥ ���Ŀ� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT HIREDATE
FROM EMP;

SELECT ENAME, HIREDATE
FROM EMP;

SELECT SYSDATE
FROM DUAL;
--==>> 2020-09-22

--�� ��¥ ���Ŀ� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE
FROM DUAL;
--==>> 2020-09-22 12:33:47


--�� EMP ���̺��� �����ȣ, �����, �޿�, Ŀ�̼� �����͸� ��ȸ�Ѵ�.
DESCRIBE EMP;

SELECT EMPNO, ENAME, SAL, COMM
FROM EMP;
--==>>
/*
7369	SMITH	 800	
7499	ALLEN	1600	 300
7521	WARD	1250	 500
7566	JONES	2975	
7654	MARTIN	1250	1400
7698	BLAKE	2850	
7782	CLARK	2450	
7788	SCOTT	3000	
7839	KING	5000	
7844	TURNER	1500	   0
7876	ADAMS	1100	
7900	JAMES	 950	
7902	FORD	3000	
7934	MILLER	1300	
*/


--�� EMP ���̺��� �μ���ȣ�� 20���� �������� �����͵� ��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ ��ȸ

SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ 
FROM EMP
WHERE �μ���ȣ�� 20��;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO�� 20��;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800	    20
7566	JONES	MANAGER	2975	20
7788	SCOTT	ANALYST	3000	20
7876	ADAMS	CLERK	1100	20
7902	FORD	ANALYST	3000	20
*/


SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB ����, SAL "��     ��", DEPTNO"�μ���ȣ"
FROM EMP;

--�� ���̺��� ��ȸ�ϴ� ��������
--   �� �÷��� �̸����� ��Ī(ALIAS)�� �ο��� �� �ִ�.
--   �⺻ ������ [AS "��Ī�̸�"]�� ���·� �ۼ��Ǹ�
--   �� ��, [AS]�� ������ �����ϴ�.
--   ������, [""]�� ������ ��� ��Ī ���� ������ ����� �� ����.
--   ������ �ش� �÷��� ������ �ǹ��ϹǷ�
--   ��Ī(ALIAS)�� �̸� ���ο� ������ ����ؾ� �� ���
--   [""]�� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� �Ѵ�.

--�� EMP ���̺��� �μ���ȣ�� 20���� 30�� �������� �����͵� ��
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--   ��, ��Ī(ALIAS)�� ����Ѵ�.

/*
EMP ���̺���                           �� FROM EMP
�μ���ȣ�� 20���� 30��                   �� ����    �� WHERE �μ���ȣ�� 20���� 30��
�����ȣ, �����, ������, �޿�, �μ���ȣ �� SELECT �÷���
*/

SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ 
FROM EMP
WHERE �μ���ȣ�� 20���� 30��;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20, DEPTNO = 30;

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 || DEPTNO = 30;
--==>> ���� �߻�
/*
ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:
420��, 110������ ���� �߻�
*/

-- AND OR


SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP
WHERE DEPTNO = 20 OR 30;
--==>> ���� �߻�
/*
ORA-00920: invalid relational operator
00920. 00000 -  "invalid relational operator"
*Cause:    
*Action:
439��, 101������ ���� �߻�
*/


--�� ���� ��ȸ ������ IN �����ڸ� Ȱ���Ͽ�
--   ������ ���� ó���� �� ������
--   �� ������ ó�� ����� ���� ����� ��ȯ�Ѵ�.

SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������", SAL"�޿�", DEPTNO"�μ���ȣ"
FROM EMP
WHERE DEPTNO IN (20, 30);


--�� EMP ���̺��� ������ CLERK �� ������� �����͸� ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE ������ CLERK;

SELECT *
FROM EMP
WHERE JOB = CLERK;
--==>> ���� �߻� --> ���� ������ �ƴϱ� ������
/*
ORA-00904: "CLERK": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
485��, 13������ ���� �߻�
*/

SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 12:00:00	    800		20
7876	ADAMS	CLERK	7788	1987-07-13 12:00:00	    1100	20
7900	JAMES	CLERK	7698	1981-12-03 12:00:00	    950		30
7934	MILLER	CLERK	7782	1982-01-23 12:00:00	    1300	10
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


select *
from emp
where job = 'clerk';
--==>> ��ȸ ��� ����

select *
From emp
Where job = 'clerk';
--==>> ��ȸ ��� ����

select *
From emp
Where job = 'CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 12:00:00	    800		20
7876	ADAMS	CLERK	7788	1987-07-13 12:00:00	    1100	20
7900	JAMES	CLERK	7698	1981-12-03 12:00:00	    950		30
7934	MILLER	CLERK	7782	1982-01-23 12:00:00	    1300	10
*/

--�� ����Ŭ��... �Էµ� �������� �� ��ŭ��...
--   ��.��.��. ��ҹ��� ������ �Ѵ�.


--�� EMP ���̺��� ������ CLERK �� ����� ��
--   20�� �μ��� �ٹ��ϴ� �������
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ
FROM EMP
������ CLERK
�μ���ȣ�� 20;

SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������", SAL"�޿�", DEPTNO"�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK'     DEPTNO = 20;

SELECT EMPNO"�����ȣ", ENAME"�����", JOB"������", SAL"�޿�", DEPTNO"�μ���ȣ"
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;

--�� EMP ���̺��� �÷� ������ �����͸� Ȯ���Ͽ�
--   �̿� �Ȱ��� �����Ͱ� ����ִ� ���̺��� ������ �����Ѵ�.
--   (������... EMP1, EMP2, EMP3, EMP4)

-- MY CODE
CREATE TABLE EMP3
( EMPNO NUMBER(4) CONSTRAINT PK_EMP3 PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO3 REFERENCES DEPT
);

SELECT *
FROM EMP3;

DESCRIBE EMP3;

-- TEACHER'S CODE
-- 1. ������ ��� ���̺� Ȯ��
SELECT *
FROM EMP;

-- 2. ��� ���̺��� ���뿡 ���� ���̺� ����
CREATE TABLE TBL_EMP
AS 
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

DESC EMP;


--�� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	(null)
BONUS	        TABLE	(null)	
DEPT	        TABLE	(null)	
EMP	            TABLE	(null)	
SALGRADE	    TABLE	(null)	
TBL_EXAMPLE2	TABLE	(null)	
TBL_EXAMPLE1	TABLE	(null)	
EMP3	        TABLE	(null)	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '��� ����';
--==>> COMMENT��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� �� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	��� ����
BONUS	        TABLE	(null)	
DEPT	        TABLE	(null)	
EMP	            TABLE	(null)	
SALGRADE	    TABLE	(null)	
TBL_EXAMPLE2	TABLE	(null)	
TBL_EXAMPLE1	TABLE	(null)	
EMP3	        TABLE	(null)	
*/

--�� ���� ���� �������
--   TBL_DEPT, TBL_SALGRADE, TBL_BONUS ���̺��� �����Ͽ�
--   �� ���̺� ���� Ŀ��Ʈ ������ 
--   �μ� ����, �޿���� ����, ���ʽ� ���� �� �������� �����Ѵ�.
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_SALGRADE
AS
SELECT *
FROM SALGRADE;
--==>> Table TBL_SALGRADE��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_BONUS
AS
SELECT *
FROM BONUS;
--==>> Table TBL_BONUS��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;

--�� TBL_DEPT ���̺� '�μ� ����' Ŀ��Ʈ �Է�
COMMENT ON TABLE TBL_DEPT IS '�μ� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� TBL_SALGRADE ���̺� '�޿���� ����' Ŀ��Ʈ �Է�
COMMENT ON TABLE TBL_SALGRADE IS '�޿���� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.

--�� TBL_BONUS ���̺� '���ʽ� ����' Ŀ��Ʈ �Է�
COMMENT ON TABLE TBL_BONUS IS '���ʽ� ����';
--==>> Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ ������ �Է� �� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_BONUS	    TABLE	���ʽ� ����
TBL_SALGRADE	TABLE	�޿���� ����
TBL_DEPT	    TABLE	�μ� ����
TBL_EMP	        TABLE	��� ����
TBL_EXAMPLE2	TABLE	(null)
TBL_EXAMPLE1	TABLE	(null)
SALGRADE	    TABLE	(null)
BONUS	        TABLE	(null)
EMP	            TABLE	(null)
DEPT	        TABLE	(null)
*/


--�� �÷� ������ Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
TBL_BONUS	    COMM	        (null)
TBL_SALGRADE	GRADE	          :
DEPT	        LOC	
DEPT	        DEPTNO	
TBL_BONUS	    JOB	
TBL_EXAMPLE2	NAME	
BONUS	        ENAME	
TBL_EXAMPLE2	ADDR	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	DEPTNO	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	JOB	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	ENAME	
EMP	            MGR	
DEPT	        DNAME	
TBL_SALGRADE	HISAL	
TBL_EMP	        HIREDATE	
TBL_DEPT	    LOC	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	SAL	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	HIREDATE	
TBL_EMP	        DEPTNO	
TBL_EXAMPLE1	NAME	
TBL_EMP	        SAL	
EMP	            ENAME	
EMP	            EMPNO	
BONUS	        JOB	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	COMM	
EMP	            HIREDATE	
TBL_EXAMPLE1	NO	
TBL_EXAMPLE2	NO	
TBL_EMP	        EMPNO	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	MGR	
BIN$i5PDYjtCQpG+6VINEizLEg==$0	EMPNO	
TBL_EMP	        MGR	
BONUS	        SAL	
SALGRADE	    HISAL	
TBL_DEPT	    DNAME	
EMP	            JOB	
TBL_EMP	        JOB	
SALGRADE	    GRADE	
TBL_EMP	        ENAME	
TBL_EXAMPLE1	ADDR	
BONUS	        COMM	
TBL_SALGRADE	LOSAL	
TBL_EMP	        COMM	
TBL_BONUS	    ENAME	
EMP	            SAL	
TBL_DEPT	    DEPTNO	
EMP	            COMM	
TBL_BONUS	    SAL	
SALGRADE	    LOSAL	
EMP	            DEPTNO	
*/


--�� �÷� ������ Ŀ��Ʈ ������ Ȯ��(TBL_DEPT ���̺� �Ҽ��� �÷��� ��ȸ)
SELECT TABLE_NAME, COLUMN_NAME, COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';          -- ������ �߰��Ͽ� �ٽ� ��ȸ
--==>>
/*
TBL_DEPT	DEPTNO	    (null)
TBL_DEPT	DNAME	    (null)
TBL_DEPT	LOC	        (null)
*/

--�� ���̺� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ �Է�(����)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ���ȣ';
--==>> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==>> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ� ��ġ';
--==>>Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ �����Ͱ� �Էµ� ���̺�(TBL_DEPT)��
--   �÷� ������ Ŀ��Ʈ ������ Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ���ȣ
TBL_DEPT	DNAME	�μ���
TBL_DEPT	LOC	�μ� ��ġ
*/


--�� TBL_EMP ���̺��� �������
--   ���̺� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ������ �Է�(����)
DESC TBL_EMP;

-- �����ȣ, �����, ������, ������ �����ȣ, �Ի���, �޿�, ����, �μ���ȣ
COMMENT ON COLUMN TBL_EMP.EMPNO IS '�����ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB IS '������';
COMMENT ON COLUMN TBL_EMP.MGR IS '������ �����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	�����ȣ
TBL_EMP	ENAME	�����
TBL_EMP	JOB	������
TBL_EMP	MGR	������ �����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	�޿�
TBL_EMP	COMM	����
TBL_EMP	DEPTNO	�μ���ȣ
*/


--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ �����͸� ���� �� �ִ� �÷� �߰�
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.
-- �ֹε�Ϲ�ȣ ���� ��쿡�� ��ȣ���� �����Ǿ� �ֱ� ������
-- VARCHAR ó�� ���ڿ� ũ���� ������ ����.

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234

SELECT 01012341234
FROM DUAL;
--==>> 1012341234  -> ���� Ÿ������ ������ �տ� 0�� �ִ� ��� �����ȴ�.
