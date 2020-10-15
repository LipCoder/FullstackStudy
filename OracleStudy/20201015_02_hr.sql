SELECT USER
FROM DUAL;
--==>> HR


--○ EMPLOYEES 테이블의 직원들 SALARY 를 10% 인상한다.
--   단, 부서명이 'IT'인 직원들만 한정한다.
--   (※ 변경에 대한 결과 확인 후 ROLLBACK 을 수행한다.)
SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT'); 
--==>> 5개 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

ROLLBACK;
--==>> 롤백 완료.
                    
                    
--○ EMPLOYEES 테이블에서 JOB_TITLE 이 [Sales Manager] 인 사원들이
--   SALARY 를 해당 직무(직종)의 최고급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한해 적용할 수 있도록 처리한다.
--   (※ 변경에 대한 결과 확인 후 ROLLBACK 을 수행한다.)

SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;
--==>> Sales Manager = SA_MAN


UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
  AND EXTRACT(YEAR FROM HIRE_DATE) < 2006;
--==>> 3개 행 이(가) 업데이트되었습니다.

ROLLBACK;
--==>> 롤백 완료.           


--○ EMPLOYEES 테이블에서 SALARY 를
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance -> 10% 인상
--   Executive -> 15% 인상
--   Accounting -> 20% 인상
--   (※ 변경에 대한 결과 확인 후 ROLLBACK 을 수행한다.)

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = (CASE DEPARTMENT_ID 
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Finance') THEN SALARY * 1.1
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Executive') THEN SALARY * 1.15
                   WHEN (SELECT DEPARTMENT_ID 
                         FROM DEPARTMENTS 
                         WHERE DEPARTMENT_NAME = 'Accounting') THEN SALARY * 1.2
                   ELSE SALARY
              END) -- CASE WHEN THEN ELSE END 구문에서 ELSE는 생략이 가능하지만 바람직한 행동은 아니다.
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting') );
--==>> 11개 행 이(가) 업데이트되었습니다.
                    
ROLLBACK;
--==>> 롤백 완료



--------------------------------------------------------------------------------

--■■■ DELETE ■■■--

-- 1. 테이블에서 지정된 행(레코드)을 삭제하는 데 사용하는 구문

-- 2. 형식 및 구조
-- DELETE [FROM] 테이블명
-- [WHERE 조건절];

-- EMPLOYEES 테이블 복사(데이터 위주)
CREATE TABLE TBL_EMPLOYEES
AS
SELECT *
FROM EMPLOYEES;
--==>> Table TBL_EMPLOYEES이(가) 생성되었습니다.

DESC EMPLOYEES;

SELECT *
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	2007-06-21	SH_CLERK	2600		124	50

DELETE
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.



--○ EMPLOYEES 테이블에서 직원들의 정보를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.

--※ 실제로는 EMPLOYEES 테이블의 데이터가(삭제하고자 하는 대상 데이터)
--   다른 레코드에 의해 참조당하고 있는 경우
--   삭제되지 않을 수 있다는 사실을 염두해야 하며...
--   그에 대한 이유도 알아야 한다.

DELETE
FROM TBL_EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME = 'IT');
--==>> 5개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMPLOYEES;

ROLLBACK;
--==>> 롤백 완료.

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME = 'IT');
--==>> 에러 발생
--     (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)
                      

--------------------------------------------------------------------------------

--■■■ 뷰(VIEW) ■■■--

-- 1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에 존재하는
--    하나 이상의 테이블에서 사용자가 얻기 원하는 데이터들만을
--    정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만을 모아서
--    만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--    가상의 테이블이란... 뷰가 실제로 존재하는 테이블(객체)이 아니라
--    하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이며
--    그 정보를 추출해내는 SQL 문장이라고 볼 수 있다.

-- 2. 형식 및 구조
-- CREATE [OR REPLACE] VIEW 뷰이름
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- 서브쿼리(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY]

-- ※ 뷰의 데이터는 물리적으로 저장되는게 아니다. 
--    그저 뷰로 설정했었던 SQL 쿼리문이 돌아갈 뿐이다.

-- ○ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
--==>> View VIEW_EMPLOYEES이(가) 생성되었습니다.


--○ 뷰(VIEW)의 구조 조회
DESC VIEW_EMPLOYEES;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
CITY            NOT NULL VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/


--○ 뷰(VIEW) 소스 확인 -- CHECK~!!!
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';
--==>> 
/*
VIEW_EMPLOYEES

"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID"

*/

SELECT *
FROM (SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID
);


