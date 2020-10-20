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
BEGIN
    -- ������ ���� ������ ���� ���θ� Ȯ���ϴ� ��������
    -- ��� �ľ� -> ������ �������� �ľ��ϴ� ������ ����Ǿ�� �Ѵ�.
    -- �׷��� ��� ������ �񱳰� �����ϱ� ������...
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;


    -- ��� ���������� �������� �������� ���� ���� Ȯ��
    -- �ľ��� ���������� �������� ������ ���� �߻�
    

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
    
    
    
    
END;