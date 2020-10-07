SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� �������
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ���, �ֹ����� �׸����� ��ȸ�Ѵ�.

-- TEACHER'S CODE

-- ��� 1.

SELECT T2.JUNO "�ֹ���ȣ", T1.JECODE "��ǰ�ڵ�", T1.JUSU "�ֹ���", T2.JUDAY "�ֹ�����"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ��� 2. 
SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE T.JECODE IN ('�ٳ���ű', '��īĨ', 'Ȩ����')
  AND T.JUSU IN (10, 20);
  
SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU)
IN (SELECT CONCAT(JECODE, JUSU)
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT CONCAT(JECODE, JUSU)
    FROM TBL_JUMUN);

-- �ٳ���ű 10
-- �ٳ���ű 20  V
-- ��īĨ   10  V
-- ��īĨ   20  V
-- Ȩ����   10
-- Ȩ����   20  V

SELECT T.*
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU)
IN (SELECT CONCAT(JECODE));

-- MY CODE
SELECT J_ALL.JUNO "�ֹ���ȣ", J_ALL.JECODE "��ǰ�ڵ�"
     , J_ALL.JUSU "�ֹ���", J_ALL.JUDAY "�ֹ�����"
FROM
(
    SELECT *
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
) J_ALL,
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) J_INTER
WHERE J_ALL.JECODE = J_INTER.JECODE 
  AND J_ALL.JUSU = J_INTER.JUSU;

--------------------------------------------------------------------------------

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;
--> NATURAL JOIN�� ���� ���ϰ� JOIN �������� 
--  ����Ŭ�� �� ���踦 ����ã����� �ϱ� ������
--  ������ ��������. �ǹ������� �ظ��ϸ� �Ⱦ���.

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING (DEPTNO);
-- �̰� �� ���̴� ��

--------------------------------------------------------------------------------

--�� TBL_EMP ���̺��� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.
DESC TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����"
     , JOB "������", SAL "�޿�"
FROM TBL_EMP
WHERE (SAL) = (SELECT MAX(SAL)
               FROM TBL_EMP);
--==>> 7839	KING	PRESIDENT	5000

-- [=ANY] - ����� ���ϳ��� ����
-- [=ALL] - ��� ����

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >= ALL (SELECT SAL
                  FROM TBL_EMP);
                  
                       
--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ��ϴ� ��� ��
--   �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� ����

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (SELECT MAX(SAL)
             FROM TBL_EMP)
  AND DEPTNO = 20;
--==>> ��ȸ��� ����

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP T
WHERE DEPTNO = 20
  AND SAL >= ALL (SELECT MAX(SAL)
                  FROM TBL_EMP 
                  WHERE DEPTNO = 20);
--==>>
/*
7788	SCOTT	ANALYST	3000
7902	FORD	ANALYST	3000
*/

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE DEPTNO = 20
  AND SAL >= ALL (SELECT SAL
                  FROM TBL_EMP 
                  WHERE DEPTNO = 20);
                  

--�� TBL_EMP ���̺��� ����(Ŀ�̼�:COMM)�� ���� ���� �����
--   �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (SELECT MAX(COMM)
              FROM TBL_EMP
              WHERE COMM IS NOT NULL);
--==>> 7654	MARTIN	30	SALESMAN	1400

-- ���ǻ���
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= ALL (SELECT COMM
              FROM TBL_EMP);
--==>> ��ȸ��� ���� (NULL �� ���ԵǾ� �ֱ� ������)

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= ALL(SELECT NVL(COMM, 0)
                  FROM TBL_EMP);
--==>> 7654	MARTIN	30	SALESMAN	1400

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= ALL(SELECT COMM
                  FROM TBL_EMP
                  WHERE COMM IS NOT NUMM);
--==>> 7654	MARTIN	30	SALESMAN	1400


--�� DISTINCT() �ߺ� ��(���ڵ�)�� �����ϴ� �Լ�

-- �����ڷ� ��ϵ� ������� �����ȣ, �����, ������ �׸��� ��ȸ�Ѵ�.

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO = (������(MGR)�� ��ϵ� ��ȣ);

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (SELECT MGR
                FROM TBL_EMP);
--==>>
/*
7902	FORD	ANALYST
7698	BLAKE	MANAGER
7839	KING	PRESIDENT
7566	JONES	MANAGER
7788	SCOTT	ANALYST
7782	CLARK	MANAGER
*/
                
SELECT MGR
FROM TBL_EMP;
--==>>
/*
7902
7698
7698
7839
7698
7839
7839
7566

7698
7788
7698
7566
7782
7566
7566
7698
7698
7698
*/

-- �ߺ� ����
SELECT DISTINCT(MGR)
FROM TBL_EMP;
--==>>
--==>>
/*
7839

7782
7698
7902
7566
7788
*/

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE EMPNO IN (SELECT DISTINCT(MGR) -- �ߺ����ŷ� �� ������ ���� ������ ����
                FROM TBL_EMP);
--==>> 
/*
7902	FORD	ANALYST
7698	BLAKE	MANAGER
7839	KING	PRESIDENT
7566	JONES	MANAGER
7788	SCOTT	ANALYST
7782	CLARK	MANAGER
*/

--------------------------------------------------------------------------------

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺� ���(������ ����) -> �� ���̺� ���� ���質 �������� ���� ������ ����
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.
-- TBL_SAWON ���̺��� �����͵鸸 ����� ����
-- ��, �ٸ� �̸��� ���̺� ���·� ������ �� ��Ȳ.

SELECT *
FROM TBL_SAWONBACKUP;

--�� �����͸� ����
UPDATE TBL_SAWON
SET SANAME='�ʶ���';
COMMIT;
--==>>
/*
17�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
Ŀ�� �Ϸ�.
*/

ROLLBACK;

SELECT *
FROM TBL_SAWON;

SELECT *
FROM TBL_SAWONBACKUP;



UPDATE TBL_SAWON
SET SANAME = '������'
WHERE SANO = 1001;

UPDATE TBL_SAWON
SET SANAME = '������'
WHERE SANO = 1002;

UPDATE TBL_SAWON
SET SANAME = '������'
WHERE SANO = 1003;

-- �̰� 19�� ������ 10����? �����ȵ�

CREATE TABLE TBL_SAWON
AS
SELECT *
FROM TBL_SAWONBACKUP;
-- �̰͵� �ȵ�(�̹� ���̺��� ������)

UPDATE TBL_SAWON 
SET SANAME = (SELECT SANAME 
              FROM TBL_SAWONBACKUP
              WHERE TBL_SAWON.SANO = SANO)
WHERE SANAME = '�ʶ���';
--==>> 17�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

COMMIT;
              
SELECT *
FROM TBL_SAWON;
