  SELECT USER 
FROM DUAL;
--==>> SCOTT


--���� PL/SQL ����--

-- 1. PL/SQL(Procedural Language Extension to SQL) ��
--    ���α׷��� ����� Ư���� ������ SQL �� Ȯ���̸�
--    ������ ���۰� ���� ������ PL/SQL �� ������ �ڵ� �ȿ� ���Եȴ�.
--    ����, PL/SQL�� ����ϸ� SQL�� �� �� ���� ������ �۾��� �����ϴ�.
--    ���⿡�� [������] �̶�� �ܾ ������ �ǹ̴�
--    � ���� � ������ ���ļ� ��� �Ϸ�Ǵ���
--    �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�.

-- 2. PL/SQL�� ���������� ǥ���ϱ� ����
--   ������ ������ �� �ִ� ���,
--   ���� ������ ������ �� �ִ� ���,
--   ���� �帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

-- 3. PL/SQL �� �� ������ �Ǿ� ������
--   ���� ���� �κ�, ���� �κ�, ���� ó�� �κ���
--   �� �κ����� �����Ǿ� �ִ�.
--   ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

-- 4. ���� �� ����
/*
[DECLARE]
    -- ����(DECLAREATIONS) (����)
BEGIN
    -- ���๮(STATEMENTS)    (����)
    
    [EXCEPTION]
        -- ���� ó����(EXCEPTION HANDLERS)
END;
*/


int num;
num = 10;

num number;
num := 10;

-- 5. ���� ����
/*
DECLARE
    ������ �ڷ���;
    ������ �ڷ��� := �ʱⰪ; --(����� ���ÿ� �ʱ�ȭ)
BEGIN
END;
*/

-- [DBMS_OUTPUT.PUT_LINE()] �� ����
-- ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����
SET SERVEROUTPUT ON; -- SERVEROUTPUT ������ �⺻������ OFF (�ѹ��� ���ָ� �ȴ�.)

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(30) := 'Oracle';
BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(30) := 'Oracle';
BEGIN
    -- �����
    -- (���� �� ó��)
    D1 := D1 * 10;
    D2 := D2 || ' ��¹�';
    D3 := D3 || ' World~!!!';
    
    -- (��� ���)
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
100
HELLO ��¹�
Oracle World~!!!


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� IF ��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;
-- ELSIF

-- 1. PL/SQL �� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN �� ELSE ������ ������ �����ϰ�
--    FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
/*
IF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSIF ����
    THEN ó����;
ELSE 
    ó����
END IF;
*/


--�� ������ ������ ���������ϰ� ����ϴ� ���� �ۼ�
DECLARE
    GRADE CHAR; -- NUMBER ������ () ������ �ִ���� CHAR ������ () ������ �ִܹ���(1����)
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


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� CASE ��(���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1 THEN ���๮1;
    WHEN ��2 THEN ���๮2;
    ELSE ���๮3;
END CASE;
*/



DECLARE
     -- �ֿ� ���� ����
     SEL    NUMBER := 3;
     RESULT VARCHAR2(10);
BEGIN
     -- ���� �� ó��
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
     END CASE;
END;
--==>>
/*
(�����Դϴ�.)
(�����Դϴ�.)
Ȯ�κҰ�


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� �ܺ� �Է� ó��
-- ACCEPT ����
-- ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
--   [&�ܺκ�����] ���·� �����ϰ� �ȴ�.


-- �ܺο��� ���� �޾ƿ���
ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';

DECLARE
     -- �ֿ� ���� ����
     SEL    NUMBER := &NUM;
     RESULT VARCHAR2(10);
BEGIN
     -- ���� �� ó��
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
     END CASE;
END;



ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';

DECLARE
     -- �ֿ� ���� ����
     SEL    NUMBER := &NUM;
     RESULT VARCHAR2(10) := '����';
BEGIN
     -- ���� �� ó��
     /*
     CASE SEL
         WHEN 1
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         WHEN 2
         THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
         ELSE 
         DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
     END CASE;
     */
     
     CASE SEL
         WHEN 1
         THEN RESULT := '����';
         WHEN 2
         THEN RESULT := '����';
         ELSE
              RESULT := 'Ȯ�κҰ�';
     END CASE;
     
     -- ��� ���
     DBMS_OUTPUT.PUT_LINE('ó�� ����� ' || RESULT || ' �Դϴ�.');
END;



--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���'
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���'
   
DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    RESULT NUMBER := 0;
BEGIN
    -- �׽�Ʈ
    DBMS_OUTPUT.PUT_LINE('NUM1 : ' || NUM1);
    DBMS_OUTPUT.PUT_LINE('NUM2 : ' || NUM2);

    -- ���� �� ó��
    RESULT := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || RESULT);
    
END;
--==>>
/*
NUM1 : 12
NUM2 : 21
12 + 21 = 33


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


ACCEPT N1 PROMPT '���� N1�� �Է��ϼ���'
ACCEPT N2 PROMPT '���� N2�� �Է��ϼ���'
   
DECLARE
    NUM1 NUMBER := &N1;
    NUM2 NUMBER := &N2;
    RESULT NUMBER = 0;
BEGIN
    RESULT := NUM1 + NUM2;
    DBMS_OUTPUT.PUT_LINE('���� 2���� ���� ' || RESULT || ' �Դϴ�.');
END;



--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ -> �ݾ� �Է� [   990 ]

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/

ACCEPT IN_PRICE PROMPT '�ݾ� �Է�'

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
    
    DBMS_OUTPUT.PUT_LINE('ȭ����� :' || ' ����� ' || FIVE_HUNDRED
                                     || ', ��� '  || HUNDRED
                                     || ', ���ʿ� '|| FIVE_TEN
                                     || ', �ʿ� '  || TEN);
END;
    
    
    
    
    