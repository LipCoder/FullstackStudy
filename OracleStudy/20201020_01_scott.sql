SELECT USER
FROM DUAL;
--==>> SCOTT


--���� ���ν��� �������� ���� ó�� ����--

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ���ν��� ���� �۵����� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('������', '010-1111-1111', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


--�� ���̺� ��ȸ
SELECT *
FROM TBL_MEMBER;
--==>> 1	������	010-1111-1111	����


EXEC PRC_MEMBER_INSERT('������', '010-2222-2222', '�λ�');
--==>> �����߻�
/*
���� ���� -
ORA-20001: ����,���,������ �Է��� �����մϴ�.
ORA-06512: at "SCOTT.PRC_MEMBER_INSERT", line 37
ORA-06512: at line 1
*/


--�� �ǽ� ���̺� ����(TBL_���)
CREATE TABLE TBL_���
( ����ȣ  NUMBER 
, ��ǰ�ڵ�  VARCHAR2(20)
, �������  DATE DEFAULT SYSDATE
, ������  NUMBER
, ���ܰ�  NUMBER
);
--==>> Table TBL_�����(��) �����Ǿ����ϴ�.

-- ����ȣ PK ����
ALTER TABLE TBL_���
ADD CONSTRAINT ���_����ȣ_PK PRIMARY KEY(����ȣ);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

-- ��ǰ�ڵ� FK ����
ALTER TABLE TBL_���
ADD CONSTRAINT ���_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�)
               REFERENCES TBL_��ǰ(��ǰ�ڵ�);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_��ǰ;
SELECT *
FROM TBL_���;


--�� ������ 20�� ��� �׽�Ʈ
EXEC PRC_���_INSERT('C001', 20, 1400);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


SELECT *
FROM TBL_��ǰ;
SELECT *
FROM TBL_���;


--�� �ٹ�� 20�� ��� �׽�Ʈ
EXEC PRC_���_INSERT('H002', 20, 500);
--==>> ���� �߻�
--     (ORA-20002: �������� �����մϴ�.)


SELECT *
FROM TBL_���;

SELECT *
FROM TBL_��ǰ;


EXEC PRC_���_INSERT('H001', 10, 450);
EXEC PRC_���_INSERT('H002', 4, 550);
EXEC PRC_���_INSERT('H003', 16, 550);
EXEC PRC_���_INSERT('C003', 12, 1200);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 4


--�� ������ ���ν��� ���� �۵����� Ȯ�� -> ���ν��� ȣ�� 
EXEC PRC_���_UPDATE(2, 30);
--==>> ���� �߻�
--     (ORA-20002: ���� ����~!!!)


EXEC PRC_���_UPDATE(5, 30);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


--------------------------------------------------------------------------------
--���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����
-- �� DML �۾��� ���� �̺�Ʈ ���

--�� �ǽ� ���̺� ����(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO VARCHAR2(200)
, ILJA DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG��(��) �����Ǿ����ϴ�.



--�� ������ TRIGGER �۵� ���� Ȯ��
--   -> TBL_TEST1 ���̺��� ������� INSERT, UPDATE, DELETE ����
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '��¹�', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '������', '010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '������', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET NAME = '���ر�'
WHERE ID = 1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1;
--==>> 3�� �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_TEST1;
--==>> ��ȸ ��� ����

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT *
FROM TBL_EVENTLOG;
--==>> 
/*
INSERT ������ ����Ǿ����ϴ�.	2020-10-20 16:37:56
INSERT ������ ����Ǿ����ϴ�.	2020-10-20 16:38:20
INSERT ������ ����Ǿ����ϴ�.	2020-10-20 16:38:41
UPDATE ������ ����Ǿ����ϴ�.	2020-10-20 16:39:17
DELETE ������ ����Ǿ����ϴ�.	2020-10-20 16:40:19
*/


--�� ������ TRIGGER �۵� ���� Ȯ��
--   -> TBL_TEST1 ���̺��� ������� INSERT, UPDATE, DELETE ����
--      ��, �ð� Ȯ��

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '������', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET TEL = '010-0909-0909'
WHERE ID = 1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�

SELECT *
FROM TBL_TEST1;
--==>> 1	������	010-0909-0909


-- �ð� ���� ��
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '�����', '010-4545-4545');
--==>> ���� �߻�
--     (ORA-20003: �۾��� 08:00 ~ 18:00 ������ �����մϴ�.)

UPDATE TBL_TEST1
SET NAME = '�����'
WHERE ID = 1;
--==>> ���� �߻�
--     (ORA-20003: �۾��� 08:00 ~ 18:00 ������ �����մϴ�.)



--���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��


--�� �ǽ��� ���� ���̺� ���� (TBL_TEST2)
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.


--�� �ǽ��� ���� ���̺� ���� (TBL_TEST3)
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '�ڷ�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '��Ź��');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4, '������');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(5, '�ı⼼ô��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�ڷ�����
2	�����
3	��Ź��
4	������
5	�ı⼼ô��
*/

COMMIT;
--==>> Ŀ�� �Ϸ�


--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 3, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 4, 20);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 1, 10);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 3, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 4, 40);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12, 4, 30);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(13, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(14, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(15, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(16, 4, 30);

INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(17, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(18, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(19, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(20, 4, 30);

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 20

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	30
2	2	20
3	3	30
4	4	20
5	1	10
6	2	20
7	3	30
8	4	40
9	1	20
10	2	30
11	3	20
12	4	30
13	1	20
14	2	30
15	3	20
16	4	30
17	1	20
18	2	30
19	3	20
20	4	30
*/

COMMIT;
--==>> Ŀ�� �Ϸ�

SELECT *
FROM TBL_TEST2;
SELECT *
FROM TBL_TEST3;

