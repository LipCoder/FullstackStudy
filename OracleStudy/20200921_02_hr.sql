
--�� ���� ������ ����� ���� Ȯ��
SELECT USER
FROM DUAL;
--==>> HR


--�� ���̺� ����(���̺�� : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
(NO     NUMBER(10)
,NAME   VARCHAR2(30)
);
--==>> Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.


--�� ������ ���̺�(HR �� ������ TBL_ORAUSERTEST)��
--   � ���̺����̽��� ������� �ִ��� ��ȸ
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
        :
TBL_ORAUSERTEST	USERS
        :
*/