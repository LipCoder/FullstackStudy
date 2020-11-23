SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.


--○ 휴지통 비우기
PURGE RECYCLEBIN;


--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.


--------------------------------------------------------------------------------

--○ 실습 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.


--○ 데이터 입력 및 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '김종호', '010-1111-1111');
--> 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김종호', '010-1111-1111')
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 테이블 전체 데이터 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY 1;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1
;
--==>> 1	김종호	010-1111-1111


--○ 인원 수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 1


--○ 커밋
COMMIT;
--==>> 커밋 완료.


INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '김승범', '010-2222-2222');

COMMIT;

SELECT *
FROM TBL_MEMBER;



--○ 실습 테이블
DESC TBL_SCORE;


-- 추가
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, '이름', '국어', '영어', '수학')
;

-- 조회
SELECT NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG, 
RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE
;







