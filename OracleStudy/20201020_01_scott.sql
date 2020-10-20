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

