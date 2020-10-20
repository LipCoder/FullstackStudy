SELECT USER
FROM DUAL;
--==>> SCOTT


--���� ���ν��� �������� ���� ó�� ����--

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ���ν��� ���� �۵����� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_MEMBER_INSERT('������', '010-1111-1111', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


--�� ���̺� ��ȸ
SELECT *
FROM TBL_MEMBER;
--==>> 1	������	010-1111-1111	����


EXEC PRC_MEMBER_INSERT('������', '010-2222-2222', '�λ�');
--==>> �����߻�
/*
���� ���� -
ORA-20001: ����,���,������ �Է��� �����մϴ�.
ORA-06512: at "SCOTT.PRC_MEMBER_INSERT", line 37
ORA-06512: at line 1
*/


--�� �ǽ� ���̺� ����(TBL_���)
CREATE TABLE TBL_���
( ����ȣ  NUMBER 
, ��ǰ�ڵ�  VARCHAR2(20)
, �������  DATE DEFAULT SYSDATE
, ������  NUMBER
, ���ܰ�  NUMBER
);
--==>> Table TBL_�����(��) �����Ǿ����ϴ�.

-- ����ȣ PK ����
ALTER TABLE TBL_���
ADD CONSTRAINT ���_����ȣ_PK PRIMARY KEY(����ȣ);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

-- ��ǰ�ڵ� FK ����
ALTER TABLE TBL_���
ADD CONSTRAINT ���_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�)
               REFERENCES TBL_��ǰ(��ǰ�ڵ�);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

