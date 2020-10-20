SELECT USER
FROM DUAL;
--==>> SCOTT


--���� ���ν��� �������� ���� ó�� ����--

--�� TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν��� �ۼ�
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����', '���', '����' �� �Է��� �����ϵ��� ����
--   �� ���� �̿��� �ٸ� ������ ���ν��� ȣ���� ���� �Է��ϰ��� �ϴ� ���
--   (��, �Է��� �õ��ϴ� ���)
--   ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.
--   ���ν����� : PRC_MEMBER_INSERT()
/*
���� ��)
EXEC PRC_MEMBER_INSERT('������', '010-1111-1111', '����');
--==>> ������ �Է� ��

EXEC PRC_MEMBER_INSERT('������', '010-2222-2222', '�λ�');
--==>> ������ �Է� ��
*/

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT 
( V_NAME    IN  TBL_MEMBER.NAME%TYPE
, V_TEL     IN  TBL_MEMBER.TEL%TYPE
, V_CITY    IN  TBL_MEMBER.CITY%TYPE
)
IS
    -- ���� ������ ������ ������ ���� �ʿ��� ���� �߰� ����
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;

BEGIN
    
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ����������
    -- �ƴ����� ���θ� ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF (V_CITY NOT IN ('����', '���', '����'))
        -- ���� �߻� CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR; -- USER_DEFINE_ERROR��� ���ܸ� �߻�(THROW)
        
    END IF;

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- ������ ���� -> INSERT -> TBL_MEMBER
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- Ŀ��
    COMMIT;
    
    -- ���� ó�� ����
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '����,���,������ �Է��� �����մϴ�.');
        WHEN OTHERS
            THEN ROLLBACK;
        
END;
--==>> Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_��� ���̺� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
--   ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����.
--   ����, ��� ������ ���������� ���� ���...
--   ��� �׼��� ����� �� �ֵ��� ó���Ѵ�. (��� �̷������ �ʵ���...)
--   ���ν����� : PRC_���_INSERT()
/*
���� ��)
EXEC PRC_���_INSERT('H003', 10, 500);

*/
CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�     IN      TBL_���.��ǰ�ڵ�%TYPE
, V_������     IN      TBL_���.������%TYPE
, V_���ܰ�     IN      TBL_���.���ܰ�%TYPE
)
IS
    V_MAX����ȣ   TBL_���.����ȣ%TYPE;
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT NVL(MAX(����ȣ), 0) INTO V_MAX����ȣ 
    FROM TBL_���;
    
    SELECT ������ INTO V_������  
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    IF (V_������ - V_������ < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES ((V_MAX����ȣ + 1), V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�������� �����մϴ�.');
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


CREATE OR REPLACE PROCEDURE PRC_���_INSERT
( V_��ǰ�ڵ�    IN TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_������    IN TBL_���.������%TYPE
, V_���ܰ�    IN TBL_���.���ܰ�%TYPE
)
IS
    -- ������ ������ ���� �߰� ���� ����
    V_����ȣ  TBL_���.����ȣ%TYPE;
    V_������  TBL_��ǰ.������%TYPE;
    
    -- ����� ���� ���� ����
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- ������ ���� ������ ���� ���θ� Ȯ���ϴ� ��������
    -- ��� �ľ� -> ������ �������� �ľ��ϴ� ������ ����Ǿ�� �Ѵ�.
    -- �׷��� ��� ������ �񱳰� �����ϱ� ������...
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;


    -- ��� ���������� �������� �������� ���� ���� Ȯ��
    -- �ľ��� ���������� �������� ������ ���� �߻�
    IF (V_������ > V_������)
        -- ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(����ȣ), 0) INTO V_����ȣ
    FROM TBL_���;


    -- ������ ���� -> INSERT -> TBL_���
    INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
    VALUES(V_����ȣ + 1, V_��ǰ�ڵ�, V_������, V_���ܰ�);
    
    
    -- ������ ���� -> UPDATE -> TBL_��ǰ
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    
    -- Ŀ��
    COMMIT;
    
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '��� ����~!!!');
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ�
--   ���ν����� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/

-- teacher's code
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
(
    -- �� �Ű����� ����
    V_����ȣ       IN   TBL_���.����ȣ%TYPE
  , V_������       IN   TBL_���.������%TYPE
)
IS
    -- �� �ʿ��� ���� ����
    V_��ǰ�ڵ�      TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������  TBL_���.������%TYPE;  
    V_������      TBL_��ǰ.������%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    
BEGIN
 
    -- �� ������ ������ �� ��Ƴ���
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;


    -- �� ������ �ľ�
    --    ��� ������࿩�� �Ǵ� �ʿ�
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    
    -- �� �ľ��� �������� ���� ������ ���� �ǽ� ���� �Ǵ�
    --    (������ + ���������� < ���������� �� ��Ȳ�̶��... ����� ���� ���� �߻�)
    IF ( (V_������ + V_����������) < V_������ )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �� ����� ������ üũ (UPDATE -> TBL_��� / UPDATE -> TBL_��ǰ)
    UPDATE TBL_���
    SET ������ = V_������
    WHERE ����ȣ = V_����ȣ;
    
    -- �� 
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_���������� - V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    
    -- �� Ŀ��
    COMMIT;
    
    
    -- �� ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '���� ����~!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.

-- my code
CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( V_����ȣ       IN   TBL_���.����ȣ%TYPE
, V_�����Ҽ���     IN   TBL_���.������%TYPE
)
IS
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_����������  TBL_���.������%TYPE := -1;
    V_������  TBL_��ǰ.������%TYPE := -1;
    
    USER_DEFINE_ERROR0   EXCEPTION;
    USER_DEFINE_ERROR1   EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION;
BEGIN
    IF (NULL = (SELECT ����ȣ FROM TBL_��� WHERE ����ȣ = V_����ȣ))
        THEN RAISE USER_DEFINE_ERROR0;

    END IF;

    -- ����ȣ�� �˸´� ��ǰ�ڵ� ����
    SELECT ��ǰ�ڵ� INTO V_��ǰ�ڵ�
    FROM TBL_���
    WHERE  ����ȣ = V_����ȣ;
    
    -- ��ǰ�ڵ忡 �´� ��ǰ�� ��� ����
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ���� ����ȣ���� ����� ���� ����
    SELECT ������ INTO V_����������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- �˸��� ������ �˻����� ���� ���
    IF (V_���������� = -1 OR V_������ = -1)
        THEN RAISE USER_DEFINE_ERROR1;
    -- �����Ѽ����� ���� ��ǰ�������� ū���
    ELSIF (V_���������� + V_������ < V_�����Ҽ���)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- ������Ʈ
    UPDATE TBL_��ǰ 
    SET ������ = (V_���������� + V_������) - V_�����Ҽ���
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    UPDATE TBL_���
    SET ������ = V_�����Ҽ���
    WHERE ����ȣ = V_����ȣ;
    
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR0
            THEN RAISE_APPLICATION_ERROR('-20003', '����ȣ�� ã�� �� �����ϴ�.');
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR('-20004', '��ǰ�� ã�� �� �����ϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR('-20005', '������ ������ ���������� Ů�ϴ�.');
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.



--�� ����
--   - ���� ���� : 20201020_02_scott(plsql)_ȫ�浿.sql
--   - ���� ����
--   ���� ���ν����� �����Ѵ�.
--    * PRC_�԰�_UDPATE(�԰��ȣ, �԰����) 
--    * PRC_�԰�_DELETE(�԰��ȣ)
--    * PRC_���_DELETE(����ȣ)
--    --> �̹� ���� ��Ȳ�� ����������.



--------------------------------------------------------------------------------

--���� CURSOR(Ŀ��) ����--

-- 1. ����Ŭ������ �ϳ��� ���ڵ尡 �ƴ� ���� ���ڵ�� ������
--    �۾� �������� SQL ���� �����ϰ� �� �������� �߻��� ������
--    �����ϱ� ���� Ŀ��(CURSOR)�� ����ϸ�,
--    Ŀ������ �Ͻ����� Ŀ���� ������� Ŀ���� �ִ�.

-- 2. �Ͻ��� Ŀ���� ��� SQL ���� �����ϸ�
--    SQL �� ���� �� ���� �ϳ��� ��(ROW)�� ����ϰ� �ȴ�.
--    �׷��� SQL ���� ������ �����(RESULT SET)��
--    ���� ��(ROW)���� ������ ���
--    Ŀ��(CURSOR)�� ��������� �����Ͼ� ���� ��(ROW)�� �ٷ� �� �ִ�.


--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM = 1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
END;
--==>> ȫ�浿 -- 011-2356-4528


--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
END;
--==>> ���� �߻�
--     (ORA-01422: exact fetch returns more than requested number of rows)


--�� Ŀ�� �̿� �� ȲȲ(���� �� ���� �� - �ݺ��� Ȱ��)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
        V_NUM := V_NUM + 1;
        
        EXIT WHEN V_NUM >= 1061;
        
    END LOOP;
END;


--�� Ŀ�� �̿� �� ��Ȳ
DECLARE 
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- Ŀ�� �̿��� ���� Ŀ������ ����(-> Ŀ�� ����)
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- Ŀ�� ����
    OPEN CUR_INSA_SELECT;
    
    -- Ŀ�� ���� �� ����������� �����͵� ó��(��Ƴ���)
    LOOP
        -- �� �� �� �� �޾ƴٰ� ó���ϴ� ���� -> [FETCH]
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ����... NOTFOUND
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
    
    END LOOP;
    
    -- Ŀ�� Ŭ����
    CLOSE CUR_INSA_SELECT;
    
END;

-- Ŀ�� ���� : NUM�� ���� �ȴ�.
--             ���� �ϴ� NUM�� 1�� �������� �ʴ��� ��� �����͸� ������ �� �ִ�.


--------------------------------------------------------------------------------

--���� TRIGGER(Ʈ����) ����--

-- �������� �ǹ� : ��Ƽ�, �˹߽�Ű��, �߱��ϴ�, �����ϴ�.

-- 1. TRIGGER(Ʈ����)�� DML �۾� ��, INSERT, UPDATE, DELETE �۾��� �Ͼ ��
--    �ڵ������� ����Ǵ�(���ߵǴ�, �˹ߵǴ�) ��ü��
--    �̿� ���� Ư¡�� �����Ͽ� DML TRIGGER ��� �θ��⵵ �Ѵ�.
--    TRIGGER �� ���Ἲ �� �ƴ϶�
--    ������ ���� �۾����� �θ� ���ȴ�.

-- �ڵ����� �Ļ��� �� �� ����
-- �߸��� Ʈ����� ����
-- ������ ���� ���� ���� ����
-- �л� �����ͺ��̽� ��� �󿡼� ���� ���Ἲ ���� ����
-- ������ ���� ��Ģ ���� ����
-- ������ �̺�Ʈ �α� ����
-- ������ ���� ����
-- ���� ���̺� ���� ��������
-- ���̺� �׼��� ��� ����

-- 2. TRIGGER �������� COMMIT, ROLLBACK ���� ����� �� ����.

-- 3. Ư¡ �� ����

-- BEFORE : ����, AFTER : ����
-- STATEMENT : �Ѱ���, ROW : �����

--    - BEFORE STATEMENT
--      SQL ������ ����Ǳ� ���� �� ���忡 ���� �� �� ����
--    - BEFORE ROW
--      SQL ������ ����Ǳ� ����(DML �۾��� �����ϱ� ����)
--      �� ��(ROW)�� ���� �� ���� ����
--    - AFTER STATEMENT
--      SQL ������ ����� �Ŀ� �� ���忡 ���� �� �� ����
--    - AFTER ROW
--      SQL ������ ����� �Ŀ�(DML �۾��� ������ �Ŀ�)
--      �� ��(ROW)�� ���� �� ���� ����


-- 4. ���� �� ����
/*
CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
    [BEFORE | AFTER]
    �̺�Ʈ1 [OR �̺�Ʈ2 [OR �̺�Ʈ3]] ON ���̺��  -- �����̵Ǵ� ���̺�
    [FOR EACH ROW [WHEN TRIGGER ����]]
[DECLARE]
    -- ���� ����;
BEGIN
    -- ���� ����;
END;
*/


--���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����
-- �� DML �۾��� ���� �̺�Ʈ ���

--�� TRIGGER(Ʈ����) ����(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    -- �̺�Ʈ ���� ���� (���ǹ��� ���� �б�)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT ������ ����Ǿ����ϴ�.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE ������ ����Ǿ����ϴ�.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE ������ ����Ǿ����ϴ�.');
    END IF;
    
    --COMMIT;
    -- �� TRIGGER �������� COMMIT / ROLLBACK ���� ��� �Ұ�~!!!
END;
--==>> Trigger TRG_EVENTLOG��(��) �����ϵǾ����ϴ�.



--���� BEFORE STATEMENT TRIGGER ��Ȳ �ǽ� ����--
--�� DML �۾� ���� ���� �۾��� ���� ���� ���� Ȯ��

--�� Ʈ���� �ۼ�(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (�۾��ð��� ���� 8�� �����̰ų�... ���� 6�� ���Ķ��...)
        THEN �۾��� �������� ���ϵ��� ó���ϰڴ�.
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_CHAR(SYSDATE, 'HH24') �� ���� 8�� �����̰ų�... 
        TO_CHAR(SYSDATE, 'HH24') �� ���� 6�� ���Ķ��...)
        THEN �۾��� �������� ���ϵ��� ó���ϰڴ�.
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_TEST1_DML
        BEFORE
        INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8
        OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17)
        THEN RAISE_APPLICATION_ERROR(-20003, '�۾��� 08:00 ~ 18:00 ������ �����մϴ�');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML��(��) �����ϵǾ����ϴ�.


