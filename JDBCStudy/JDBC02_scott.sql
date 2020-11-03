-- JDBC02_scott.sql

SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ������ �߶󳻱�
TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> ��ȸ ��� ����


--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է� ������ �غ�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111')
;


--�� �ο��� �ľ� ������ �غ�
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;


--�� ��ü ����Ʈ ��ȸ ������ �غ�
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;

