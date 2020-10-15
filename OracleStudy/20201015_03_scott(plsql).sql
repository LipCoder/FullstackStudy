SELECT USER 
FROM DUAL;
--==>> SCOTT


--■■■ PL/SQL ■■■--

-- 1. PL/SQL(Procedural Language Extension to SQL) 은
--    프로그래밍 언어의 특성을 가지는 SQL 의 확장이며
--    데이터 조작과 질의 문장은 PL/SQL 의 절차적 코드 안에 포함된다.
--    또한, PL/SQL을 사용하면 SQL로 할 수 없는 절차적 작업이 가능하다.
--    여기에서 [절차적] 이라는 단어가 가지는 의미는
--    어떤 것이 어떤 과정을 거쳐서 어떻게 완료되는지
--    그 방법을 정확하게 코드에 기술한다는 것을 의미한다.

-- 2. PL/SQL은 절차적으로 표현하기 위해
--   변수를 선언할 수 있는 기능,
--   참과 거짓을 구별할 수 있는 기능,
--   실행 흐름을 컨트롤할 수 있는 기능 등을 제공한다.

-- 3. PL/SQL 은 블럭 구조로 되어 있으며
--   블럭은 선언 부분, 실행 부분, 예외 처리 부분의
--   세 부분으로 구성되어 있다.
--   또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다.

-- 4. 형식 및 구조
/*
[DECLARE]
    -- 선언문(DECLAREATIONS) (변수)
BEGIN
    -- 실행문(STATEMENTS)    (실행)
    
    [EXCEPTION]
        -- 예외 처리문(EXCEPTION HANDLERS)
END;
*/


int num;
num = 10;

num number;
num := 10;

-- 5. 변수 선언
/*
DECLARE
    변수명 자료형;
    변수명 자료형 := 초기값; --(선언과 동시에 초기화)
BEGIN
END;
*/

-- [DBMS_OUTPUT.PUT_LINE()] 을 통해
-- 화면에 결과를 출력하기 위한 환경변수 설정
SET SERVEROUTPUT ON; -- SERVEROUTPUT 세션은 기본적으로 OFF (한번만 해주면 된다.)

--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(30) := 'Oracle';
BEGIN
    -- 실행부
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
10
HELLO
Oracle


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(30) := 'Oracle';
BEGIN
    -- 실행부
    -- (연산 및 처리)
    D1 := D1 * 10;
    D2 := D2 || ' 김승범';
    D3 := D3 || ' World~!!!';
    
    -- (결과 출력)
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
100
HELLO 김승범
Oracle World~!!!


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ IF 문(조건문)
-- IF ~ THEN ~ ELSE ~ END IF;
-- ELSIF

-- 1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고
--    FALSE 나 NULL 이면 ELSE 와 END IF; 사이의 문장을 수행하게 된다.

-- 2. 형식 및 구조
/*
IF 조건
    THEN 처리문;
ELSIF 조건
    THEN 처리문;
ELSIF 조건
    THEN 처리문;
ELSE 
    처리문
END IF;
*/


--○ 변수에 임의의 값을대입하고 출력하는 구문 작성
DECLARE
    GRADE CHAR; -- NUMBER 형식은 () 없으면 최대범위 CHAR 형식은 () 없으면 최단범위(1문자)
BEGIN
    GRADE := 'F';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('GOOD');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
--==>>
/*
EXCELLENT


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ CASE 문(조건문)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. 형식 및 구조
/*
CASE 변수
    WHEN 값1 THEN 실행문1;
    WHEN 값2 THEN 실행문2;
    ELSE 실행문3;
END CASE;
*/



DECLARE
     -- 주요 변수 선언
     SEL    NUMBER := 3;
     RESULT VARCHAR2(10);
BEGIN
     -- 연산 및 처리
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('남자입니다.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('여자입니다.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('확인불가');
     END CASE;
END;
--==>>
/*
(남자입니다.)
(여자입니다.)
확인불가


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 외부 입력 처리
-- ACCEPT 구문
-- ACCEPT 변수명 PROMPT '메세지';
--> 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
--   [&외부변수명] 형태로 접근하게 된다.


-- 외부에서 값을 받아오기
ACCEPT NUM PROMPT '남자1 여자2 입력하세요';

DECLARE
     -- 주요 변수 선언
     SEL    NUMBER := &NUM;
     RESULT VARCHAR2(10);
BEGIN
     -- 연산 및 처리
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('남자입니다.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('여자입니다.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('확인불가');
     END CASE;
END;



ACCEPT NUM PROMPT '남자1 여자2 입력하세요';

DECLARE
     -- 주요 변수 선언
     SEL    NUMBER := &NUM;
     RESULT VARCHAR2(10) := '남자';
BEGIN
     -- 연산 및 처리
     /*
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('남자입니다.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('여자입니다.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('확인불가');
     END CASE;
     */
     
     CASE SEL
         WHEN 1
         THEN RESULT := '남자';
         WHEN 2
         THEN RESULT := '여자';
         ELSE
              RESULT := '확인불가';
     END CASE;
     
     -- 결과 출력
     DBMS_OUTPUT.PUT_LINE('처리 결과는 ' || RESULT || ' 입니다.');
END;



--○ 정수 2개를 외부로부터(사용자로부터) 입력받아
--   이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.

ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요'
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요'
   
DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    RESULT NUMBER := 0;
BEGIN
    -- 테스트
    DBMS_OUTPUT.PUT_LINE('NUM1 : ' || NUM1);
    DBMS_OUTPUT.PUT_LINE('NUM2 : ' || NUM2);

    -- 연산 및 처리
    RESULT := NUM1 + NUM2;
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || RESULT);
    
END;
--==>>
/*
NUM1 : 12
NUM2 : 21
12 + 21 = 33


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


ACCEPT N1 PROMPT '정수 N1을 입력하세요'
ACCEPT N2 PROMPT '정수 N2을 입력하세요'
   
DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    RESULT NUMBER = 0;
BEGIN
    RESULT := NUM1 + NUM2;
    DBMS_OUTPUT.PUT_LINE('정수 2개의 합은 ' || RESULT || ' 입니다.');
END;



--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.
--   단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 금액 입력 [   990 ]

입력받은 금액 총액 : 990원
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
*/

ACCEPT IN_PRICE PROMPT '금액 입력'

DECLARE
    PRICE NUMBER := &IN_PRICE;
    FIVE_HUNDRED NUMBER := 0;
    HUNDRED NUMBER := 0;
    FIVE_TEN NUMBER := 0;
    TEN NUMBER := 0;
BEGIN
    FIVE_HUNDRED := TRUNC(PRICE / 500);
    PRICE := PRICE - (500 * FIVE_HUNDRED);
   
    HUNDRED := TRUNC(PRICE / 100);
    PRICE := PRICE - (100 * HUNDRED);
    
    FIVE_TEN := TRUNC(PRICE / 50);
    PRICE := PRICE - (50 * FIVE_TEN);
    
    TEN := TRUNC(PRICE / 10);
    --PRICE := PRICE - (10 * TEN);
    
    DBMS_OUTPUT.PUT_LINE('화폐단위 :' || ' 오백원 ' || FIVE_HUNDRED
                                     || ', 백원 '  || HUNDRED
                                     || ', 오십원 '|| FIVE_TEN
                                     || ', 십원 '  || TEN);
END;
    
    
    
    
    