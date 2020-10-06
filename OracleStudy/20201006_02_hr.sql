SELECT USER
FROM DUAL;
--==>> HR


--○ 세 개 이상의 테이블 조인(JOIN)

-- 형식 1. (SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블1.컬럼명1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
  
  
-- 형식 2. (SQL 1999 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
              JOIN 테이블명3
              ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
              

--○ HR 계정 소유의 테이블 또는 뷰 목록 조회
SELECT *
FROM TAB;
--==>>
/*
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	VIEW	
JOBS	            TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS	            TABLE	
TBL_ORAUSERTEST	    TABLE	
*/


--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로
--   직원들의 데이터를
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME 항목으로 조회한다.
--       E          E          J              D

-- TEACHER'S CODE
SELECT *
FROM DEPRATMENTS;
-- DEPARTMENT_ID        -- 관계 컬럼
SELECT *
FROM EMPLOYEES;
-- JOB_ID               -- 관계 컬럼
SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT COUNT(*)
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 106

SELECT COUNT(*)
FROM EMPLOYEES;
--==>> 107 (값이 1개 누락됨)

SELECT COUNT(*)
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 107

SELECT COUNT(*)
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                          JOIN JOBS J
                          ON E.JOB_ID = J.JOB_ID;
--==>> 107 세개 합칠때 값의 누락이 없음

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                          JOIN JOBS J
                          ON E.JOB_ID = J.JOB_ID;
--==>>
/*
Jennifer	Whalen	Administration Assistant	Administration
Pat	Fay	Marketing Representative	Marketing
Michael	Hartstein	Marketing Manager	Marketing
Den	Raphaely	Purchasing Manager	Purchasing
Karen	Colmenares	Purchasing Clerk	Purchasing
Guy	Himuro	Purchasing Clerk	Purchasing
Sigal	Tobias	Purchasing Clerk	Purchasing
Alexander	Khoo	Purchasing Clerk	Purchasing
Shelli	Baida	Purchasing Clerk	Purchasing
Susan	Mavris	Human Resources Representative	Human Resources
Matthew	Weiss	Stock Manager	Shipping
Adam	Fripp	Stock Manager	Shipping
Payam	Kaufling	Stock Manager	Shipping
Shanta	Vollman	Stock Manager	Shipping
Kevin	Mourgos	Stock Manager	Shipping
John	Seo	Stock Clerk	Shipping
Stephen	Stiles	Stock Clerk	Shipping
Renske	Ladwig	Stock Clerk	Shipping
Hazel	Philtanker	Stock Clerk	Shipping
Ki	Gee	Stock Clerk	Shipping
Michael	Rogers	Stock Clerk	Shipping
Jason	Mallin	Stock Clerk	Shipping
Peter	Vargas	Stock Clerk	Shipping
James	Marlow	Stock Clerk	Shipping
Mozhe	Atkinson	Stock Clerk	Shipping
Laura	Bissot	Stock Clerk	Shipping
Steven	Markle	Stock Clerk	Shipping
James	Landry	Stock Clerk	Shipping
Irene	Mikkilineni	Stock Clerk	Shipping
Julia	Nayer	Stock Clerk	Shipping
Joshua	Patel	Stock Clerk	Shipping
Trenna	Rajs	Stock Clerk	Shipping
Curtis	Davies	Stock Clerk	Shipping
Randall	Matos	Stock Clerk	Shipping
TJ	Olson	Stock Clerk	Shipping
Girard	Geoni	Shipping Clerk	Shipping
Martha	Sullivan	Shipping Clerk	Shipping
Jean	Fleaur	Shipping Clerk	Shipping
Winston	Taylor	Shipping Clerk	Shipping
Douglas	Grant	Shipping Clerk	Shipping
Donald	OConnell	Shipping Clerk	Shipping
Kevin	Feeney	Shipping Clerk	Shipping
Alana	Walsh	Shipping Clerk	Shipping
Vance	Jones	Shipping Clerk	Shipping
Samuel	McCain	Shipping Clerk	Shipping
Britney	Everett	Shipping Clerk	Shipping
Sarah	Bell	Shipping Clerk	Shipping
Randall	Perkins	Shipping Clerk	Shipping
Timothy	Gates	Shipping Clerk	Shipping
Jennifer	Dilly	Shipping Clerk	Shipping
Kelly	Chung	Shipping Clerk	Shipping
Anthony	Cabrio	Shipping Clerk	Shipping
Julia	Dellinger	Shipping Clerk	Shipping
Alexis	Bull	Shipping Clerk	Shipping
Nandita	Sarchand	Shipping Clerk	Shipping
David	Austin	Programmer	IT
Valli	Pataballa	Programmer	IT
Diana	Lorentz	Programmer	IT
Bruce	Ernst	Programmer	IT
Alexander	Hunold	Programmer	IT
Hermann	Baer	Public Relations Representative	Public Relations
Clara	Vishney	Sales Representative	Sales
Peter	Tucker	Sales Representative	Sales
David	Bernstein	Sales Representative	Sales
Peter	Hall	Sales Representative	Sales
Christopher	Olsen	Sales Representative	Sales
Nanette	Cambrault	Sales Representative	Sales
Jack	Livingston	Sales Representative	Sales
Jonathon	Taylor	Sales Representative	Sales
Alyssa	Hutton	Sales Representative	Sales
Ellen	Abel	Sales Representative	Sales
Sundita	Kumar	Sales Representative	Sales
Elizabeth	Bates	Sales Representative	Sales
William	Smith	Sales Representative	Sales
Tayler	Fox	Sales Representative	Sales
Harrison	Bloom	Sales Representative	Sales
Lisa	Ozer	Sales Representative	Sales
Amit	Banda	Sales Representative	Sales
Sundar	Ande	Sales Representative	Sales
David	Lee	Sales Representative	Sales
Mattea	Marvins	Sales Representative	Sales
Danielle	Greene	Sales Representative	Sales
Charles	Johnson	Sales Representative	Sales
Sarath	Sewall	Sales Representative	Sales
Louise	Doran	Sales Representative	Sales
Lindsey	Smith	Sales Representative	Sales
Allan	McEwen	Sales Representative	Sales
Patrick	Sully	Sales Representative	Sales
Janette	King	Sales Representative	Sales
Oliver	Tuvault	Sales Representative	Sales
Eleni	Zlotkey	Sales Manager	Sales
John	Russell	Sales Manager	Sales
Karen	Partners	Sales Manager	Sales
Alberto	Errazuriz	Sales Manager	Sales
Gerald	Cambrault	Sales Manager	Sales
Neena	Kochhar	Administration Vice President	Executive
Lex	De Haan	Administration Vice President	Executive
Steven	King	President	Executive
Nancy	Greenberg	Finance Manager	Finance
Jose Manuel	Urman	Accountant	Finance
Ismael	Sciarra	Accountant	Finance
Luis	Popp	Accountant	Finance
Daniel	Faviet	Accountant	Finance
John	Chen	Accountant	Finance
Shelley	Higgins	Accounting Manager	Accounting
William	Gietz	Public Accountant	Accounting
Kimberely	Grant	Sales Representative	
*/

-- MY CODE
-- 1992
SELECT E.FIRST_NAME, E.LAST_NAME
     , J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND E.JOB_ID = J.JOB_ID;
  
-- 1999
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                          JOIN JOBS J
                          ON E.JOB_ID = J.JOB_ID;
                          
--○ EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로
--   직원들의 데이터를 다음과 같이 조회한다.
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
SELECT *
FROM JOBS;
--JOB_ID
SELECT * 
FROM EMPLOYEES;
-- DEPARTMENT_ID
SELECT *
FROM DEPARTMENTS;
-- LOCATION_ID
SELECT *
FROM LOCATIONS;
-- COUNTRY_ID
SELECT *
FROM COUNTRIES;
-- REGION_ID
SELECT *
FROM REGION;

SELECT COUNT(*)
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS G
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = G.REGION_ID(+);

-- 1992
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
     , L.CITY, C.COUNTRY_NAME, G.REGION_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS G
WHERE E.JOB_ID = J.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = G.REGION_ID(+);
  
-- 1999
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
     , L.CITY, C.COUNTRY_NAME, G.REGION_NAME
FROM EMPLOYEES E JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
                 LEFT JOIN DEPARTMENTS D
                 ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
                 LEFT JOIN LOCATIONS L
                 ON D.LOCATION_ID = L.LOCATION_ID
                 LEFT JOIN COUNTRIES C
                 ON L.COUNTRY_ID = C.COUNTRY_ID
                 LEFT JOIN REGIONS G
                 ON C.REGION_ID = G.REGION_ID;
/*
Jennifer	Whalen	Administration Assistant	Administration	Seattle	United States of America	Americas
Pat	Fay	Marketing Representative	Marketing	Toronto	Canada	Americas
Michael	Hartstein	Marketing Manager	Marketing	Toronto	Canada	Americas
Den	Raphaely	Purchasing Manager	Purchasing	Seattle	United States of America	Americas
Karen	Colmenares	Purchasing Clerk	Purchasing	Seattle	United States of America	Americas
Guy	Himuro	Purchasing Clerk	Purchasing	Seattle	United States of America	Americas
Sigal	Tobias	Purchasing Clerk	Purchasing	Seattle	United States of America	Americas
Alexander	Khoo	Purchasing Clerk	Purchasing	Seattle	United States of America	Americas
Shelli	Baida	Purchasing Clerk	Purchasing	Seattle	United States of America	Americas
Susan	Mavris	Human Resources Representative	Human Resources	London	United Kingdom	Europe
Matthew	Weiss	Stock Manager	Shipping	South San Francisco	United States of America	Americas
Adam	Fripp	Stock Manager	Shipping	South San Francisco	United States of America	Americas
Payam	Kaufling	Stock Manager	Shipping	South San Francisco	United States of America	Americas
Shanta	Vollman	Stock Manager	Shipping	South San Francisco	United States of America	Americas
Kevin	Mourgos	Stock Manager	Shipping	South San Francisco	United States of America	Americas
John	Seo	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Stephen	Stiles	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Renske	Ladwig	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Hazel	Philtanker	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Ki	Gee	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Michael	Rogers	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Jason	Mallin	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Peter	Vargas	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
James	Marlow	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Mozhe	Atkinson	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Laura	Bissot	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Steven	Markle	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
James	Landry	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Irene	Mikkilineni	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Julia	Nayer	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Joshua	Patel	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Trenna	Rajs	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Curtis	Davies	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Randall	Matos	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
TJ	Olson	Stock Clerk	Shipping	South San Francisco	United States of America	Americas
Girard	Geoni	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Martha	Sullivan	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Jean	Fleaur	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Winston	Taylor	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Douglas	Grant	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Donald	OConnell	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Kevin	Feeney	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Alana	Walsh	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Vance	Jones	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Samuel	McCain	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Britney	Everett	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Sarah	Bell	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Randall	Perkins	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Timothy	Gates	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Jennifer	Dilly	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Kelly	Chung	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Anthony	Cabrio	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Julia	Dellinger	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Alexis	Bull	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
Nandita	Sarchand	Shipping Clerk	Shipping	South San Francisco	United States of America	Americas
David	Austin	Programmer	IT	Southlake	United States of America	Americas
Valli	Pataballa	Programmer	IT	Southlake	United States of America	Americas
Diana	Lorentz	Programmer	IT	Southlake	United States of America	Americas
Bruce	Ernst	Programmer	IT	Southlake	United States of America	Americas
Alexander	Hunold	Programmer	IT	Southlake	United States of America	Americas
Hermann	Baer	Public Relations Representative	Public Relations	Munich	Germany	Europe
Clara	Vishney	Sales Representative	Sales	Oxford	United Kingdom	Europe
Peter	Tucker	Sales Representative	Sales	Oxford	United Kingdom	Europe
David	Bernstein	Sales Representative	Sales	Oxford	United Kingdom	Europe
Peter	Hall	Sales Representative	Sales	Oxford	United Kingdom	Europe
Christopher	Olsen	Sales Representative	Sales	Oxford	United Kingdom	Europe
Nanette	Cambrault	Sales Representative	Sales	Oxford	United Kingdom	Europe
Jack	Livingston	Sales Representative	Sales	Oxford	United Kingdom	Europe
Jonathon	Taylor	Sales Representative	Sales	Oxford	United Kingdom	Europe
Alyssa	Hutton	Sales Representative	Sales	Oxford	United Kingdom	Europe
Ellen	Abel	Sales Representative	Sales	Oxford	United Kingdom	Europe
Sundita	Kumar	Sales Representative	Sales	Oxford	United Kingdom	Europe
Elizabeth	Bates	Sales Representative	Sales	Oxford	United Kingdom	Europe
William	Smith	Sales Representative	Sales	Oxford	United Kingdom	Europe
Tayler	Fox	Sales Representative	Sales	Oxford	United Kingdom	Europe
Harrison	Bloom	Sales Representative	Sales	Oxford	United Kingdom	Europe
Lisa	Ozer	Sales Representative	Sales	Oxford	United Kingdom	Europe
Amit	Banda	Sales Representative	Sales	Oxford	United Kingdom	Europe
Sundar	Ande	Sales Representative	Sales	Oxford	United Kingdom	Europe
David	Lee	Sales Representative	Sales	Oxford	United Kingdom	Europe
Mattea	Marvins	Sales Representative	Sales	Oxford	United Kingdom	Europe
Danielle	Greene	Sales Representative	Sales	Oxford	United Kingdom	Europe
Charles	Johnson	Sales Representative	Sales	Oxford	United Kingdom	Europe
Sarath	Sewall	Sales Representative	Sales	Oxford	United Kingdom	Europe
Louise	Doran	Sales Representative	Sales	Oxford	United Kingdom	Europe
Lindsey	Smith	Sales Representative	Sales	Oxford	United Kingdom	Europe
Allan	McEwen	Sales Representative	Sales	Oxford	United Kingdom	Europe
Patrick	Sully	Sales Representative	Sales	Oxford	United Kingdom	Europe
Janette	King	Sales Representative	Sales	Oxford	United Kingdom	Europe
Oliver	Tuvault	Sales Representative	Sales	Oxford	United Kingdom	Europe
Eleni	Zlotkey	Sales Manager	Sales	Oxford	United Kingdom	Europe
John	Russell	Sales Manager	Sales	Oxford	United Kingdom	Europe
Karen	Partners	Sales Manager	Sales	Oxford	United Kingdom	Europe
Alberto	Errazuriz	Sales Manager	Sales	Oxford	United Kingdom	Europe
Gerald	Cambrault	Sales Manager	Sales	Oxford	United Kingdom	Europe
Neena	Kochhar	Administration Vice President	Executive	Seattle	United States of America	Americas
Lex	De Haan	Administration Vice President	Executive	Seattle	United States of America	Americas
Steven	King	President	Executive	Seattle	United States of America	Americas
Nancy	Greenberg	Finance Manager	Finance	Seattle	United States of America	Americas
Jose Manuel	Urman	Accountant	Finance	Seattle	United States of America	Americas
Ismael	Sciarra	Accountant	Finance	Seattle	United States of America	Americas
Luis	Popp	Accountant	Finance	Seattle	United States of America	Americas
Daniel	Faviet	Accountant	Finance	Seattle	United States of America	Americas
John	Chen	Accountant	Finance	Seattle	United States of America	Americas
Shelley	Higgins	Accounting Manager	Accounting	Seattle	United States of America	Americas
William	Gietz	Public Accountant	Accounting	Seattle	United States of America	Americas
Kimberely	Grant	Sales Representative				
*/