-- JDBC01_scott.sql

SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

--○ 휴지통을 거치지 않고 테이블 제거
DROP TABLE TBL_MEMBER PURGE;

SELECT *
FROM TAB;
--==>> 
/* 
BIN$L63x8sb8T8GjIoUayVaIzw==$0	TABLE	--> 현재 휴지통에 존재하는 테이블
            :
*/

--○ 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

 
SELECT *
FROM TAB;
--==>> BIN$L63x8sb8T8GjIoUayVaIzw==$도 제거 됨


--○ 실습 테이블 생성
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, '정의진', '010-1111-1111')
;
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBER;
--==>> 1	정의진	010-1111-1111


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--JDBC01 의 Test002.java 실행 후 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
2	박다빈	010-2222-2222
1	정의진	010-1111-1111
*/



--○ JDBC01 의 Test003.java 실행 후 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
2	박다빈	010-2222-2222
3	김승범	010-3333-3333
4	안혜리	010-4444-4444
1	정의진	010-1111-1111
*/

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> 
/*
1	정의진	010-1111-1111
2	박다빈	010-2222-2222
3	김승범	010-3333-3333
4	안혜리	010-4444-4444
*/

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY 1;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1
;
