SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ����
PURGE RECYCLEBIN;


--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--------------------------------------------------------------------------------

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է� �� �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '����ȣ', '010-1111-1111');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '����ȣ', '010-1111-1111')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� ���̺� ��ü ������ ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY 1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1
;
--==>> 1	����ȣ	010-1111-1111


--�� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 1


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '��¹�', '010-2222-2222');

COMMIT;

SELECT *
FROM TBL_MEMBER;






