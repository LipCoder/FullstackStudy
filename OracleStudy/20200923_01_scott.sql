SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블에 주민등록번호 데이터를 담을 수 있는 컬럼 추가
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.
-- 주민등록번호 같은 경우에는 번호수가 고정되어 있기 때문에
-- VARCHAR 처럼 문자열 크기의 변동이 없다.

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234

SELECT 01012341234
FROM DUAL;
--==>> 1012341234

--○ 확인
SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민번호) 컬럼이 정상적으로 추가(포함)된 사항을 확인
-- 테이블 내에서 컬럼의 순서는 의미가 없다.

--※ 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음


--○ TBL_EMP 테이블에 추가한 SSN(주민등록번호) 컬럼 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP이(가) 변경되었습니다.


--○ 확인
SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 삭제되었음을 확인

DELETE TBL_EMP;
--==>> 14개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> 데이블의 구조(뼈대, 틀)는 그대로 남아있는 상태에서
--  데이터만 모두 소실(삭제)된 상황임을 확인



DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--==>> 에러 발생
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
68행, 6열에서 오류 발생
*/

DESC TBL_EMP;
--==>> 에러 발생
/*
오류:
ORA-04043: TBL_EMP 객체가 존재하지 않습니다.
*/


--○ 테이블 다시 복사(생성
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.


--------------------------------------------------------------------------------

--○ NULL 의 처리

SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> 	(null) (null) (null) (null) (null)


--※관찰의 결과
--   NULL 은 상태의 값을 의미하며 실제 존재하지 않는 값이기 때문에
--   이 NULL 이 연산 과정안에 포함되어 있을 경우...
--   그 결과는 무조건 NULL


--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT 사원명, 직종명, 급여, 커미션
FROM TBL_EMP
WHERE 커미션이 NULL;


SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM이 NULL;


SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = NULL;
--==>> 조회 결과 없음

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = 'NULL';
--==>> 에러 발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

DESC TBL_EMP;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM=(null);
--==>> 조회결과 없음


--※ NULL 은 실제 존재하는 값이 아니기 때문에
--   오라클 내에서 일반적인 연산자를 활용하여 비교할 수 없다.
--   NULL 을 대상으로 사용할 수 없는 연산자들...
--   >=, <=, =, >, <, !=, ^=, <> (=같지 않다)

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;     -- 논리적으로 COMM 이 NULL
--==>>
/*
SMITH	CLERK	    800	           (null)
JONES	MANAGER	    2975	       (null)	
BLAKE	MANAGER	    2850	       (null)	
CLARK	MANAGER	    2450	       (null)	
SCOTT	ANALYST	    3000	       (null)	
KING	PRESIDENT	5000	       (null)	
ADAMS	CLERK	    1100	       (null)	
JAMES	CLERK	    950		       (null)
FORD	ANALYST	    3000	       (null)	
MILLER	CLERK	    1300	       (null)	
*/


--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들
--   사원명, 직종명, 부서번호 항목을 조회한다.
SELECT ENAME"사원명", JOB"직종명", DEPTNO"부서번호"
FROM TBL_EMP
WHERE DEPTNO <> 20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/


--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT ENAME"사원명", JOB"직종명", SAL"급여", COMM"커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--WHERE COMM != NULL;
--WHERE COMM ^= NULL;
--WHERE COMM <> NULL;
--==>> 
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

--※ 오라클의 논리적인 부정은 NOT
-- cf) AND / OR/ IS/ NOT

SELECT ENAME"사원명", JOB"직종명", SAL"급여", COMM"커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>> 
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며, 연봉 내역에 포함된다.
SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션"
, (SAL * 12)"연봉"
FROM TBL_EMP;

SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", COMM"커미션"
, (SAL * 12 + COMM)"연봉"
FROM TBL_EMP;
--==>> NULL 연산으로 인해 COMM이 NULL인 사람은 연봉 데이터가 NULL이 된다.

-- ○ NVL()
SELECT NULL "COL1", NVL(NULL, 10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (null)  10   5
--> 첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.
--  첫 번째 파라미터 값이 NULL 이 아니면, 그 값을 그대로 반환한다.

--※ 좋은 SQL 작성 습관
-- , 위치 확인~!!!
CREATE TABLE 테이블명
( 컬럼명 데이터타입
, 컬럼명 데이터타입
, 컬럼명 데이터타입
);

SELECT EMPNO"사원번호", ENAME"사원명", SAL"급여", NVL(COMM, 0)"커미션"
     , SAL * 12 + NVL(COMM, 0)"연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950	    0	    11400
7902	FORD	3000	0	    36000
7934	MILLER	1300	0	    15600
*/


--○ NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파라미터 값을 반환한다.
SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려') "수당 확인"
FROM TBL_EMP;


SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", NVL2(COMM, COMM, 0) "커미션"
     , SAL * 12 + NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;


SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", NVL2(COMM, COMM, 0) "커미션"
     , NVL2(COMM, SAL * 12 + COMM, SAL * 12) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	0	9600
7499	ALLEN	1600	300	19500
7521	WARD	1250	500	15500
7566	JONES	2975	0	35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	34200
7782	CLARK	2450	0	29400
7788	SCOTT	3000	0	36000
7839	KING	5000	0	60000
7844	TURNER	1500	0	18000
7876	ADAMS	1100	0	13200
7900	JAMES	950	0	11400
7902	FORD	3000	0	36000
7934	MILLER	1300	0	15600
*/

--○ COALESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.
--  맨 앞에 있는 파라미터부터 차례로 NULL 여부를 확인하여
--  NULL 이 아닐 경우 반환하고
--  NULL 인 경우에는 그 다음 매개변후의 값을 반환한다.
--  NVL() 이나 NVL2() 와 비교하여
--  모~~~~~~~든 경우의 수를 고려할 수 있다는 특징을 갖는다.

SELECT NULL "COL1"
     , COALESCE(NULL, NULL, NULL, 30) "COL2"
     , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "COL3"
     , COALESCE(10, NULL, NULL, NULL, NULL, 100) "COL4"
     , COALESCE(NULL, NULL, 50, NULL, NULL, 100) "COL5"
FROM DUAL;
--==>> (null)      30   100     10     50

SELECT *
FROM TBL_EMP;

--○ 실습을 위한 데이터 추가 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '홍주니', 'SALESMAN', 7369, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '영우기', 'SALESMAN', 7369, SYSDATE, 10, 100);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '재와니', 'CLERK', 7499, SYSDATE, 20, 200);
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료


--○ 확인
SELECT *
FROM TBL_EMP;


--○ 현재 TBL_EMP 테이블에서 모든 사원의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   연봉 산출 기준은 위와 같다.

--NVL()
SELECT EMPNO "사원번호", ENAME "사원명", NVL(SAL, 0) "급여", NVL(COMM, 0) "커미션"
     , NVL(SAL, 0) * 12 + NVL(COMM, 0) "연봉"
FROM TBL_EMP;


--NVL2()
SELECT EMPNO "사원번호", ENAME "사원명", NVL2(SAL, SAL, 0) "급여"
     , NVL2(COMM, COMM, 0) "커미션"
     , NVL2(SAL, SAL, 0) * 12 + NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;

--
SELECT EMPNO "사원번호", ENAME "사원명", NVL(SAL, 0) "급여" , NVL2(COMM, COMM, 0) "커미션"
     , COALESCE(SAL * 12 + COMM, SAL * 12, COMM, 0) "연봉"
FROM TBL_EMP;

--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950	    0	    11400
7902	FORD	3000	0	    36000
7934	MILLER	1300	0	    15600
8000	홍주니	0	    0	    0
8001	영우기	0	    100	    100
8002	재와니	0	    200	    200
*/



--------------------------------------------------------------------------------

--※ 날짜 표현에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 현재 날짜 및 시간을 반환하는 함수
SELECT SYSDATE "COL1", CURRENT_DATE "COL2", LOCALTIMESTAMP "COL3"
FROM DUAL;
--==>> 2020-09-23 02:43:31	2020-09-23 02:43:31	20/09/23 14:43:31.000000000

--※ 날짜 표현에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○ 컬럼과 컬럼의 연결(결합
SELECT 1, 2
FROM DUAL;
--==>> 1      2

SELECT 1 + 2
FROM DUAL;

SELECT '홍주니', '영우기'
FROM DUAL;

SELECT '홍주니' + '영우기'
FROM DUAL;
--==>> 에러 발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '홍주니' || '영우기'
FROM DUAL;
--==>> 홍주니영우기

SELECT ENAME || JOB
FROM TBL_EMP;
--==>>
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
홍주니SALESMAN
영우기SALESMAN
재와니CLERK
*/

SELECT '홍주니는 ' , SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;
--==>> 홍주니는    2020-09-23	에 연봉	500	억을 원한다.
--     --------    ----------- -------- --- ------------
--     문자타입    날짜타입    문자타입 숫자타입  문자타입

SELECT '홍주니는 ' || SYSDATE || '에 연봉' || 500 || '억을 원한다.'
FROM DUAL;
--==>> 홍주니는 2020-09-23에 연봉500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형 변환하는 별도의 과정 없이
--   [||] 만 삽입해 주면 간단히 컬럼과 컬럼(서로 다른 종류의 데이터)을
--   결합하는 것이 가능하다.
--   cf) MSSQL 에서는 모든 데이터를 문자열로 CONVERT 해야 한다.



--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   [SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
--    ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
--                          :
--    재와니의 현재 연봉은 200인데 희망 연봉은 400이다.]

--   단, 레코드마다(한 행마다) 위의 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT ENAME || '의 현재 연봉은 ' || (NVL(SAL, 0) * 12 + NVL(COMM, 0))
       || '인데 희망 연봉은 ' ||  (NVL(SAL, 0) * 12 + NVL(COMM, 0)) * 2 || '이다.'
AS "RESULT"
FROM TBL_EMP;
--==>>
/*
SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
WARD의 현재 연봉은 15500인데 희망 연봉은 31000이다.
JONES의 현재 연봉은 35700인데 희망 연봉은 71400이다.
MARTIN의 현재 연봉은 16400인데 희망 연봉은 32800이다.
BLAKE의 현재 연봉은 34200인데 희망 연봉은 68400이다.
CLARK의 현재 연봉은 29400인데 희망 연봉은 58800이다.
SCOTT의 현재 연봉은 36000인데 희망 연봉은 72000이다.
KING의 현재 연봉은 60000인데 희망 연봉은 120000이다.
TURNER의 현재 연봉은 18000인데 희망 연봉은 36000이다.
ADAMS의 현재 연봉은 13200인데 희망 연봉은 26400이다.
JAMES의 현재 연봉은 11400인데 희망 연봉은 22800이다.
FORD의 현재 연봉은 36000인데 희망 연봉은 72000이다.
MILLER의 현재 연봉은 15600인데 희망 연봉은 31200이다.
홍주니의 현재 연봉은 0인데 희망 연봉은 0이다.
영우기의 현재 연봉은 100인데 희망 연봉은 200이다.
재와니의 현재 연봉은 200인데 희망 연봉은 400이다.
*/

SELECT ENAME || '의 현재 연봉은 ' 
    || COALESCE((SAL * 12 + COMM), SAL * 12, COMM) || '인데 희망 연봉은 ' 
    || COALESCE((SAL * 12 + COMM), SAL * 12, COMM) * 2 || '이다.'
FROM TBL_EMP;


--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.

--   [SMITH'S 입사일은 1980-12-17이다. 그리고 급여는 800이다.
--    ALLEN'S 입사일은 1980-02-20이다. 그리고 급여는 1600이다.
--                          :
--    재와니'S 입사일은 2020-09-23이다. 그리고 급여는 0이다.]

SELECT ENAME    || '''s 의 입사일은 '
    || HIREDATE || '이다. 그리고 급여는 '
    || SAL      || '이다.'
FROM TBL_EMP;
--==>>
/*
SMITH''s 의 입사일은 1980-12-17이다. 그리고 급여는 800이다.
ALLEN''s 의 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
WARD''s 의 입사일은 1981-02-22이다. 그리고 급여는 1250이다.
JONES''s 의 입사일은 1981-04-02이다. 그리고 급여는 2975이다.
MARTIN''s 의 입사일은 1981-09-28이다. 그리고 급여는 1250이다.
BLAKE''s 의 입사일은 1981-05-01이다. 그리고 급여는 2850이다.
CLARK''s 의 입사일은 1981-06-09이다. 그리고 급여는 2450이다.
SCOTT''s 의 입사일은 1987-07-13이다. 그리고 급여는 3000이다.
KING''s 의 입사일은 1981-11-17이다. 그리고 급여는 5000이다.
TURNER''s 의 입사일은 1981-09-08이다. 그리고 급여는 1500이다.
ADAMS''s 의 입사일은 1987-07-13이다. 그리고 급여는 1100이다.
JAMES''s 의 입사일은 1981-12-03이다. 그리고 급여는 950이다.
FORD''s 의 입사일은 1981-12-03이다. 그리고 급여는 3000이다.
MILLER''s 의 입사일은 1982-01-23이다. 그리고 급여는 1300이다.
홍주니''s 의 입사일은 2020-09-23이다. 그리고 급여는 이다.
영우기''s 의 입사일은 2020-09-23이다. 그리고 급여는 이다.
재와니''s 의 입사일은 2020-09-23이다. 그리고 급여는 이다.
*/

--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--   홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다.
--   홑따옴표 ['] 하나는 문자열의 시작을 나타내고
--   홑따옴표 [''] 두개는 문자열 영역 안에서 어퍼스트로피를 나타내며
--   다시 등장하는 홑따옴표 ['] 하나가
--   문자열 영역의 종료를 의미하게 되는 것이다.


--○ TBL_EMP 테이블에서 직종이 'SALESMAN' 인 사원의 정보를 조회한다.
SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';


--○ UPPER(), LOWER(), INICAP()
SELECT 'oRaCLe' "COL1"
     , UPPER('oRaCLe') "COL2"
     , LOWER('oRaCLe') "COL3"
     , INITCAP('oRaCLe') "COL3"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle
--> UPPER() 는 매개변수 문자열 내용을 모두 대문자로 (변환하여) 반환
--  LOWER() 는 매개변수 문자열 내용을 모두 소문자로 (변환하여) 반환
--  INITCAP() 은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 (변환하여) 반환

--○ TBL_EMP 테이블을 대상으로 검색값이 'sALeSmAN' 인 조건으로 
--   해당 직종(SALESMAN) 사원의 사원번호, 사원명, 직종명을 조회한다.
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
FROM TBL_EMP
WHERE JOB = UPPER('sALEsMAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	홍주니	SALESMAN
8001	영우기	SALESMAN
*/

--○ 실습을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, SAL, COMM)
VALUES(8003, '예스리', 'salesman', 7369, SYSDATE, 20, 1000, 1000);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_EMP;


--○ 커밋
COMMIT;
--==>> 커밋 완료


--○ TBL_EMP 테이블에서 직종이 세일즈맨 인 사원들의
--   사원번호, 사원명, 직종명을 조회한다.
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
FROM TBL_EMP
WHERE UPPER(JOB) = 'SALESMAN';
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	홍주니	SALESMAN
8001	영우기	SALESMAN
8003	예스리	salesman
*/

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAN');


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';
--==>> MARTIN	SALESMAN	1981-09-28

DESC TBL_EMP;

-- 문자열 타입에서 DATE 타입으로 자동 형변환 된다.
-- 하지만 원칙적으로는 오라클은 자동 형변환을 해줄 의무가 없다.
-- 그렇기 때문에 오라클의 형변환은 믿을 만한게 못된다.


--○ TO_DATE()
--   DATE 타입으로 형변환 시켜주는 함수

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN	1981-09-28


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)
--   입사한 직원의 사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
홍주니	SALESMAN	2020-09-23
영우기	SALESMAN	2020-09-23
재와니	CLERK	    2020-09-23
예스리	salesman	2020-09-23
*/

--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다. (날짜에 대한 비교 연산)
--   오라클에서는 날짜 데이터에 대한 크기 비교 시 
--   과거보다 미래를 더 큰 값으로 간주한다.


--○ TBL_EMP 테이블에서 입사일이 1981년 4월 4일 부터
--   1981년 9월 28일 사이에 입사한 직원들의
--   사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-04', 'YYYY-MM-DD')
AND   HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/