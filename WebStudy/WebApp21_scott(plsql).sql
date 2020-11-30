SELECT USER
FROM DUAL;

--○ 무작위 데이터 생성 
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
            V_CONTENT := '음식과 요리 관련 내용물 작성';
            V_IPADDR := '211.238.142.160';
            V_NAME := '강';
            V_SUBJECT := '취미';
        ELSIF( MOD(V_CNT, 3) = 0) THEN
            V_PWD := 'java005$';
            V_EMAIL := 'kjh@study.com';
            V_CONTENT := '날씨와 기후 관련 내용물 작성';
            V_IPADDR := '211.238.142.154';
            V_NAME := '김';
            V_SUBJECT := '분석';
        ELSIF( MOD(V_CNT, 7) = 0) THEN
            V_PWD := 'java004$';
            V_EMAIL := 'sjh@morning.com';
            V_CONTENT := '미용과 메이크업 관련 내용물 작성';
            V_IPADDR := '211.238.142.169';
            V_NAME := '송';
            V_SUBJECT := '전문';
        ELSIF( MOD(V_CNT, 9) = 0) THEN
            V_PWD := 'net007$';
            V_EMAIL := 'yjh@test.com';
            V_CONTENT := '강아지 및 고양이 관련 내용물 작성';
            V_IPADDR := '211.238.142.162';
            V_NAME := '윤';
            V_SUBJECT := '반려동물';
        ELSE
            V_PWD := 'net003$';
            V_EMAIL := 'ljh@test.com';
            V_CONTENT := '게임 및 오락 관련 내용물 작성';
            V_IPADDR := '211.238.142.163';
            V_NAME := '이';
            V_SUBJECT := '엔터테인먼트';
        END IF;
        
        V_NAME := V_NAME || '종호' || LTRIM(TO_CHAR(V_CNT));
        V_SUBJECT := V_SUBJECT || '분야 게시물' || LTRIM(TO_CHAR(V_CNT));
        
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

--○ 확인
SELECT *
FROM TBL_BOARD
ORDER BY NUM;


COMMIT;
--==>> 커밋 완료.
