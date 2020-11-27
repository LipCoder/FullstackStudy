SELECT USER
FROM DUAL;
--==>> SCOTT

PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

SELECT *
FROM TAB;
--==>>
/*
BONUS	TABLE	
DEPT	TABLE	
EMP	TABLE	
EMPVIEW	VIEW	
SALGRADE	TABLE	
TBL_BUSEO	TABLE	
TBL_CITY	TABLE	
TBL_EMP	TABLE	
TBL_EVENTLOG	TABLE	
TBL_IDPW	TABLE	
TBL_INSA	TABLE	
TBL_INSABACKUP	TABLE	
TBL_JIKWI	TABLE	
TBL_MEMBER	TABLE	
TBL_MEMBERSCORE	TABLE	
TBL_SAWON	TABLE	
TBL_STUDENTS	TABLE	
TBL_SUNGJUK	TABLE	
TBL_TEST1	TABLE	
TBL_TEST2	TABLE	
TBL_TEST3	TABLE	
TBL_��ǰ	TABLE	
TBL_�԰�	TABLE	
TBL_���	TABLE	
VIEW_MEMBERSCORE	VIEW	
*/


--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;
--==>>

--�� �Խ��� ���� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                       NOT NULL    -- �Խù� ��ȥ
, NAME      VARCHAR2(30)                    NOT NULL    -- �Խù� �ۼ���
, PWD       VARCHAR2(20)                    NOT NULL    -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                                -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)                   NOT NULL    -- �Խù� ����
, CONTENT   VARCHAR2(4000)                  NOT NULL    -- �Խù� ����
, IPADDR    VARCHAR2(20)                                -- ������ Ŭ���̾�Ʈ�� IP �ּ�
, HITCOUNT  NUMBER          DEFAULT 0       NOT NULL    -- �Խù� ��ȸ��
, CREATED   DATE            DEFAULT SYSDATE NOT NULL    -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)              -- �Խù� ��ȣ�� PK �������� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> �� �� ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;
--==>> 0


--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '������', '1234', 'kjw@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE);
--> �� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '������', '1234', 'kjw@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� DB ���ڵ��� ����(��ü �Խù� ��)�� �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 1


--�� Ư�� ������(���� ��ȣ ~ �� ��ȣ) �Խù��� ����� �о���� ������ ����

SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM 
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10;
--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA) WHERE RNUM >= 1 AND RNUM <= 10
;
--==>> 1	������	�ۼ��׽�Ʈ	0	2020-11-27


--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>> 1	������	1234	kjw@test.com	�ۼ��׽�Ʈ	���빰�ۼ�	211.238.142.152	2	2020-11-27


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
     , IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;


--�� Ư�� �Խù��� �����ϴ� ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
DELETE FROM TBL_BOARD WHERE NUM=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� Ư�� �Խù��� �����ϴ� ������ ����
UPDATE TBL_BOARD
SET NAME='�Ǽ���', PWD='9876', EMAIL='ksw@test.com', SUBJECT='�ȳ��ϼ���', CONTENT='�ݰ����ϴ�.'
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET NAME='�Ǽ���', PWD='9876', EMAIL='ksw@test.com', SUBJECT='�ȳ��ϼ���', CONTENT='�ݰ����ϴ�.' WHERE NUM=1
;


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �׽�Ʈ
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(5, '��¹�', '1234', 'ksb@test.com', '�ۼ��׽�Ʈ2', '���빰�ۼ�2', '211.238.142.154', 0, SYSDATE);


--�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NUM), -1) NEXTNUM
FROM TBL_BOARD
WHERE NUM > 1;
--> �� �� ����
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM > 1
;

--�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) BEFORENUM
FROM TBL_BOARD
WHERE NUM < 1;
--> �� �� ����
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM < 1
;



