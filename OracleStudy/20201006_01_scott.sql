SELECT USER
FROM DUAL;
--==>> SCOTT


-- OUTER JOIN

-- LEFT, RIGHT ����Ű�� ���̺��� �ֿ�
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 1992 �ڵ忡�� �������� �ʴ� ������ 1999 �ڵ忡���� �����Ѵ�.
SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--�� OUTER JOIN ���� OUTER �� ���� �����ϴ�.
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;



SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
 AND JOB = 'CLERK';
--> �̿� ���� ������� �������� �����ص�
--  ��ȸ ����� ��� ������ ������ ����.

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
--> ������, �̿� ���� �����Ͽ�
--  ��ȸ�ϴ� ���� �����Ѵ�.


--------------------------------------------------------------------------------

--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER �� CLERK �� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
--     E,D       D       E       E      E
DESC EMP;
DESC DEPT;

SELECT D.DEPTNO "�μ���ȣ", D.DNAME "�μ���", E.ENAME "�����"
     , E.JOB "������", E.SAL "�޿�"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB IN ('CLERK', 'MANAGER');
--==>>
/*
10	ACCOUNTING	CLARK	MANAGER	2450
10	ACCOUNTING	MILLER	CLERK	1300
20	RESEARCH	ADAMS	CLERK	1100
20	RESEARCH	JONES	MANAGER	2975
20	RESEARCH	SMITH	CLERK	 800
30	SALES	    BLAKE	MANAGER	2850
30	SALES	    JAMES	CLERK	 950
*/

--�� �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--   �θ� ���̺�(1:�� ���迡�� 1�� �θ�)�� �÷��� ������ �� �ֵ��� ó���ؾ� �Ѵ�.

--�� �� ���̺� ��� ���ԵǾ� �ִ� �ߺ��� �÷��� �ƴϴ���
--   �÷��� �Ҽ� ���̺��� ����� �� �� �ֵ��� �����Ѵ�.


--�� SELF JOIN(�ڱ� ����)

-- EMP ���̺��� �����͸� ������ ���� ��ȸ�� �� �ֵ���
-- �������� �����Ѵ�.
--------------------------------------------------------------------
-- �����ȣ ����� ������ �����ڹ�ȣ �����ڸ� ������������
--------------------------------------------------------------------
SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E1.MGR "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E1.MGR "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;
