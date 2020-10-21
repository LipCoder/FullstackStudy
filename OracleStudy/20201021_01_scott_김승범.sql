--�� ����
--   TBL_�԰� ���̺��� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� ������ ������ ���� Ʈ���� �ۼ�
--   Ʈ���Ÿ� : TRG_IBGO

CREATE OR REPLACE TRIGGER TRG_IBGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_�԰�
          FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN  UPDATE TBL_��ǰ
              SET ������ = ������ + :NEW.�԰����
              WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN  UPDATE TBL_��ǰ
              SET ������ = ������ - (:OLD.�԰���� - :NEW.�԰����)
              WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (DELETING)
        THEN  UPDATE TBL_��ǰ 
              SET ������ = ������ - :OLD.�԰����
              WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.

--�� ����
--   TBL_��� ���̺��� ������ �Է�, ����, ���� ��
--   TBL_��ǰ ���̺��� ������ ������ ���� Ʈ���� �ۼ�
--   Ʈ���Ÿ� : TRG_CHULGO
CREATE OR REPLACE TRIGGER TRG_CHULGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_���
          FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN  UPDATE TBL_��ǰ
              SET ������ = ������ - :NEW.������
              WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN  UPDATE TBL_��ǰ
              SET ������ = ������ + (:OLD.������ - :NEW.������)
              WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (DELETING)
        THEN  UPDATE TBL_��ǰ 
              SET ������ = ������ + :OLD.������
              WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;
--==>> Trigger TRG_CHULGO��(��) �����ϵǾ����ϴ�.


--�� ���� �׽�Ʈ
SELECT * FROM TBL_�԰�;
SELECT * FROM TBL_��ǰ;

INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES (19, 'H001', SYSDATE, 10, 400);

UPDATE TBL_�԰�
SET �԰���� = 50
WHERE �԰��ȣ = 19;

DELETE
FROM TBL_�԰�
WHERE �԰��ȣ = 19;


SELECT * FROM TBL_���;
SELECT * FROM TBL_��ǰ;

INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, �������, ������, ���ܰ�)
VALUES (5, 'H001', SYSDATE, 5, 400);

UPDATE TBL_���
SET ������ = 6
WHERE ����ȣ = 5;

DELETE
FROM TBL_���
WHERE ����ȣ = 5;






