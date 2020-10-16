SELECT USER
FROM DUAL;
--==>> HR


--------------------------------------------------------------------------------

--���� FOREIGN KEY(FK:F:R) ����--

-- 1. ���� Ű �Ǵ� �ܷ� Ű(FK)�� �� ���̺��� ������ �� ������ �����ϰ�
--    ���� �����Ű�µ� ���Ǵ� ���̴�.
--    �� ���̺��� �⺻ Ű ���� �ִ� ����
--    �ٸ� ���̺� �߰��ϸ� ���̺� �� ������ ������ �� �ִ�.
--    �� ��, �� ��° ���̺� �߰��Ǵ� ���� �ܷ�Ű�� �ȴ�.


-- 2. �θ� ���̺�(���� �޴� �÷��� ���Ե� ���̺�)�� ���� ������ ��
--    �ڽ� ���̺�(���� �ϴ� �÷��� ���Ե� ���̺�)�� �����Ǿ�� �Ѵ�.
--    �� ��, �ڽ� ���̺� FOREIGN KEY ���������� �����ȴ�.


-- 3. ���� �� ����
-- �� �÷� ������ ����
-- �÷��� ������Ÿ�� [CONSTRAINT CONSTRAINT��]
--                  REFERENCES �������̺��(�����÷���)
--                  [ON DELETE CASCADE | ON DELETE SET NULL] -> �߰� �ɼ�(������ �ɼ����� ����)
--                            (�Ѵ� ���� �ɼ�)
--                  ������ ������ �θ� ���̺��� ���������� �����ϰ� �� ���� �� �ֱ� ������


-- �� ���̺� ������ ����
-- �÷��� ������Ÿ��,
-- �÷��� ������Ÿ��,
-- CONSTRAINT CONSTRAINT�� FOREIGN KEY(�÷���)
--             REFERENCES �������̺��(�����÷���)
--             [ON DELETE CASCADE | ON DELETE SET NULL] -> �߰� �ɼ�


--�� FOREIGN KEY ���������� �����ϴ� �ǽ��� �����ϱ� ���ؼ���
--   �θ� ���̺��� ���� �۾��� ���� �����ؾ� �Ѵ�.
--   �׸��� �� ��, �θ� ���̺��� �ݵ�� PK �Ǵ� UK ���������� 
--   ������ �÷��� �����ؾ� �Ѵ�.


-- �θ� ���̺� ����
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER
, JIKWI_NAME    VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS��(��) �����Ǿ����ϴ�.

-- �θ� ���̺� ������ �Է�
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1, '���');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2, '�븮');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3, '����');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4, '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

-- Ȯ��
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
4	����
*/

-- Ŀ�� 
COMMIT;
--==>> Ŀ�� �Ϸ�


--�� FK ���� �ǽ�(�� �÷� ���� ����)
-- ���̺� ����
CREATE TABLE TBL_EMP1
( SID       NUMBER          PRIMARY KEY
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER          REFERENCES TBL_JOBS(JIKWI_ID)  -- ����Ű ����
);
--==>> Table TBL_EMP1��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>> 
/*
HR	SYS_C007001	TBL_EMP1	    P	SID		
HR	SYS_C007002	TBL_EMP1    	R	JIKWI_ID		NO ACTION
*/

-- ������ �Է�
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(1, '��¹�', 1);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(2, '�̿���', 2);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(3, '�Ǽ���', 3);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(4, '�躸��', 4);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '���ر�', 5); --> ���� �߻�(5�� �����Ͱ� �θ� ���̺� ����)
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '���ر�', 1);

INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(6, '������', NULL);
INSERT INTO TBL_EMP1(SID, NAME) VALUES(7, '������');

-- Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	��¹�	1
2	�̿���	2
3	�Ǽ���	3
4	�躸��	4
5	���ر�	1
6	������	(NULL)
7	������	(NULL)
*/


-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� FK ���� �ǽ�(�� ���̺� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_EMP2
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
             REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	        TBL_EMP2	        P	    SID		
HR	EMP2_JIKWI_ID_FK	    TBL_EMP2	        R	    JIKWI_ID		NO ACTION
*/



--�� FK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰�)
-- ���̺� ����
CREATE TABLE TBL_EMP3
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER
);
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.

-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> ��ȸ ��� ����


-- �������� �߰�
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID) );
             
             
-- �������� �߰� �� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> 
/*
HR	EMP3_SID_PK	        TBL_EMP3	    P	SID		
HR	EMP3_JIKWI_ID_FK	    TBL_EMP3	    R	JIKWI_ID		NO ACTION
*/
                    
-- �������� ����(FOREIGN KEY)
ALTER TABLE TBL_EMP3
DROP CONSTRAINT EMP3_JIKWI_ID_FK;
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.
                                 
    
-- �������� ���� �� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> HR	EMP3_SID_PK	    TBL_EMP3    	P	SID		


-- �������� �ٽ� �߰�
ALTER TABLE TBL_EMP3
ADD CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID);
--==>> Table TBL_EMP3��(��) ����Ǿ����ϴ�.


-- �������� �߰� �� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP3';
--==>> 
/*
HR	EMP3_SID_PK	            TBL_EMP3	    P	SID		
HR	EMP3_JIKWI_ID_FK	    TBL_EMP3	    R	JIKWI_ID		NO ACTION
*/


-- �ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	��¹�	1
2	�̿���	2
3	�Ǽ���	3
4	�躸��	4
5	���ر�	1
6	������	
7	������	
*/

-- �躸�� ������ ������ ������� ����
UPDATE TBL_EMP1
SET JIKWI_ID = 1
WHERE SID = 4;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	��¹�	1
2	�̿���	2
3	�Ǽ���	3
4	�躸��	1
5	���ر�	1
6	������	
7	������	
*/

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


-- �θ� ���̺�(TBL_JOBS)�� ���� �����͸� �����ϰ� �ִ�
-- �ڽ� ���̺�(TBL_EMP1)�� �����Ͱ� �������� �ʴ� ��Ȳ

-- �̿� ���� ��Ȳ���� �θ� ���̺�(TBL_JOBS)��
-- ���� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- Ȯ�� 
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/
--> ���� �����Ͱ� �����Ǿ����� Ȯ��

COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �θ� ���̺�(TBL_JOBS)�� [���] ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID = 1;
--==>> ���� �߻�
--     (ORA-02292: integrity constraint (HR.SYS_C007002) violated - child record found)

-- �θ� ���̺�(TBL_JOBS) ����
DROP TABLE TBL_JOBS;
--==>> ���� �߻�
--     (ORA-02449: unique/primary keys in table referenced by foreign keys)


--�� �θ� ���̺��� �����͸� �����Ӱ�(?) �����ϱ� ���ؼ���
--   [ ON DELETE CASCADE ] �ɼ� ������ �ʿ��ϴ�.

-- TBL_EMP1 ���̺�(�ڽ� ���̺�)���� FK ���������� ������ ��
-- CASCADE �ɼ��� �����Ͽ� �ٽ� FK ���������� �����Ѵ�.


-- �������� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	    SYS_C007001	    TBL_EMP1	P	SID		
HR	    SYS_C007002	    TBL_EMP1	R	JIKWI_ID		NO ACTION
*/


-- �������� ����
ALTER TABLE TBL_EMP1
DROP CONSTRAINT  SYS_C007002;
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.


-- �������� ���� ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>> HR	SYS_C007001	    TBL_EMP1	P	SID		


-- [ ON DELETE CASCADE ] �ɼ��� ���Ե� �������� �������� �ٽ� ����
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
               REFERENCES TBL_JOBS(JIKWI_ID)
               ON DELETE CASCADE;               -- CHECK~!!!
--==>> Table TBL_EMP1��(��) ����Ǿ����ϴ�.


-- �������� ���� ���� �ٽ� Ȯ��
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007001	        TBL_EMP1	P	SID		
HR	EMP1_JIKWI_ID_FK	TBL_EMP1	R	JIKWI_ID		CASCADE
*/


--�� CASCADE �ɼ��� ������ �Ŀ���
--   �����ް� �ִ� �θ� ���̺��� �����͸�
--   �������� �����Ӱ� �����ϴ� ���� �����ϴ�.
--   ��... �θ� ���̺��� �����Ͱ� ������ ���...
--   �ش� �����͸� �����Ǵ� ���� �ƴ϶�
--   �̸� �����ϴ� �ڽ� ���̺��� �����͵� ��~~~~~ �� �Բ� �����ȴ�.

-- �θ� ���̺�
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	���
2	�븮
3	����
*/

-- �ڽ� ���̺�
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	��¹�	1
2	�̿���	2
3	�Ǽ���	3   <-
4	�躸��	1
5	���ر�	1
6	������	
7	������	
*/

-- �θ� ���̺�(TBL_JOBS)���� ���� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- �ڽ� ���̺�(TBL_EMP1) ������ Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	��¹�	1
2	�̿���	2
4	�躸��	1
5	���ر�	1
6	������	
7	������	
*/


-- �θ� ���̺�(TBL_JOBS)���� ��� ������ ����
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

-- �ڽ� ���̺�(TBL_EMP1) ������ Ȯ��
SELECT *
FROM TBL_EMP1;
--==>>
/*
2	�̿���	2
6	������	
7	������	
*/

-- �θ� ���̺� ����
DROP TABLE TBL_JOBS;

DROP TABLE TBL_EMP2;
--==>> Table TBL_EMP2��(��) �����Ǿ����ϴ�.

DROP TABLE TBL_EMP3;
--==>> Table TBL_EMP3��(��) �����Ǿ����ϴ�.


DROP TABLE TBL_JOBS;

DROP TABLE TBL_EMP1;

DROP TABLE TBL_JOBS;
-- CASCADE �ɼ��� ����Ǿ� �ִ��� �ڽ� ���̺��� �����Ǿ� ���� ������
-- �θ� ���̺��� ������ �� ����.


--------------------------------------------------------------------------------