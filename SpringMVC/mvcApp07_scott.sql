SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBERLIST PURGE;
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.
DROP TABLE MEMBERRECORD PURGE;
--==>> Table MEMBERRECORD��(��) �����Ǿ����ϴ�.
DROP TABLE MEMBERLIST PURGE;
--==>> Table MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� �ٽ� ����(TBL_MEMBERLIST)
CREATE TABLE TBL_MEMBERLIST
( ID        VARCHAR2(30)
, PW        VARCHAR2(20)
, NAME      VARCHAR2(50)
, TEL       VARCHAR2(50)
, EMAIL     VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(TBL_MEMBERLIST) - ��ȣȭ ó��
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '������', '010-1111-1111', 'admin@test.com');
--> �� �� ����
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '������', '010-1111-1111', 'admin@test.com')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBERLIST;
--==>> admin	???^	������	010-1111-1111	admin@test.com


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ����Ʈ ��ȸ ������ ����(�н������ ����Ʈ ��ȸ �׸񿡼� ����)
SELECT ID, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST
ORDER BY ID;
--> �� �� ����
SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID
;
--==>> admin	������	010-1111-1111	admin@test.com


--�� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 1
