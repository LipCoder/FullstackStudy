SELECT USER
FROM DUAL;

SELECT *
FROM TBL_MEMBER
ORDER BY SID;

DESC TBL_MEMBER;


--�� CallableStatement �ǽ��� ���� ���ν��� ����(�ۼ�)
--   ���ν��� �� : PRC_MEMBERINSERT
--   ���ν��� ��� : TBL_MEMBER ���̺� �����͸� �Է��ϴ� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( VSID  IN TBL_MEMBER.SID%TYPE
, VNAME IN TBL_MEMBER.NAME%TYPE
, VTEL  IN TBL_MEMBER.TEL%TYPE
)
IS
BEGIN
    -- ������ �Է� ������ ����
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES(VSID, VNAME, VTEL);

    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_MEMBERINSERT��(��) �����ϵǾ����ϴ�.


SELECT *
FROM TBL_MEMBER
ORDER BY SID;


--�� CallableStatement �ǽ��� ���� ���ν��� ����(�ۼ�)
--   ���ν��� �� : PRC_MEMBERSELECT
--   ���ν��� ��� : TBL_MEMBER ���̺��� �����͸� �о���� SELECT ���ν���
--   �� ��SYS_REFCURSOR�� �ڷ����� �̿��Ͽ� Ŀ�� �ٷ�� 
CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN VRESULT FOR
    SELECT SID, NAME, TEL
    FROM TBL_MEMBER
    ORDER BY SID;
    --CLOSE VRESULT;  --> �ܺηκ��� Ŀ���� �޾ƿö��� Ŀ���� ������ �ȵȴ�.
END;
--==>> Procedure PRC_MEMBERSELECT��(��) �����ϵǾ����ϴ�.