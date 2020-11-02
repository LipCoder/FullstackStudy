-- JDBC01_scott.sql

SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� �������� ��ġ�� �ʰ� ���̺� ����
DROP TABLE TBL_MEMBER PURGE;

SELECT *
FROM TAB;
--==>> 
/* 
BIN$L63x8sb8T8GjIoUayVaIzw==$0	TABLE	--> ���� �����뿡 �����ϴ� ���̺�
            :
*/

--�� ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

 
SELECT *
FROM TAB;
--==>> BIN$L63x8sb8T8GjIoUayVaIzw==$�� ���� ��


--�� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, '������', '010-1111-1111')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 1	������	010-1111-1111


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--JDBC01 �� Test002.java ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
2	�ڴٺ�	010-2222-2222
1	������	010-1111-1111
*/



--�� JDBC01 �� Test003.java ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
2	�ڴٺ�	010-2222-2222
3	��¹�	010-3333-3333
4	������	010-4444-4444
1	������	010-1111-1111
*/

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> 
/*
1	������	010-1111-1111
2	�ڴٺ�	010-2222-2222
3	��¹�	010-3333-3333
4	������	010-4444-4444
*/

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY 1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1
;
