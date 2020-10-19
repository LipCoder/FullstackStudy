SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ������ �Է� �� Ư�� �׸��� �����͸� �Է��ϸ�
--                  ------------------
--                  (�й�, �̸�, ��������, ��������, ��������)
--   ���������� ����, ���, ��� �׸� ���� ó���� �Բ� �̷���� �� �ֵ��� �ϴ�
--   ���ν����� �ۼ��Ѵ�. (�����Ѵ�.)
--   ���ν����� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '������', 90, 80, 70);

���ν��� ȣ��� ó���� ���
�й�    �̸�   ��������  ��������  ��������  ����  ���  ���
 1     ������      90       80        70      240    80   B
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(
)
IS 
BEGIN
END;

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN  TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS 
    -- �����
    -- INSERT ������ ������ �ϱ� ���� �ʿ��� ����
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �����
    -- �߰��� ������ �ֿ� �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    -- COMMIT
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����
--   (�й�, ��������, ��������, ��������) ������ ���� ��
--   ����, ���, ��ޱ��� �Բ� �����Ǵ� ���ν����� �����Ѵ�.
--   ���ν����� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

���ν��� ȣ��� ó���� ���
�й�    �̸�   ��������  ��������  ��������  ����  ���  ���
 1     ������      50       50        50     150    50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN    IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR       IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT TBL_SUNGJUK.TOT%TYPE;
    V_AVG TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60) 
        THEN V_GRADE := 'D';
    ELSE 
        V_GRADE := 'F';
    END IF;
    
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT
      , TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.


--�� TBL_STUDENTS ���̺��� ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�)
--   ���ν����� �����Ѵ�. (�ۼ��Ѵ�.)
--   ��, IP �� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� ó���Ѵ�.
--   ���ν����� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006', '010-7979-7979', '������ Ⱦ��');
--==>> ������ ���� X

EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-7979-7979', '������ Ⱦ��');
--==>> ������ ���� ��
*/

-- TEACHER'S CODE
-- 1. JOIN
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE ( SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2
            ON T1.ID = T2.ID )  T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID
      AND T.PW = V_PW;
     
    COMMIT;
END;

-- 2. JOIN ���� �ʴ¹��
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
    V_PW2   TBL_IDPW.PW%TYPE;
    V_FLAG  NUMBER := 0;
BEGIN
    SELECT PW INTO V_PW2
    FROM TBL_IDPW
    WHERE ID = V_ID;
    
    IF (V_PW = V_PW2)
        THEN V_FLAG := 1;
    ELSE
        V_FLAG := 2;
    END IF;
     
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND V_FLAG = 1;
     
    COMMIT;
END;

-- MY CODE
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN  TBL_IDPW.ID%TYPE
, V_PW  IN  TBL_IDPW.PW%TYPE
, V_TEL IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS 
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE ID = V_ID
      AND 0 <> (SELECT COUNT(*)
                FROM TBL_IDPW T
                WHERE T.ID = V_ID
                  AND T.PW = V_PW);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.


DESC TBL_INSA;

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   ���� ������ �÷� ��
--   NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   �� ������ �Է� ��
--   NUM �÷�(�����ȣ)�� ����
--   ���� �ο��� ��� ��ȣ�� ������ ��ȣ �� ���� ��ȣ�� 
--   �ڵ����� �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
--   ���ν����� : PRC_INSA_INSERT()
/*
���� ��)
EXEC PRC_INSA_INSERT('�躸��', '940524-2234567', SYSDATE, '����', '010-5896-0858'
                   , '���ߺ�', '�븮', 3000000, 3000000);
���ν��� ȣ��� ó���� ���
1061  �躸��  940524-2234567  SYSDATE  ����  010-5896-0858  ���ߺ�  �븮  3000000  3000000
*/

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN      TBL_INSA.NAME%TYPE
, V_SSN         IN      TBL_INSA.SSN%TYPE
, V_IBSADATE    IN      TBL_INSA.IBSADATE%TYPE
, V_CITY        IN      TBL_INSA.CITY%TYPE
, V_TEL         IN      TBL_INSA.TEL%TYPE
, V_BUSEO       IN      TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN      TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN      TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN      TBL_INSA.SUDANG%TYPE
)
IS
    V_MAXNUM    TBL_INSA.NUM%TYPE;
BEGIN
    SELECT NVL(MAX(NUM), 0) INTO V_MAXNUM    -- �ȿ� �����Ͱ� ���� ��� MAX�� NULL�� �ɰ��̴�.
    FROM TBL_INSA;                           -- �׷��Ƿ� NVL�� ó���� ����� �Ѵ�.
    
    INSERT INTO TBL_INSA
    VALUES(V_MAXNUM + 1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL
         , V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.
    


--�� TBL_��ǰ, TBL_�԰� ���̺��� �������
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �Բ� ������ �� �ִ� ����� ���� ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�. (������ ��� X)
--   TBL_�԰� ���̺� ���� �÷�
--   : �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�
--   ���ν����� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)

DESC TBL_��ǰ;

CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN  TBL_�԰�.��ǰ�ڵ�%TYPE 
, V_�԰����    IN  TBL_�԰�.�԰����%TYPE 
, V_�԰�ܰ�    IN  TBL_�԰�.�԰�ܰ�%TYPE 
)
IS
    MAX�԰��ȣ  TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
    SELECT NVL(MAX(�԰��ȣ), 0) INTO MAX�԰��ȣ
    FROM TBL_�԰�;
   
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
    VALUES(MAX�԰��ȣ + 1, V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);
   
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ó��
    EXCEPTION 
        WHEN OTHERS THEN ROLLBACK;
    -- OTHERS -> STANDARD�ϰ� ����� ��Ȳ�� �ƴҶ� ���� ������ ������ ��������
    -- ROLLBACK -> �ѹ�
    COMMIT;
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.



