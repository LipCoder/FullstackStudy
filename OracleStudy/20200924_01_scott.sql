SELECT USER
FROM DUAL;

--�� ��¥ ǥ�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�� ����
--   1981�� 9�� 28�� ���̿� �Ի��� ��������
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)

SELECT �����, ������, �Ի���
FROM TBL_EMP
WHERE �Ի����� 1981�� 4�� 2�� ���� 1981�� 9�� 28�� ����;

SELECT �����, ������, �Ի���
FROM TBL_EMP
WHERE 1981�� 4�� 2�� <= �Ի��� <= 1981�� 9�� 28��; --( X )

SELECT �����, ������, �Ի���
FROM TBL_EMP
WHERE �Ի����� 1981�� 4�� 2�� ����(�̻�)
      �Ի����� 1981�� 9�� 28�� ����(����);
      
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE �� 1981�� 4�� 2�� �̻�
      HIREDATE �� 1981�� 9�� 28�� ����;

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE �� TO_DATE('1981-04-02', 'YYYY-MM-DD') �̻�
      HIREDATE �� TO_DATE('1981-09-28', 'YYYY-MM-DD') ����;
      
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')
  AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� BETWEEN A AND B
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� TBL_EMP ���̺��� �޿�(SAL)�� 2450 ���� 3000 ������ �������� ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/

DESC TBL_EMP;

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
--==>>
/*
7566	JONES	MANAGER	        7839	1981-04-02	2975	    	20
7654	MARTIN	SALESMAN	    7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	        7839	1981-06-09	2450	    	10
7839	KING	PRESIDENT       		1981-11-17	5000	    	10
7900	JAMES	CLERK	        7698	1981-12-03	950		        30
7902	FORD	ANALYST	        7566	1981-12-03	3000	    	20
7934	MILLER	CLERK	        7782	1982-01-23	1300	    	10
*/

--�� BETWEEN A AND B �� ��¥��, ������, ������ �����Ϳ� ��� ����ȴ�.
--   ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������(������ �迭)
--   ����ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--   ����, BETWEEN A AND B �� �ش� ������ ����Ǵ� ��������
--   ����Ŭ ���������� �ε�ȣ �������� ���·� �ٲ�� ���� ó���ȴ�.
SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';

--�� ASCII()
-- �Ű������� �Ѱܹ��� �ش� ������ �ƽ�Ű �ڵ� ���� ��ȯ�Ѵ�.
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b'), ASCII('s')
FROM DUAL;
--==>> 65	66	97	98	115


SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN'
   OR JOB = 'CLERK';
--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
ȫ�ִ�	SALESMAN	
�����	SALESMAN	
��ʹ�	CLERK	
*/

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');
--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
ȫ�ִ�	SALESMAN	
�����	SALESMAN	
��ʹ�	CLERK	
*/

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = ANY('SALESMAN', 'CLERK');
--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
ȫ�ִ�	SALESMAN	
�����	SALESMAN	
��ʹ�	CLERK	
*/


--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--   ������, �� ���� ������(OR)�� ���� ������ ó���ȴ�.
--   ���� �޸𸮿� ���� ������ �ƴ϶� CPU ó���� ���� �����̱� ������
--   �� �κб��� �����Ͽ� �������� �����ϰ� �Ǵ� ���� ���� �ʴ�.
--   -> [IN] �� [=ANY] �� ���� ������ ȿ���� ������.
--      �̵� ��δ� ���������� [OR] ������ ����Ǿ� ���� ó���ȴ�.


--------------------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>> Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==>> ��ȸ ��� ����
-- ���̺��� ������ ������� �ִ� ����.

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)
*/

--�� ������ ���̺� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '������', '9611111234567', TO_DATE('2005-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '������', '9412212234567', TO_DATE('1999-11-23', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '9503092234567', TO_DATE('2006-08-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '������', '7502031234567', TO_DATE('1990-09-20', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '���ر�', '9606221234567', TO_DATE('2007-10-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '9405222234567', TO_DATE('2010-12-20', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0203044234567', TO_DATE('2012-04-06', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '0506074234567', TO_DATE('2016-08-17', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, 'Ȳ����', '7202022234567', TO_DATE('1998-03-16', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '������', '7505051234567', TO_DATE('1998-03-16', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '6909092234567', TO_DATE('1996-01-10', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUE(1012, '���켱', '0203024234567', TO_DATE('2002-07-14', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '����', '0101013234567', TO_DATE('2002-07-14', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '���ù�', '0402063234567', TO_DATE('2012-08-14', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '�����', '9510302234567', TO_DATE('2010-05-06', 'YYYY-MM-DD'), 4600);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 15

SELECT *
FROM TBL_SAWON;


COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �߰� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1016, '����', '7212121234567', TO_DATE('1995-05-06', 'YYYY-MM-DD'), 2000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� '���ر�' ����� �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE ������� '���ر�';

SELECT *
FROM TBL_SAWON
WHERE SANAME = '���ر�';
--==>> 1005	���ر�	9606221234567	2007-10-10	2000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '���ر�'
--==>> 1005	���ر�	9606221234567	2007-10-10	2000

--�� LIKE : ���� -> �����ϴ�.
--          �λ� -> ~�� ����, ~ó��

--�� WILD CARD(CHARACTER) -> [%]
--   [LIKE]�� �Բ� ���Ǵ� [%]�� ��� ���ڸ� �ǹ��ϰ�
--   [LIKE]�� �Բ� ���Ǵ� [_]�� �ƹ� ���� �� ���� �ǹ��Ѵ�.
SELECT *
FROM TBL_SAWON;


--�� TBL_SAWON ���̺��� ������ [��]���� ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE ������ '��';

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME�� ù ���ڰ� '��';

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '��';
--==>> ��ȸ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';

SELECT SANAME , JUBUN , SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';


--�� TBL_SAWON ���̺��� ������ [��]���� ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
���ر�	9606221234567	2000
������	9405222234567	3000
������	0506074234567	1000
*/


--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� [��]�� �����
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>
/*
���ù�	0402063234567	1000
�����	9510302234567	4600
*/


--�� �߰� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1017, '������', '0603194234567', TO_DATE('2015_01_20', 'YYYY-MM-DD'), 1500);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_SAWON;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_SAWON ���̺��� ����� �̸��� [��]��� ���ڰ�
--   �ϳ��� ���ԵǾ� �ִٸ� �� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE ����� �̸��� '��'��� ����;

SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
1002	������	4000
1003	������	1000
1006	������	3000
1009	Ȳ����	2000
1016	����	2000
*/


--�� TBL_SAWON ���̺��� ����� �̸��� [��]��� ���ڰ�
--   �ϳ��� ���ԵǾ� �ִٸ� �� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';


--�� TBL_SAWON ���̺��� ����� �̸��� [��]��� ���ڰ�
--   �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>>
/*
1008	������	1000
1017	������	1500
*/


--�� TBL_SAWON ���̺��� ����� �̸��� [��]��� ���ڰ�
--   �������� �� �� ����ִ� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';
--==>> 1017	������	1500


--�� TBL_SAWON ���̺��� ��� �̸��� �� ��° ���ڰ� [��]�� �����
--   �����ȣ, �����, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '_��%';
--==>>
/*
1003	������	1000
1004	������	2000
*/

--�� TBL_SAWON ���̺��� ������ [��]���� �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';

--�� �����ͺ��̽� ���� ��������
--   ���� �̸��� �и��Ͽ� ó���ؾ� �� ���� ��ȹ�� �ִٸ�
--   (���� ������ �ƴϴ���...)
--   ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.


--�� TBL_SAWON ���̺��� ���������� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' 
   OR JUBUN LIKE '______4%';
--==>>
/*
������	    9412212234567	4000
������	    9503092234567	1000
������	    9405222234567	3000
Ȳ����	    7202022234567	2000
������	6909092234567	1000
�����	    9510302234567	4600
������	    0203044234567	1000
������	    0506074234567	1000
������	    0603194234567	1500
*/


--�� �ǽ� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME     VARCHAR2(20)
, BIGO           VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_WATCH)
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�', '�� ������ 99.99���� ȹ���� �ְ�� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

--�� Ȯ��
SELECT *
FROM TBL_WATCH;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ְ�� �ð�
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_WATCH ���̺��� ���(BIGO) �÷���
--   [99.99%]��� ���ڰ� ���Ե�(����ִ� ��(���ڵ�)��
--   �����͸� ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO = '99.99%';
--==>> ��ȸ ��� ����.

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ְ�� �ð�
*/

--�� ESCAPE 
--�� ESCAPE �� ���� ������ ���� �� ���ڸ� ���ϵ�ī�忡�� Ż����Ѷ�...
--   �Ϲ������� ��� �󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.
--   ��\��, ��$�� ��

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�


--------------------------------------------------------------------------------

--���� COMMIT / ROLLBACK ����--
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�(TBL_DEPT)
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

-- 50�� ���ߺ� ����...
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴϴ�.
-- �޸�(RAM)�� �Էµ� ���̴�.

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
-- 50�� ���ߺ� ����... �� ���� �����Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)

--�� �ٽ� ������ �Է�(TBL_DEPT)
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

-- �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
-- 50�� ���ߺ� ����... �� �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���ķ� DML ����(INSERT, UPDATE, DELETE)�� ���� 
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ����� ����� �� COMMIT �� �ϰ��� ROLLBACK �� �����غ���
--   �ƹ��� �ҿ��� ����.


--�� ������ ����(UPDATE -> TBL_DEPT)
--   �ݵ�� WHERE�� ����Ͽ� � ���̺��� UPDATE ������
--   ��������� �Ѵ�. �׷��� ������ ���̺��� ��� �����Ͱ� UPDATE �ȴ�.
UPDATE TBL_DEPT
SET DNAME = '������', LOC = '���'
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

ROLLBACK;
-- ������Ʈ ���Ŀ��� �ѹ��� �ص� �ٲ��� �ʴ´�.

SELECT *
FROM TBL_DEPT;

COMMIT;


--�� ������ ����(DELETE -> TBL_DEPT)
--   ������ �Ҷ��� ������ �����͸� �̸� SELECT�� ��ȸ����!
DELETE TBL_DEPT
WHERE DEPTNO = 50;

DELETE
FROM TBL_DEPT
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_DEPT;

ROLLBACK;

COMMIT;

--------------------------------------------------------------------------------

--���� ORDERED BY �� ����--

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP;
--==>>
/*
SMITH	20	CLERK	    800	    9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO ASC;        -- DEPTNO -> ���ı��� -> ASC : ��������                                                 
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO;        -- ASC -> �������� ���� : ���� ����~!!!  
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP
ORDER BY DEPTNO DESC;       -- DESC -> �������� : �������� -> ���� �Ұ�~!!!
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP
ORDER BY ���� DESC; 
--==>>
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	    3000	36000
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	    1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
SMITH	20	CLERK	    800	    9600
*/


SELECT ENAME "�����", DEPTNO "�μ���ȣ", JOB "������", SAL "�޿�"
     , SAL * 12 + NVL(COMM, 0) "����"
FROM EMP
ORDER BY 2; -- ORDER BY DEPTNO -> ORDER BY DEPTNO ASC -> �μ���ȣ ��������
-- EMP ���̺��� ������ �ִ�... ���̺��� ������ �÷� ����(2->ENAME)�� �ƴ϶�
-- SELECT ó���Ǵ� �� ��° �÷�(2->DEPTNO "�μ���ȣ")�� �������� ���ĵǴ� ���� Ȯ��
-- ASC ������ ���� -> �������� ���ĵǴ� ���� Ȯ��
-- ��, [ORDER BY 2] -> [ORDER BY DEPTNO ASC]
--==>>
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST	    3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER	    2850	34200
MARTIN	30	SALESMAN	1250	16400
*/


SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 4;      -- DEPTNO ���� 1�� �������� ����
                    -- SAL ���� 2�� �������� ����
                    
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	    800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER	    2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	    950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/


SELECT ENAME, DEPTNO, JOB, SAL
FROM EMP
ORDER BY 2, 3, 4 DESC;      
-- (1) 2 -> DEPTNO(�μ���ȣ) ���� �������� ����
-- (2) 3 -> JOB(������) ���� �������� ����
-- (3) 4 -> SAL(�޿�) ���� �������� ����
-- (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/
                    
                    
SELECT *
FROM EMP;


--------------------------------------------------------------------------------

--�� CONCAT()
SELECT ENAME || JOB "COL1"
     , CONCAT(ENAME, JOB) "COL2"
FROM EMP;
--==>>
/*
SMITHCLERK	    SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST	    FORDANALYST
MILLERCLERK	    MILLERCLERK
*/


SELECT ENAME || JOB || DEPTNO "COL1"
FROM EMP;

SELECT CONCAT(CONCAT(ENAME, JOB), DEPTNO) "COL1"
FROM EMP;
--==>>
/*
SMITHCLERK20
ALLENSALESMAN30
WARDSALESMAN30
JONESMANAGER20
MARTINSALESMAN30
BLAKEMANAGER30
CLARKMANAGER10
SCOTTANALYST20
KINGPRESIDENT10
TURNERSALESMAN30
ADAMSCLERK20
JAMESCLERK30
FORDANALYST20
MILLERCLERK10
*/

--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
--  CONCAT() �� ���ڿ��� ���ڿ��� ���ս����ִ� ���ڿ� ���� �Լ�������
--  ���������� ���ڳ� ��¥�� ���ڷ� �ٲپ��ִ� ������ ���ԵǾ� �ִ�




/*
obj.substring()
---
 |
 ���ڿ�.substring(n, m);
                  -----
                  n ���� m - 1 ����... (�ε����� 0����)
*/
--�� SUBSTR()   ���� ��� / SUBSTRB()   ����Ʈ ���
SELECT ENAME "COL1"
     , SUBSTR(ENAME, 1, 2) "COL2"
FROM EMP;
--> ���ڿ��� �����ϴ� ����� ���� ���ڿ� ���� �Լ�
--  ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���, TARGET)
--  �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(�ε����� 1���� ����)
--  �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��... ������)
--==>>
/*
SMITH	SM
ALLEN	AL
WARD	WA
JONES	JO
MARTIN	MA
BLAKE	BL
CLARK	CL
SCOTT	SC
KING	KI
TURNER	TU
ADAMS	AD
JAMES	JA
FORD	FO
MILLER	MI
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1'
   OR SUBSTR(JUBUN, 7, 1) = '3';

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�"
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3');
--==>>
/*
1001	������	9611111234567	3000
1004	������	7502031234567	2000
1005	���ر�	9606221234567	2000
1010	������	7505051234567	1000
1013	����	0101013234567	1000
1014	���ù�	0402063234567	1000
1016	����	7212121234567	2000
*/


--�� LENGTH() ���� ��  /  LENGTHB() ����Ʈ ��
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM EMP;
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/


--�� �ֿ� ���� ���� �Ķ���� ��ȸ
SELECT *
FROM NLS_DATABASE_PARAMETERS;
--==>>
/*
NLS_LANGUAGE	        AMERICAN
NLS_TERRITORY	        AMERICA
NLS_CURRENCY	        $
NLS_ISO_CURRENCY	    AMERICA
NLS_NUMERIC_CHARACTERS	.,
NLS_CHARACTERSET	    AL32UTF8
NLS_CALENDAR	        GREGORIAN
NLS_DATE_FORMAT	        DD-MON-RR
NLS_DATE_LANGUAGE	    AMERICAN
NLS_SORT	            BINARY
NLS_TIME_FORMAT	        HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT	DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT	    HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT	DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY	    $
NLS_COMP	            BINARY
NLS_LENGTH_SEMANTICS	BYTE
NLS_NCHAR_CONV_EXCP	    FALSE
NLS_NCHAR_CHARACTERSET	AL16UTF16
NLS_RDBMS_VERSION	    11.2.0.2.0
*/


--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "COL1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"         -- 1
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"         -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"         -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "COL5"            -- 8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL5"         -- 0
FROM DUAL;
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����.. (��� ���ڿ�, TARGET)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--  �� ��° �Ķ���� ���� ã�� �����ϴ�(��ĵ�� �����ϴ�) �ε��� ��ġ
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(�� ��, 1�� ���� ����)
