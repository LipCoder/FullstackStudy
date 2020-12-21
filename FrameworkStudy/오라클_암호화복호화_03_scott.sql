SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ 오라클_암호화복호화_03_scott.sql ■■■-- 

--○ 테이블 생성
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(30)
);
--==>> Table TBL_EXAM이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, '201218');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_EXAM;
--==>> 1	201218

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 암호화/복호화 패키지의 암호화 함수를 활용한 데이터 입력
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('201218', 'SUPERMAN'));

--○ 확인
SELECT *
FROM TBL_EXAM;
--==>> 1	"?"?
-- SUPERMAN 키를 모르면 이 PW는 복구 불가능

--○ 커밋
COMMIT;

SELECT ID, CRYPTPACK.DECRYPT(PW, 'BATMAN') AS PW
FROM TBL_EXAM;
--==>> 1	E??

SELECT ID, CRYPTPACK.DECRYPT(PW, 'SUPERMAN') AS PW
FROM TBL_EXAM;
--==>> 1	201218

