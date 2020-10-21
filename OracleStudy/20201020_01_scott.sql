SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ 실습 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 생성된 프로시저 정상 작동여부 확인 -> 프로시저 호출
EXEC PRC_MEMBER_INSERT('안혜지', '010-1111-1111', '서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 테이블 조회
SELECT *
FROM TBL_MEMBER;
--==>> 1	안혜지	010-1111-1111	서울


EXEC PRC_MEMBER_INSERT('박해진', '010-2222-2222', '부산');
--==>> 에러발생
/*
오류 보고 -
ORA-20001: 서울,경기,대전만 입력이 가능합니다.
ORA-06512: at "SCOTT.PRC_MEMBER_INSERT", line 37
ORA-06512: at line 1
*/


--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER 
, 상품코드  VARCHAR2(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER
, 출고단가  NUMBER
);
--==>> Table TBL_출고이(가) 생성되었습니다.

-- 출고번호 PK 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_출고번호_PK PRIMARY KEY(출고번호);
--==>> Table TBL_출고이(가) 변경되었습니다.

-- 상품코드 FK 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY(상품코드)
               REFERENCES TBL_상품(상품코드);
--==>> Table TBL_출고이(가) 변경되었습니다.

SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_출고;


--○ 월드콘 20개 출고 테스트
EXEC PRC_출고_INSERT('C001', 20, 1400);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_출고;


--○ 바밤바 20개 출고 테스트
EXEC PRC_출고_INSERT('H002', 20, 500);
--==>> 에러 발생
--     (ORA-20002: 재고수량이 부족합니다.)


SELECT *
FROM TBL_출고;

SELECT *
FROM TBL_상품;


EXEC PRC_출고_INSERT('H001', 10, 450);
EXEC PRC_출고_INSERT('H002', 4, 550);
EXEC PRC_출고_INSERT('H003', 16, 550);
EXEC PRC_출고_INSERT('C003', 12, 1200);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. * 4


--○ 생성된 프로시저 정상 작동여부 확인 -> 프로시저 호출 
EXEC PRC_출고_UPDATE(2, 30);
--==>> 에러 발생
--     (ORA-20002: 제고 부족~!!!)


EXEC PRC_출고_UPDATE(5, 30);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--------------------------------------------------------------------------------
--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■
-- ※ DML 작업에 대한 이벤트 기록

--○ 실습 테이블 생성(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 실습 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO VARCHAR2(200)
, ILJA DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다.



--○ 생성한 TRIGGER 작동 여부 확인
--   -> TBL_TEST1 테이블을 대상으로 INSERT, UPDATE, DELETE 수행
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '김승범', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '박혜인', '010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '이진주', '010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME = '이준구'
WHERE ID = 1;
--==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1;
--==>> 3개 행 이(가) 삭제되었습니다.

COMMIT;
--==>> 커밋 완료.


SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

SELECT *
FROM TBL_EVENTLOG;
--==>> 
/*
INSERT 쿼리가 실행되었습니다.	2020-10-20 16:37:56
INSERT 쿼리가 실행되었습니다.	2020-10-20 16:38:20
INSERT 쿼리가 실행되었습니다.	2020-10-20 16:38:41
UPDATE 쿼리가 실행되었습니다.	2020-10-20 16:39:17
DELETE 쿼리가 실행되었습니다.	2020-10-20 16:40:19
*/


--○ 생성한 TRIGGER 작동 여부 확인
--   -> TBL_TEST1 테이블을 대상으로 INSERT, UPDATE, DELETE 수행
--      단, 시간 확인

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '조윤상', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET TEL = '010-0909-0909'
WHERE ID = 1;
--==>> 1 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료

SELECT *
FROM TBL_TEST1;
--==>> 1	조윤상	010-0909-0909


-- 시간 변경 후
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '주재완', '010-4545-4545');
--==>> 에러 발생
--     (ORA-20003: 작업은 08:00 ~ 18:00 까지만 가능합니다.)

UPDATE TBL_TEST1
SET NAME = '주재완'
WHERE ID = 1;
--==>> 에러 발생
--     (ORA-20003: 작업은 08:00 ~ 18:00 까지만 가능합니다.)



--■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델


--○ 실습을 위한 테이블 생성 (TBL_TEST2)
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.


--○ 실습을 위한 테이블 생성 (TBL_TEST3)
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.


--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '텔레비전');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4, '건조기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(5, '식기세척기');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	텔레비전
2	냉장고
3	세탁기
4	건조기
5	식기세척기
*/

COMMIT;
--==>> 커밋 완료


--○ 실습 관련 데이터 입력
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

--==>> 1 행 이(가) 삽입되었습니다. * 20

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
--==>> 커밋 완료

SELECT *
FROM TBL_TEST2;
SELECT *
FROM TBL_TEST3;



SELECT *
FROM TBL_TEST2;
SELECT *
FROM TBL_TEST3;

SELECT T3.SID, T2.CODE,T2.NAME,T3.SU
FROM TBL_TEST2 T2 JOIN TBL_TEST3 T3
ON T2.CODE = T3.CODE;
--==>
/*
1   1   텔레비전   30
17   1   텔레비전   20
13   1   텔레비전   20
9   1   텔레비전   20
5   1   텔레비전   10
6   2   냉장고   20
2   2   냉장고   20
18   2   냉장고   30
14   2   냉장고   30
10   2   냉장고   30
11   3   세탁기   20
15   3   세탁기   20
7   3   세탁기   30
19   3   세탁기   20
3   3   세탁기   30
16   4   건조기   30
8   4   건조기   40
4   4   건조기   20
20   4   건조기   30
12   4   건조기   30
*/

DELETE
FROM TBL_TEST2
WHERE CODE = 1;
--==>에러 발생
--ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

DELETE
FROM TBL_TEST2
WHERE CODE = 5;
--==>1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_TEST2
WHERE CODE = 1;
--==> 에러발생
-- ORA-02292: integrity constraint

DELETE
FROM TBL_TEST3
WHERE CODE = 1;
--==>5개 행 이(가) 삭제되었습니다.

COMMIT;
--==>커밋 완료.

--------------------------------------------------------------------------------
-- 자식 테이블 정보 제거 트리거 생성 이후 


SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;


DELETE
FROM TBL_TEST2
WHERE CODE = 2;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;
--==>> CODE = 2에 해당하는 모든 자식 테이블 삭제

--------------------------------------------------------------------------------

SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_입고;


INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(18, 'H001', SYSDATE, 10, 400);


--○ 패키지 활용 실습
SELECT INSA_PACK.FN_GENDER('921204-1188035') "함수 호출 결과"
FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "성별"
FROM TBL_INSA;





