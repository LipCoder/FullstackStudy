SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBERLIST;


--�� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBERLIST
( ID        VARCHAR2(40)    NOT NULL
, PW        VARCHAR2(100)   NOT NULL
, NAME      VARCHAR2(100)   NOT NULL
, TEL       VARCHAR2(100)
, EMAIL     VARCHAR2(200)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.



--�� ��ȣȭ ��ȣȭ ��Ű���� ��ȣȭ �Լ��� Ȱ���� ������ �Է�
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('SUPERMAN', CRYPTPACK.ENCRYPT('java006$', 'SUPERMAN'), '��¹�', '010-1111-1111', 'ksb@test.com');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBERLIST;
--==>> SUPERMAN	?E?,?	��¹�	010-1111-1111	ksb@test.com



--�� ����Ʈ ��ü ��ȸ ������ ����
SELECT ID, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST
ORDER BY ID;
--> �� �� ����
SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID
;
--==>> SUPERMAN	��¹�	010-1111-1111	ksb@test.com


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ڽ��� ��� ������ �߰�
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('BATMAN', CRYPTPACK.ENCRYPT('1234', 'BATMAN'), '���¹�', '010-2222-2222', 'GSB@test.com');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ����Ʈ ��ü ��ȸ ������ ����
SELECT ID, CRYPTPACK.DECRYPT(PW, ID), NAME, TEL, EMAIL
FROM TBL_MEMBERLIST
ORDER BY ID;
--> �� �� ����
SELECT ID, CRYPTPACK.DECRYPT(PW, ID), NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID
;
--==>> SUPERMAN	��¹�	010-1111-1111	ksb@test.com