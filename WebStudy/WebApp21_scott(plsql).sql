SELECT USER
FROM DUAL;

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
