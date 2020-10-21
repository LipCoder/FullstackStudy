--�� ����
--   - ���� ���� : 20201020_02_scott(plsql)_ȫ�浿.sql
--   - ���� ����
--   ���� ���ν����� �����Ѵ�.
--    * PRC_�԰�_UDPATE(�԰��ȣ, �԰����) 
--    * PRC_�԰�_DELETE(�԰��ȣ)
--    * PRC_���_DELETE(����ȣ)
--    --> �̹� ���� ��Ȳ�� ����������.

SELECT USER
FROM DUAL;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_���_DELETE
(
    V_����ȣ  IN  TBL_���.����ȣ%TYPE
)
IS
    V_��ǰ�ڵ�  TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������  TBL_���.������%TYPE;
BEGIN
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- ��ǰ���̺� ������Ʈ
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- ������� ����
    DELETE 
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_���_DELETE��(��) �����ϵǾ����ϴ�.




CREATE OR REPLACE PROCEDURE PRC_�԰�_UPDATE
(
  V_�԰��ȣ     IN  TBL_�԰�.�԰��ȣ%TYPE
, V_�԰����     IN  TBL_�԰�.�԰����%TYPE
)
IS
    V_��ǰ�ڵ�   TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������   TBL_��ǰ.������%TYPE;
    
    V_�����԰���� TBL_�԰�.�԰����%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_������ 
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�; 
    
    -- ������ �԰������ �����԰�������� ���� ���
    -- ������ ������ ��� �������� Ŀ���� �Ұ����ϴٸ�
    -- ������Ʈ�� �� �� ����
    IF ( V_�԰���� < V_�����԰����
     AND (V_�����԰���� - V_�԰����) > V_������ )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �԰� ���̺� ������Ʈ
    UPDATE TBL_�԰�
    SET �԰���� = V_�԰����
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- ��ǰ ���̺� ������Ʈ
    UPDATE TBL_��ǰ
    SET ������ = ������ + (V_�԰���� - V_�����԰����)
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR('-20003', '�԰���� �������� ���� ���������� Ů�ϴ�.'); 
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_�԰�_UPDATE��(��) �����ϵǾ����ϴ�.


CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
( 
  V_�԰��ȣ    IN  TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_��ǰ�ڵ�   TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������   TBL_��ǰ.������%TYPE;
    V_�����԰���� TBL_�԰�.�԰����%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_������ 
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�; 
    
    -- ������ �԰������ ���������� Ŀ���� �Ұ����ϴٸ�
    -- ������ �� ����.
    IF ( V_�����԰���� > V_������  )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- �԰� ���̺� ����
    DELETE 
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    -- ��ǰ ���̺� ������Ʈ
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�����԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR('-20004', '������ ������ ���� ���������� �����ϴ�.'); 
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_�԰�_DELETE��(��) �����ϵǾ����ϴ�.

