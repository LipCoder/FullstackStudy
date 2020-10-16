SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

--�� SCOTT.TBL_INSA ���̺��� ���� ���� ������ �������� ������ ����
--   (�ݺ��� Ȱ��)
DECLARE
    V_INSA  TBL_INSA%ROWTYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN

    LOOP
    
        SELECT NAME, TEL, BUSEO
                INTO V_INSA.NAME, V_INSA.TEL, V_INSA.BUSEO
        FROM TBL_INSA
        WHERE NUM = V_NUM; -- WHERE NUM = 1001, 1002, ...;
    
        DBMS_OUTPUT.PUT_LINE(V_INSA.NAME   || ' - ' 
                        || V_INSA.TEL || ' - ' 
                        || V_INSA.BUSEO);
                      
        EXIT WHEN V_NUM >= 1060;
    
        V_NUM := V_NUM + 1;
    
    END LOOP;
    
END;
--==>> ����


--------------------------------------------------------------------------------

-- ���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (-> ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ���� �� �� �ִ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[( �Ű�������1 �ڷ���
 , �Ű�������2 �ڷ���
)]
RETURN ������Ÿ��
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���๮;
    ...
    RETURN ��;
    
    [EXCEPTION]
        -- ���� ó�� ����;
        
END;
*/

--�� ����� ���� �Լ�(������ �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.


--�� TBL_INSA ���̺� ���� ���� Ȯ�� �Լ� ����(����)
--   �Լ��� : FN_GENDER()
--                     �� SSN(�ֹε�Ϲ�ȣ) -> '771212-1234567' -> 'YYMMDD-NNNNNNN'

SELECT FN_GENDER('771212-1234567')
FROM DUAL;
--==>> ����
-- �Լ��� ���̺� �������� ��ü�� �ƴϴ�.

CREATE OR REPLACE FUNCTION FN_GENDER( V_SSN VARCHAR2 ) -- �Ű�����   : �ڸ���(����) ���� ����
RETURN VARCHAR2                                        -- ��ȯ�ڷ��� : �ڸ���(����) ���� ����
IS 
    -- ����� -> �ֿ� ���� ����
    V_RESULT    VARCHAR2(20);
BEGIN
    -- ����� -> ���� �� ó��
    IF ( SUBSTR(V_SSN, 8, 1) IN ('1', '3') )
        THEN V_RESULT := '����';
    ELSIF ( SUBSTR(V_SSN, 8, 1) IN ('2', '4') )
        THEN V_RESULT := '����';
    ELSE
        V_RESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ����� ��ȯ
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.




--�� ������ �� ������ �Ű�����(�Է� �Ķ����)�� �Է¹޾� -> (A, B)
--   A �� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--  �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000
*/

/*
CREATE [OR REPLACE] FUNCTION �Լ���
[( �Ű�������1 �ڷ���
 , �Ű�������2 �ڷ���
)]
RETURN ������Ÿ��
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���๮;
    ...
    RETURN ��;
    
    [EXCEPTION]
        -- ���� ó�� ����;
        
END;
*/

CREATE OR REPLACE FUNCTION FN_POW(N NUMBER, P NUMBER)
RETURN NUMBER
IS 
    CAL_COUNT NUMBER := 0;
    RESULT NUMBER := 1;
BEGIN
    WHILE CAL_COUNT < P LOOP
        RESULT := RESULT * N;
        CAL_COUNT := CAL_COUNT + 1;
    END LOOP;
    
    RETURN RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺� ����� �޿� ��� �Լ��� �����Ѵ�.
--   �޿��� [(�⺻��*12)+����] ���� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)

CREATE OR REPLACE FUNCTION FN_PAY(VBASICPAY NUMBER, VSUDANG NUMBER)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := VBASICPAY * 12 + NVL(VSUDANG, 0);
    RETURN VRESULT;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.


--�� TBL_INSA ���̺��� �Ի����� ��������
--   ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)

-- 1
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2010-10-10', 'YYYY-MM-DD'))/12
FROM DUAL;
--==>> 10.0180060546097172441258462763839107925

-- 2
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('2010-10-10', 'YYYY-MM-DD'))/12) ||'��'||
       TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '����'
FROM DUAL;
       
-- 3
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE) "�ٹ��ð�"
FROM TBL_INSA;


CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12)||'��'||
               TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, VIBSADATE), 12)) || '����';

    RETURN VRESULT;
END;


CREATE OR REPLACE FUNCTION FN_WORKYEAR(VIBSADATE DATE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC(MONTHS_BETWEEN(SYSDATE, VIBSADATE)/12, 1);

    RETURN VRESULT;
END;


-- �� �ڵ�
CREATE OR REPLACE FUNCTION FN_WORKYEAR(DDATE DATE)
RETURN NUMBER
IS
    NRESULT NUMBER;
BEGIN
    NRESULT := (SYSDATE - DDATE);
    NRESULT := TRUNC(NRESULT / 365, 1);

    RETURN NRESULT;
END;


--------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- ���� PL/SQL�� -> DML��, TCL���� ��� �����ϴ�.
-- ���� PL/SQL�� -> DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

--------------------------------------------------------------------------------

--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó�����ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDUREF ���ν�����
[( �Ű����� IN ������Ÿ��            -- �Է� �Ķ���� (�ʼ� X)
 , �Ű����� OUT ������Ÿ��           -- ��� �Ķ���� (�ʼ� X)
 , �Ű����� INOUT ������Ÿ��         -- ����� �Ķ���� (�ʼ� X)
)]
IS
    [-- �ֿ� ���� ����;]
BEGIN
    -- ���� ����;
    ...
    [EXCEPTION] 
        -- ���� ó�� ����;
END;
*/

--�� FUNCTION �� ������ �� [RETURN �ڷ���] �κ��� �������� ������,
--   [RETURN] �� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/

--�� ���ν��� �ǽ��� ���� ���̺� ���� �� �غ� ������
--   [20201016_04_scott.sql] ���� ����~!!!

--�� ���ν��� ����
--   ���ν����� : PRC_STDENTS_INSERT('batman', 'java006$', '���Ͽ�', '010-2222-2222', '���� ������')

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
-- �Ű����� ����
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES (V_ID, V_PW);
    
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.