SELECT USER
FROM DUAL;

--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.
--   단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 금액 입력 [   990 ]

입력받은 금액 총액 : 990원
화폐단위 : 오백원 1, 백원 4, 오십원 1, 십원 4
*/


-- [DBMS_OUTPUT.PUT_LINE()] 을 통해
-- 화면에 결과를 출력하기 위한 환경변수 설정
SET SERVEROUTPUT ON; -- SERVEROUTPUT 세션은 기본적으로 OFF (한번만 해주면 된다.)


ACCEPT INPUT PROMPT '금액 입력'

DECLARE 
    --○ 주요 변수 선언
    MONEY   NUMBER := &INPUT;   -- 연산을 위해 입력값을 담아둘 변수
    MONEY2  NUMBER := &INPUT;   -- 결과 출력을 위해 입력값을 담아둘 변수
                                -- (MONEY 변수가 연산 과정에서 값이 변하기 때문에...)
    
    M500    NUMBER;             -- 500원 짜리 갯수를 담아둘 변수
    M100    NUMBER;             -- 100원 짜리 갯수를 담아둘 변수
    M50     NUMBER;             -- 50원 짜리 갯수를 담아둘 변수
    M10     NUMBER;             -- 10원 짜리 갯수를 담아둘 변수
    
BEGIN
    --○ 연산 및 처리
    -- MONEY 를 500으로 나눠서 몫을 취하고 나머지는 버린다.   -> 500원의 갯수
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY 를 500으로 나눠서 몫은 버리고 나머지를 취한다.   -> 500원의 갯수 확인하고 남은 금액
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 500);
    
    -- MONEY 를 100으로 나눠서 몫을 취하고 나머지는 버린다.    -> 100원의 갯수
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY 를 100으로 나눠서 몫은 버리고 나머지를 취한다.    -> 100원의 갯수 확인하고 남은 금액
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 100);
    
    -- MONEY 를 50으로 나눠서 몫을 취하고 나머지는 버린다.    -> 50원의 갯수
    M50 := TRUNC(MONEY / 50);
    
    -- MONEY 를 50으로 나눠서 몫은 버리고 나머지를 취한다.    -> 50원의 갯수 확인하고 남은 금액
    -- 이 결과를 다시 MONEY 에 담아낸다.
    MONEY := MOD(MONEY, 50);
    
    -- MONEY 를 10으로 나눠서 몫을 취하고 나머지는 버린다.    -> 10원의 갯수
    M10 := TRUNC(MONEY / 10);
    
    
    --○ 결과 출력
    -- 취합된 결과(화폐단위별 갯수)를 형식에 맞게 최종 출력한다.
    
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || MONEY2 || '원');
    
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 ' || M500 ||
                                    ', 백원 ' || M100 ||
                                    ', 오십원 ' || M50 ||
                                    ', 십원 ' || M10);
    
END;


--○ 기본 반복문
-- LOOP ~ END LOOP;

-- 1. 조건과 상관없이 무조건 반복하는 구문.

-- 2. 형식 및 구조
/*
LOOP 
    -- 실행문
    EXIT WHEN 조건;
    
END LOOP;
*/

--○ 1 부터 10 까지의 수 출력(LOOP문 활용)
DECLARE 
    N NUMBER;
BEGIN
    N := 1;
    
    LOOP 
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N>=10;
        N := N + 1;
    END LOOP;
    
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ WHILE 반복문
-- WHILE LOOP ~ END LOOP;

-- 1. 제어 조건이 TRUE 인 동안 일련의 문장을 반복하기 위해
--    WHILE LOOP 구문을 사용한다.
--    조건은 반복이 시작되는 시점에 체크하게 되어
--    LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.
--    LOOP 를 시작할 때 조건이 FALSE 이면 반복 문장을 탈출하게 된다.

-- 2. 형식 및 구조
/*
WHILE 조건 LOOP    -- 조건이 참인 경우 반복 수행
    -- 실행문;
END LOOP;
*/

--○ 1 부터 10 까지의 수 출력 (WHILE LOOP 문 활용)

DECLARE 
    N NUMBER := 0;
BEGIN
    WHILE N <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ FOR 반복문
-- FOR LOOP ~ END LOOP;

-- 1. [시작수]에서 1씩 증가하여
--    [끝냄수]가 될 때 까지 반복 수행한다.

-- 2. 형식 및 구조
/*
FOR 카운터 IN 시작수 .. 끝냄수 LOOP
END LOOP;
*/

--○ 1 부터 10 까지의 수 출력(FOR LOOP 문 활용)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 사용자로부터 임의의 단(구구단)을 입력받아
--   해당 단수의 구구단 출력하는 PL/SQL 구문을 작성한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 단을 입력하세요 [   2 ]

2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18
*/
-- LOOP, WHILE LOOP, FOR LOOP 모두를 사용하여 해결

-- LOOP
ACCEPT INPUT PROMPT '단을 입력하세요'

DECLARE
    M NUMBER := &INPUT;
    N NUMBER := 1;
BEGIN
    LOOP       
        DBMS_OUTPUT.PUT_LINE(M || ' * ' || N || ' = ' || M * N);
        N := N + 1;
        EXIT WHEN N >= 10;
    END LOOP;

END;

-- WHILE
ACCEPT INPUT PROMPT '단을 입력하세요'

DECLARE
    M NUMBER := &INPUT;
    N NUMBER := 1;
BEGIN
    WHILE N < 10 LOOP     
        DBMS_OUTPUT.PUT_LINE(M || ' * ' || N || ' = ' || M * N);
        N := N + 1;
    END LOOP;

END;

-- FOR
ACCEPT INPUT PROMPT '단을 입력하세요'

DECLARE
    M NUMBER := &INPUT;
    N NUMBER := 1;
BEGIN
    FOR N IN 1 .. 9 LOOP     
        DBMS_OUTPUT.PUT_LINE(M || ' * ' || N || ' = ' || M * N);
    END LOOP;

END;


--○ 구구단 전체(2단 ~ 9단)를 출력하는 PL/SQL 구문을 작성한다.
--   단, 이중 반복문(반복문의 중첩) 구문을 활용한다.
/*
실행 예)

==[ 2단]==
2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18

==[ 3단]==
3 * 1 = 3
3 * 2 = 6
    : 
3 * 9 = 27
    
    :
9 * 9 = 81
*/

-- FOR FOR
DECLARE
    DAN NUMBER;
    N NUMBER;
BEGIN
    FOR DAN IN 2 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '단]==');
        
        FOR N IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN * N);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;

-- WHILE WHILE
DECLARE
    DAN NUMBER := 2;
    N NUMBER := 1;
BEGIN
    WHILE DAN < 10 LOOP
        N := 1;
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '단]==');
       
        WHILE N < 10 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN * N);
            N := N + 1;
        END LOOP;
       
        DBMS_OUTPUT.PUT_LINE('');
        DAN := DAN + 1;
    END LOOP;
END;

-- LOOP LOOP
DECLARE
    DAN NUMBER := 2;
    N NUMBER := 1;
BEGIN
    LOOP 
        N := 1;
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '단]==');
        
        LOOP
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || DAN * N);
            N := N + 1;
            EXIT WHEN N >= 10;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('');
        DAN := DAN + 1;
        EXIT WHEN DAN >= 10;
    END LOOP;
END;