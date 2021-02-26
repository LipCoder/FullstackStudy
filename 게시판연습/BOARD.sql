SELECT USER
FROM DUAL;


--게시판 테이블 생성
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                       NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)                    NOT NULL    -- 게시물 작성자
, PWD  VARCHAR2(20)                         NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                                -- 작성자 이메일
, SUBJECT   VARCHAR2(100)                   NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)                  NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                                -- 접속한 클라이언트의 IP 주소
, HITCOUNT  NUMBER          DEFAULT 0       NOT NULL    -- 게시물 조회수
, CREATED   DATE            DEFAULT SYSDATE NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)              -- 게시물 번호에 PK 제약조건 설정
);

--1. 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> 한 줄 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;

--2. 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '강정우', '1234', 'kjw@test.com', '작성테스트', '내용물작성', '211.238.142.152', 0, SYSDATE);
--> 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '강정우', '1234', 'kjw@test.com', '작성테스트', '내용물작성', '211.238.142.152', 0, SYSDATE)
;

--3. DB 레코드의 갯수(전체 게시물 수)를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;

--4. 특정 영역의 게시물의 목록을 읽어오는 쿼리문 구성
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
--> 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA) WHERE RNUM >= 1 AND RNUM <= 10
;

--5. 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;

--6. 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
     , IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=1
;

--7. 특정 게시물을 삭제하는 쿼리문 구성
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> 한 줄 구성
DELETE FROM TBL_BOARD WHERE NUM=1
;

--8. 특정 게시물을 수정하는 쿼리문 구성
UPDATE TBL_BOARD
SET NAME='권소윤', PWD='9876', EMAIL='ksw@test.com', SUBJECT='안녕하세요', CONTENT='반갑습니다.'
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='권소윤', PWD='9876', EMAIL='ksw@test.com', SUBJECT='안녕하세요', CONTENT='반갑습니다.' WHERE NUM=1
;

--9. 게시물 다음 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NUM), -1) NEXTNUM
FROM TBL_BOARD
WHERE NUM > 1;
--> 한 줄 구성
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM > 1
;

--10. 게시물 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM), -1) BEFORENUM
FROM TBL_BOARD
WHERE NUM < 1;
--> 한 줄 구성
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM < 1
;

--11. 검색 기능 추가 관련 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE '%취미%';
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE '%취미%'
;


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
