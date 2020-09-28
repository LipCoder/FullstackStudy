SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 데이터를 대상으로 반올림, 절삭 등의 연산을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE "COL1"                   -- 2020-09-28  ->  기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "COL2"    -- 2021-01-01  ->  년도까지 유효한 데이터 (상반기/하반기 기준)
     , ROUND(SYSDATE, 'MONTH') "COL3"   -- 2020-10-01  ->  월까지 유효한 데이터 (15일 기준)
     , ROUND(SYSDATE, 'DD') "COL4"      -- 2020-09-28  ->  일까지 유효한 데이터 (정오 기준)
     , ROUND(SYSDATE, 'DAY') "COL5"     -- 2020-09-27  ->  일까지 유효한 데이터 
                                                        -- (수요일 정오 기준 어느 주의 일요일로 갈것인가를 정해준다)
FROM DUAL;


--○ 날짜 절삭
SELECT SYSDATE "COL1"                   -- 2020-09-28  ->  기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "COL2"    -- 2021-01-01  ->  년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "COL3"   -- 2020-09-01  ->  월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "COL4"      -- 2020-09-28  ->  일까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "COL5"     -- 2020-09-27  ->  그 전 주에 해당하는 일요일
                                                      
FROM DUAL;

--------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()    : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
-- TO_DATE()    : 문자 데이터를 날짜 타입으로 변환시켜주는 함수
-- TO_NUMBER()  : 문자 데이터를 숫자 타입으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우...
--   설정값을 통해 세션을 설정할 수 있다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\'; -- 통화 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다. * 4

-- ○ 날짜형 -> 문자형
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"    -- 2020-09-28
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"          -- 2020
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"          -- TWENTY TWENTY
     , TO_CHAR(SYSDATE, 'MM') "COL4"            -- 09
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"         -- 9월
     , TO_CHAR(SYSDATE, 'DD') "COL6"            -- 28
     , TO_CHAR(SYSDATE, 'MM-DD') "COL7"         -- 09-28
     , TO_CHAR(SYSDATE, 'DAY') "COL8"           -- 월요일
     , TO_CHAR(SYSDATE, 'DY') "COL9"            -- 월
     , TO_CHAR(SYSDATE, 'HH24') "COL10"         -- 11
     , TO_CHAR(SYSDATE, 'HH') "COL11"           -- 11
     , TO_CHAR(SYSDATE, 'HH AM') "COL12"        -- 11 오전
     , TO_CHAR(SYSDATE, 'HH PM') "COL13"        -- 11 오전
     , TO_CHAR(SYSDATE, 'MI') "COL14"           -- 11
     , TO_CHAR(SYSDATE, 'SS') "COL15"           -- 49
     , TO_CHAR(SYSDATE, 'SSSSS') "COL16"        -- 40336       -- 금일 0시 0분 0초 -> 지금까지 흘러온 전체 초
     , TO_CHAR(SYSDATE, 'Q') "COL17"            -- 3            -- 123:1분기 / 456:2분기 / 789:3분기 / 101112:4분기
FROM DUAL;

SELECT 7 "COL1", '7' "COL2", TO_CHAR(7) "COL3"
FROM DUAL;
--==>> 7	7	7
--> 조회 결과가 좌측 정렬(문자)인지 우측 정렬(숫자)인지 확인~!!!

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) "RESULT"
FROM DUAL;
--==>> 2020

--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2020(문자형)    -> 연도를 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 09(문자형)      -> 월을 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 28(문자형)      -> 일을 추출하여 문자 타입으로...
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2020(숫자형)    -> 연도를 추출하여 숫자 타입으로...
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 9(숫자형)       -> 월을 추출하여 숫자 타입으로...
     , EXTRACT(DAY FROM SYSDATE) "COL6"     -- 28(숫자형)      -> 일을 추출하여 숫자 타입으로...
FROM DUAL;
--> 년, 월, 일 이외의 다른 항목은 불가~!!!


--○ TO_CHAR() 활용 -> 형식 맞춤 표기 결과값 반환
SELECT 60000 "COL1"                             -- 60000
     , TO_CHAR(60000) "COL2"                    -- 60000
     , TO_CHAR(60000, '99,999') "COL3"          -- 60,000
     , TO_CHAR(60000, '$99,999') "COL4"         -- $60,000
     , TO_CHAR(60000, 'L99,999') "COL5"         --          \60,000
     , LTRIM(TO_CHAR(60000, 'L99,999')) "COL6"  -- \60,000
FROM DUAL;


--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회하는 쿼리문을 구성한다.
SELECT SYSDATE "현재시간"
     , SYSDATE + 1 + (2/24) + (3/24*60) + (4/(24*60*60)) "1일2시간3분4초후"
FROM DUAL;
--==>> 
/*
2020-09-28 11:48:14	
2020-10-07 01:48:18
*/


--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
--   TO_YMINTERVAL(), TO_DSINERVAL)
SELECT SYSDATE "현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산 시간"
FROM DUAL;
--==>>
/*
2020-09-28 11:51:14	
2021-12-01 15:56:20
*/

--------------------------------------------------------------------------------

--○ CASE 구문(조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2는 몰라요' END
FROM DUAL;
--==>> 5+2는 몰라요

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 2 THEN '1+1=4'
                ELSE '몰라'
       END
FROM DUAL;
--==>> 1+1=2

SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-3=3 THEN '6-3=3'
            WHEN 2*1=3 THEN '2*1=3'
            WHEN 6/3=3 THEN '6/3=3'
            ELSE '몰라'
       END
FROM DUAL;
--==>> 6-3=3

--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라요')
FROM DUAL;
--==>> 5-2=3


--○ CASE WHEN THEN ELSE END 활용
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5와 2는 비교 불가'
       END
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '홍준만세'
            WHEN 5>2 OR 2=3 THEN '승범만세'
            ELSE '해진만세'
       END
FROM DUAL;
--==>> 홍준만세

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '홍준만세'
            WHEN 5<2 AND 2=3 THEN '승범만세'
            WHEN 1+1=2 AND 2+2=4 THEN '민하만세'
            ELSE '해진만세'
       END
FROM DUAL;
--==>> 홍준만세


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '홍준만세'
            WHEN 5<2 AND 2=3 THEN '승범만세'
            WHEN 1+1=2 AND 2+2=4 THEN '민하만세'
            ELSE '해진만세'
       END
FROM DUAL;
--==>> 민하만세


--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○ TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
--   [사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 정년퇴직일, 근무일수, 남은일수, 급여, 보너스]
--  단, 현재나이는 기본 한국나이 계산법에 따라 연산을 수행한다.
--  또한, 정년퇴직일은 해당 직원의 나이가 한국 나이로 60세가 되는 해의
--  그 직원의 입사월, 일로 연산을 수행한다.
--  그리고, 보너스는 1000일 이상 2000일 미만 근무한 사원은
--- 그 사원의 원래 급여 기준 30% 지급, 2000일 이상 근무한 사원은
--  그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.

-- MY CODE
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN,7, 1) IN ('1', '3') THEN '남자' ELSE '여자' END "성별"
     , CASE WHEN SUBSTR(JUBUN,7, 1) IN ('3', '4') 
         THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END "현재나이"
     , HIREDATE "입사일"
     , HIREDATE + TO_YMINTERVAL(TO_CHAR(60 - (CASE WHEN SUBSTR(JUBUN,7, 1) IN (3, 4) 
         THEN TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END))||'-00') "정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"
     , TRUNC(HIREDATE + TO_YMINTERVAL(TO_CHAR(60 - (CASE WHEN SUBSTR(JUBUN,7, 1) IN (3, 4) 
         THEN TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END))||'-00') - SYSDATE) "남은일수"
     , SAL "급여"
     , CASE WHEN (1000 <= TRUNC(SYSDATE - HIREDATE) AND TRUNC(SYSDATE - HIREDATE) < 2000) 
            THEN SAL * (3/10)
            WHEN 2000 <= TRUNC(SYSDATE - HIREDATE) 
            THEN SAL * (5/10)
            ELSE 0
       END "보너스"
FROM TBL_SAWON;


-- TEACHER'S CODE
SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN 주민번호 7번째자리 1개가 '1' 또는 '3' THEN '남성' 
            THEN 주민번호 7번째자리 1개가 '2' 또는 '4' THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1
     , CASE WHEN 1900년대 생이라면 THEN 현재년도 - (주민번호앞두자리 + 1899)
            WHEN 2000년대 생이라면 THEN 현재년도 - (주민번호앞두자리 + 1999)
            ELSE -1
       END "현재나이"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1
     , CASE WHEN 주민번호 7번째자리 1개가 '1' 또는 '2' 라면 THEN 현재년도 - (주민번호앞두자리 + 1899)
            WHEN 주민번호 7번째자리 1개가 '3' 또는 '4' 라면 THEN 현재년도 - (주민번호앞두자리 + 1999)
            ELSE -1
       END "현재나이"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (주민번호앞두자리 + 1899) 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (주민번호앞두자리 + 1999)
            ELSE -1
       END "현재나이"
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
            ELSE '성별확인불가' 
       END "성별"
       -- 현재나이 = 현재년도 - 태어난년도 + 1
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE -1
       END "현재나이"
       -- 입사일
     , HIREDATE "입사일"
       -- 급여
     , SAL "급여"
FROM TBL_SAWON;
--==>>
/*
1012	선우선	    0203024234567	여성	19	2002-07-14	2000
1001	강정우	    9611111234567	남성	25	2005-01-03	3000
1002	정의진	    9412212234567	여성	27	1999-11-23	4000
1003	박해진	    9503092234567	여성	26	2006-08-10	1000
1004	박해일	    7502031234567	남성	46	1990-09-20	2000
1005	이준구	    9606221234567	남성	25	2007-10-10	2000
1006	이진주	    9405222234567	여성	27	2010-12-20	3000
1009	황진이	    7202022234567	여성	49	1998-03-16	2000
1010	선동렬	    7505051234567	남성	46	1998-03-16	1000
1011	선우용녀	6909092234567	여성	52	1996-01-10	1000
1013	남희석	    0101013234567	남성	20	2002-07-14	1000
1014	남궁민	    0402063234567	남성	17	2012-08-14	1000
1015	허수민	    9510302234567	여성	26	2010-05-06	4600
1016	남진	    7212121234567	남성	49	1995-05-06	2000
1007	아이유	    0203044234567	여성	19	2012-04-06	1000
1008	이하이	    0506074234567	여성	16	2016-08-17	1000
1017	이이제	    0603194234567	여성	15	2015-01-20	1500
*/


SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    -- 정년퇴직일
    -- 정년퇴직년도 -> 해당 직원의 나이가 한국나이로 60세가 되는 해
    -- 현재 나이가... 57세...  3년 후        2020 -> 2023
    -- 현재 나이가... 28세... 32년 후        2020 -> 2052
    -- ADD_MONTHS(SYSDATE, 남은년수*12)
    --                     ---------
    --                    60 - 현재나이
    -- ADD_MONTHS(SYSDATE, (60 - 현재나이) * 12)    -> 특정 날짜
    -- TO_CHAR(특정일자, 'YYYY')                     -> 정년퇴직 년도만 추출
    -- TO_CHAR('입사일', 'MM-DD')                    -> 월일만 추출
    -- TO_CHAR(특정일자, 'YYYY') || '-' || TO_CHAR('입사일', 'MM-DD') "정년퇴직일"
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - 현재나이) * 12), 'YYYY') || '-'  || TO_CHAR('입사일', 'MM-DD') "정년퇴직일"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    -- 근무일수
    -- 근무일수 = 현재일 - 입사일
     , TRUNC(SYSDATE - T.입사일) "근무일수"
    -- 남은일수
    -- 남은일수 = 정년퇴직일 - 현재일
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    -- 급여
     , T.급여
    -- 보너스
    -- 근무일수가 1000일 이상 2000일 미만 -> 원래 급여의 30% 지급
    -- 근무일수가 2000일 이상             -> 원래 급여의 50% 지급
    -- 나머지                             -> 0
    ----------------------------------------------------------------------------
    -- 근무일수가 2000일 이상             -> 급여 * 0.5
    -- 근무일수가 1000일 이상             -> 급여 * 0.3            
    -- 나머지                             -> 0
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3 
            ELSE 0
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
                ELSE '성별확인불가' 
           END "성별"
           -- 현재나이 = 현재년도 - 태어난년도 + 1
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
           -- 입사일
         , HIREDATE "입사일"
           -- 급여
         , SAL "급여"
    FROM TBL_SAWON
) T;


SELECT *
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) "연봉", SAL*12+NVL(COMM, 0)*2 "두배연봉"
     ,  SAL*12+NVL(COMM, 0)*3 "세배연봉",  SAL*12+NVL(COMM, 0)*4 "네배연봉"
FROM EMP;
-- 뭔가 많이 불편하다...

-- SUBQUERY(INLINE VIEW)
SELECT T.연봉, T.연봉*2 "두배연봉", T.연봉*3 "세배연봉", T.연봉*4 "네배연봉" -- OUTER QUERY
FROM 
(
    SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) "연봉"              -- INNER QUERY
    FROM EMP
) T;


SELECT 사원번호, 사원명
FROM 
(
    SELECT EMPNO "사원번호", ENAME "사원명"
    FROM EMP
);


-- 위 코드에서 주석 제거한 코드
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3 
            ELSE 0
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;


-- 위에서 처리한 내용을 기반으로
-- 특정 근무일수의 사원을 확인해야 한다거나...
-- 특정 보너스 금액을 받는 사원을 확인해야 할 경우가 발생할 수 있다.
-- 이와 같은 경우... 해당 쿼리문을 다시 구성해야 하는 번거로움을 줄일 수 있도록
-- 뷰(VIEW)를 만들어 저장해둘 수 있다.

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3 
            ELSE 0
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>> 에러 발생
-- ORA-01031 : insufficient priviliges
--             (권한 불충분)


--○ SYS계정으로 부터 SCOTT 계정에 VIEW를 CREATE 할 수 있도록 GRANT
-- Grant을(를) 성공했습니다. 
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 2000 THEN T.급여 * 0.5
            WHEN TRUNC(SYSDATE - T.입사일) >= 1000 THEN T.급여 * 0.3 
            ELSE 0
       END "보너스"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'  
                ELSE '성별확인불가' 
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "현재나이"
         , HIREDATE "입사일"
         , SAL "급여"
    FROM TBL_SAWON
) T;
-- View VIEW_SAWON이(가) 생성되었습니다.


SELECT *
FROM VIEW_SAWON;
--==>>
/*
1012	선우선	    0203024234567	여성	19	2002-07-14	2061-07-14	6651	14898	2000	1000
1001	강정우	    9611111234567	남성	25	2005-01-03	2055-01-03	5747	12514	3000	1500
1002	정의진	    9412212234567	여성	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1003	박해진	    9503092234567	여성	26	2006-08-10	2054-08-10	5163	12368	1000	500
1004	박해일	    7502031234567	남성	46	1990-09-20	2034-09-20	10966	5104	2000	1000
1005	이준구	    9606221234567	남성	25	2007-10-10	2055-10-10	4737	12794	2000	1000
1006	이진주	    9405222234567	여성	27	2010-12-20	2053-12-20	3570	12135	3000	1500
1009	황진이	    7202022234567	여성	49	1998-03-16	2031-03-16	8232	3820	2000	1000
1010	선동렬	    7505051234567	남성	46	1998-03-16	2034-03-16	8232	4916	1000	500
1011	선우용녀	6909092234567	여성	52	1996-01-10	2028-01-10	9028	2659	1000	500
1013	남희석	    0101013234567	남성	20	2002-07-14	2060-07-14	6651	14533	1000	500
1014	남궁민	    0402063234567	남성	17	2012-08-14	2063-08-14	2967	15659	1000	500
1015	허수민	    9510302234567	여성	26	2010-05-06	2054-05-06	3798	12272	4600	2300
1016	남진	    7212121234567	남성	49	1995-05-06	2031-05-06	9277	3871	2000	1000
1007	아이유	    0203044234567	여성	19	2012-04-06	2061-04-06	3097	14799	1000	500
1008	이하이	    0506074234567	여성	16	2016-08-17	2064-08-17	1503	16028	1000	300
1017	이이제	    0603194234567	여성	15	2015-01-20	2065-01-20	2078	16184	1500	750
*/


SELECT *
FROM VIEW_SAWON
WHERE 근무일수 >= 10000;
--==>> 1004	박해일	7502031234567	남성	46	1990-09-20	2034-09-20	10966	5104	2000	1000

SELECT *
FROM VIEW_SAWON
WHERE 보너스 >= 2000;
--==>>
/*
1002	정의진	9412212234567	여성	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1015	허수민	9510302234567	여성	26	2010-05-06	2054-05-06	3798	12272	4600	2300
*/


/*
테이블생성 --------------- 뷰 생성 -------------- 레코드 입력 ------------- 뷰 조회
 (100)                      (100)                   (10)                     (110)
*/

CREATE OR REPLACE VIEW VIEW_EMP
AS
SELECT EMPNO, ENAME, JOB, SAL, SAL*12+NVL(COMM, 0) "연봉"
FROM EMP;


SELECT *
FROM VIEW_EMP;


--○ TBL_SAWON 테이블을 대상으로 
--   서브쿼리를 활용하여 다음과 같이 조회할 수 있도록 한다.
---------------------------------------------------
--   사원명   성별   현재나이   급여   나이보너스
---------------------------------------------------

--   단, 나이보너스는 현재 나이가 40세 이상이면 급여의 70%
--   30세 이상 40세 미만이면 급여의 50%
--   20세 이상 30세 미만이면 급여의 30%로 한다.

--   또한, 완성된 조회 구분을 통해
--   VIEW_SAWON2 라는 이름의 뷰(VIEW)를 생성한다.

-- 서브쿼리를 이용한 쿼리문
SELECT T.*
     , CASE WHEN 40 <= 현재나이 THEN 급여 * 0.7
            WHEN 30 <= 현재나이 THEN 급여 * 0.5
            WHEN 20 <= 현재나이 THEN 급여 * 0.3
            ELSE 0
       END "나이보너스"
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
                ELSE '성별판별불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000 - 1)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900 - 1)
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;

-- VIEW 생성
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT 사원명, 성별, 현재나이, 급여
     , CASE WHEN 40 <= 현재나이 THEN 급여 * 0.7
            WHEN 30 <= 현재나이 THEN 급여 * 0.5
            WHEN 20 <= 현재나이 THEN 급여 * 0.3
            ELSE 0
       END "나이보너스"
FROM
(
    SELECT SANAME "사원명"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남성'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여성'
                ELSE '성별판별불가'
           END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000 - 1)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900 - 1)
                ELSE -1
           END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;

-- 확인
SELECT * 
FROM VIEW_SAWON;
--==>>
/*
1012	선우선	    0203024234567	여성	19	2002-07-14	2061-07-14	6651	14898	2000	1000
1001	강정우	    9611111234567	남성	25	2005-01-03	2055-01-03	5747	12514	3000	1500
1002	정의진	    9412212234567	여성	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1003	박해진	    9503092234567	여성	26	2006-08-10	2054-08-10	5163	12368	1000	500
1004	박해일	    7502031234567	남성	46	1990-09-20	2034-09-20	10966	5104	2000	1000
1005	이준구	    9606221234567	남성	25	2007-10-10	2055-10-10	4737	12794	2000	1000
1006	이진주	    9405222234567	여성	27	2010-12-20	2053-12-20	3570	12135	3000	1500
1009	황진이	    7202022234567	여성	49	1998-03-16	2031-03-16	8232	3820	2000	1000
1010	선동렬	    7505051234567	남성	46	1998-03-16	2034-03-16	8232	4916	1000	500
1011	선우용녀	6909092234567	여성	52	1996-01-10	2028-01-10	9028	2659	1000	500
1013	남희석	    0101013234567	남성	20	2002-07-14	2060-07-14	6651	14533	1000	500
1014	남궁민	    0402063234567	남성	17	2012-08-14	2063-08-14	2967	15659	1000	500
1015	허수민	    9510302234567	여성	26	2010-05-06	2054-05-06	3798	12272	4600	2300
1016	남진	    7212121234567	남성	49	1995-05-06	2031-05-06	9277	3871	2000	1000
1007	아이유	    0203044234567	여성	19	2012-04-06	2061-04-06	3097	14799	1000	500
1008	이하이	    0506074234567	여성	16	2016-08-17	2064-08-17	1503	16028	1000	300
1017	이이제	    0603194234567	여성	15	2015-01-20	2065-01-20	2078	16184	1500	750
*/