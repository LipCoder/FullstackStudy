SELECT USER
FROM DUAL;

--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ -> �ݾ� �Է� [   990 ]

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/


-- [DBMS_OUTPUT.PUT_LINE()] �� ����
-- ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����
SET SERVEROUTPUT ON; -- SERVEROUTPUT ������ �⺻������ OFF (�ѹ��� ���ָ� �ȴ�.)


ACCEPT INPUT PROMPT '�ݾ� �Է�'

DECLARE 
    --�� �ֿ� ���� ����
    MONEY   NUMBER := &INPUT;   -- ������ ���� �Է°��� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT;   -- ��� ����� ���� �Է°��� ��Ƶ� ����
                                -- (MONEY ������ ���� �������� ���� ���ϱ� ������...)
    
    M500    NUMBER;             -- 500�� ¥�� ������ ��Ƶ� ����
    M100    NUMBER;             -- 100�� ¥�� ������ ��Ƶ� ����
    M50     NUMBER;             -- 50�� ¥�� ������ ��Ƶ� ����
    M10     NUMBER;             -- 10�� ¥�� ������ ��Ƶ� ����
    
BEGIN
    --�� ���� �� ó��
    -- MONEY �� 500���� ������ ���� ���ϰ� �������� ������.   -> 500���� ����
    M500 := TRUNC(MONEY / 500);
    
    -- MONEY �� 500���� ������ ���� ������ �������� ���Ѵ�.   -> 500���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� ����� �ٽ� MONEY �� ��Ƴ���.
    MONEY := MOD(MONEY, 500);
    
    -- MONEY �� 100���� ������ ���� ���ϰ� �������� ������.    -> 100���� ����
    M100 := TRUNC(MONEY / 100);
    
    -- MONEY �� 100���� ������ ���� ������ �������� ���Ѵ�.    -> 100���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� ����� �ٽ� MONEY �� ��Ƴ���.
    MONEY := MOD(MONEY, 100);
    
    -- MONEY �� 50���� ������ ���� ���ϰ� �������� ������.    -> 50���� ����
    M50 := TRUNC(MONEY / 50);
    
    -- MONEY �� 50���� ������ ���� ������ �������� ���Ѵ�.    -> 50���� ���� Ȯ���ϰ� ���� �ݾ�
    -- �� ����� �ٽ� MONEY �� ��Ƴ���.
    MONEY := MOD(MONEY, 50);
    
    -- MONEY �� 10���� ������ ���� ���ϰ� �������� ������.    -> 10���� ����
    M10 := TRUNC(MONEY / 10);
    
    
    --�� ��� ���
    -- ���յ� ���(ȭ������� ����)�� ���Ŀ� �°� ���� ����Ѵ�.
    
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : ' || MONEY2 || '��');
    
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� ' || M500 ||
                                    ', ��� ' || M100 ||
                                    ', ���ʿ� ' || M50 ||
                                    ', �ʿ� ' || M10);
    
END;


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����.

-- 2. ���� �� ����
/*
LOOP 
    -- ���๮
    EXIT WHEN ����;
    
END LOOP;
*/

--�� 1 ���� 10 ������ �� ���(LOOP�� Ȱ��)
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


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--    WHILE LOOP ������ ����Ѵ�.
--    ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
--    LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
--    LOOP �� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP    -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

--�� 1 ���� 10 ������ �� ��� (WHILE LOOP �� Ȱ��)

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


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;

-- 1. [���ۼ�]���� 1�� �����Ͽ�
--    [������]�� �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� IN ���ۼ� .. ������ LOOP
END LOOP;
*/

--�� 1 ���� 10 ������ �� ���(FOR LOOP �� Ȱ��)
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


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� ������ ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ -> ���� �Է��ϼ��� [   2 ]

2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18
*/
-- LOOP, WHILE LOOP, FOR LOOP ��θ� ����Ͽ� �ذ�

-- LOOP
ACCEPT INPUT PROMPT '���� �Է��ϼ���'

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
ACCEPT INPUT PROMPT '���� �Է��ϼ���'

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
ACCEPT INPUT PROMPT '���� �Է��ϼ���'

DECLARE
    M NUMBER := &INPUT;
    N NUMBER := 1;
BEGIN
    FOR N IN 1 .. 9 LOOP     
        DBMS_OUTPUT.PUT_LINE(M || ' * ' || N || ' = ' || M * N);
    END LOOP;

END;


--�� ������ ��ü(2�� ~ 9��)�� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, ���� �ݺ���(�ݺ����� ��ø) ������ Ȱ���Ѵ�.
/*
���� ��)

==[ 2��]==
2 * 1 = 2
2 * 2 = 4
    :
2 * 9 = 18

==[ 3��]==
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
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '��]==');
        
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
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '��]==');
       
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
        DBMS_OUTPUT.PUT_LINE('==[ ' || DAN || '��]==');
        
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