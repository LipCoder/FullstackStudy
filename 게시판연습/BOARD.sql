SELECT USER
FROM DUAL;


--�Խ��� ���̺� ����
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                       NOT NULL    -- �Խù� ��ȣ
, NAME      VARCHAR2(30)                    NOT NULL    -- �Խù� �ۼ���
, PWD  VARCHAR2(20)                         NOT NULL    -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                                -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)                   NOT NULL    -- �Խù� ����
, CONTENT   VARCHAR2(4000)                  NOT NULL    -- �Խù� ����
, IPADDR    VARCHAR2(20)                                -- ������ Ŭ���̾�Ʈ�� IP �ּ�
, HITCOUNT  NUMBER          DEFAULT 0       NOT NULL    -- �Խù� ��ȸ��
, CREATED   DATE            DEFAULT SYSDATE NOT NULL    -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)              -- �Խù� ��ȣ�� PK �������� ����
);

--1. �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> �� �� ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;

--2. �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '������', '1234', 'kjw@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE);
--> �� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '������', '1234', 'kjw@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE)
;

--3. DB ���ڵ��� ����(��ü �Խù� ��)�� �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;

--4. Ư�� ������ �Խù��� ����� �о���� ������ ����
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

--5. Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;

--6. Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
     , IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;

--7. Ư�� �Խù��� �����ϴ� ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
DELETE FROM TBL_BOARD WHERE NUM=1
;

--8. Ư�� �Խù��� �����ϴ� ������ ����
UPDATE TBL_BOARD
SET NAME='�Ǽ���', PWD='9876', EMAIL='ksw@test.com', SUBJECT='�ȳ��ϼ���', CONTENT='�ݰ����ϴ�.'
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET NAME='�Ǽ���', PWD='9876', EMAIL='ksw@test.com', SUBJECT='�ȳ��ϼ���', CONTENT='�ݰ����ϴ�.' WHERE NUM=1
;

--9. �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NUM), -1) NEXTNUM
FROM TBL_BOARD
WHERE NUM > 1;
--> �� �� ����
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM > 1
;

--10. �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) BEFORENUM
FROM TBL_BOARD
WHERE NUM < 1;
--> �� �� ����
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM < 1
;

--11. �˻� ��� �߰� ���� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE '%���%';
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE '%���%'
;


--�� ������ ������ ���� 
DECLARE
    V_CNT          NUMBER(9) := 1;
    V_NAME         VARCHAR2(30);
    V_PWD          VARCHAR2(20);
    V_EMAIL        VARCHAR2(50);
    V_SUBJECT      VARCHAR2(100);
    V_CONTENT      VARCHAR2(4000);
    V_IPADDR       VARCHAR2(20);
    V_HITCOUNT     NUMBER;
    V_CREATED      DATE;
BEGIN
    LOOP
        EXIT WHEN V_CNT > 769;
        
        V_CNT := V_CNT+1;
        
        IF( MOD(V_CNT, 5) = 0) THEN
            V_PWD := 'java006$';
            V_EMAIL := 'kjh@test.com';
            V_CONTENT := '���İ� �丮 ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.160';
            V_NAME := '��';
            V_SUBJECT := '���';
        ELSIF( MOD(V_CNT, 3) = 0) THEN
            V_PWD := 'java005$';
            V_EMAIL := 'kjh@study.com';
            V_CONTENT := '������ ���� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.154';
            V_NAME := '��';
            V_SUBJECT := '�м�';
        ELSIF( MOD(V_CNT, 7) = 0) THEN
            V_PWD := 'java004$';
            V_EMAIL := 'sjh@morning.com';
            V_CONTENT := '�̿�� ����ũ�� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.169';
            V_NAME := '��';
            V_SUBJECT := '����';
        ELSIF( MOD(V_CNT, 9) = 0) THEN
            V_PWD := 'net007$';
            V_EMAIL := 'yjh@test.com';
            V_CONTENT := '������ �� ����� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.162';
            V_NAME := '��';
            V_SUBJECT := '�ݷ�����';
        ELSE
            V_PWD := 'net003$';
            V_EMAIL := 'ljh@test.com';
            V_CONTENT := '���� �� ���� ���� ���빰 �ۼ�';
            V_IPADDR := '211.238.142.163';
            V_NAME := '��';
            V_SUBJECT := '�������θ�Ʈ';
        END IF;
        
        V_NAME := V_NAME || '��ȣ' || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || '�о� �Խù�' || LTRIM(TO_CHAR(V_CNT));
        
        V_CREATED := TO_DATE('2015-02-03', 'YYYY-MM-DD') + V_CNT;
        
        IF ( MOD(V_CNT, 2) = 0 ) THEN
            V_HITCOUNT := 10 + V_CNT;
        ELSIF( MOD(V_CNT, 3) = 0 ) THEN
            V_HITCOUNT := 32 + V_CNT;
        ELSIF( MOD(V_CNT, 4) = 0 ) THEN
            V_HITCOUNT := 4 + V_CNT;
        ELSE
            V_HITCOUNT := 47 + V_CNT;
        END IF;
        
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
        VALUES(V_CNT, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_SUBJECT, V_IPADDR, V_HITCOUNT, V_CREATED);
        
    END LOOP;         
END;

--�� Ȯ��
SELECT *
FROM TBL_BOARD
ORDER BY NUM;


COMMIT;
--==>> Ŀ�� �Ϸ�.
