SELECT USER
FROM DUAL;
--==>> SCOTT


-- �ǽ� ���̺� ����(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK��(��) �����Ǿ����ϴ�.


-- ������ ���̺� �÷� �߰�
-- (����-> TOT, ���-> AVG, ���-> GRADE)
ALTER TABLE TBL_SUNGJUK
ADD ( TOT NUMBER(3), AVG NUMBER(4, 1), GRADE CHAR );
--==>> Table TBL_SUNGJUK��(��) ����Ǿ����ϴ�.

--> Ư�� ���������� ó���ؾ��� �̰��� �����ͷ� �����ϴ� ���� �ƴϴ�.
--  ������ �÷��� ������ �����ؾ� �Ұ� ��������.
--  ��, ������ ���� ��� �� �� �ִ� �����ʹ� ���� �÷�ȭ ��Ű�� �ȵ�!

--�� ���⼭ �߰��� �÷��� ���� �׸���
--   ���ν��� �ǽ��� ���� �߰��� ���� ��
--   ���� ���̺� ������ ����������, �ٶ��������� ���� �����̴�.


-- ����� ���̺� ���� Ȯ��
DESC TBL_SUNGJUK;
--==>>
/*
�̸�     ��?       ����           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)    
*/


--�� ������ ���ν����� ����� �۵��ϴ����� ���� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_SUNGJUK_INSERT(1, '������', 90, 80, 70);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	������	90	80	70	240	80	B

--�� ������ ���ν����� ����� �۵��ϴ����� ���� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	������	50	50	50	150	50	F

SELECT *
FROM TBL_STUDENTS;
SELECT *
FROM TBL_IDPW;

EXEC PRC_STUDENTS_UPDATE('superman', 'java006', '010-7979-7979', '������ Ⱦ��');
--==>> ������ ���� X

EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-7979-7979', '������ Ⱦ��');
--==>> ������ ���� ��


--�� PRC_INSA_INSERT ���ν��� ��� Ȯ��
EXEC PRC_INSA_INSERT('�躸��', '940524-2234567', SYSDATE, '����', '010-5896-0858'
                   , '���ߺ�', '�븮', 3000000, 3000000);
                 
SELECT *
FROM TBL_INSA;

EXEC PRC_INSA_INSERT('���Ͽ�', '920524-2234567', SYSDATE, '����', '010-5426-0858'
                   , '���ߺ�', '�븮', 3000000, 3000000);
                 
SELECT *
FROM TBL_INSA;



--------------------------------------------------------------------------------

--�� ���̺���̳� �÷����� ����� �ѱ۷� �����ؼ��� �ȵȴ�.

--�� �ǽ� ���̺� ����(TBL_��ǰ)
CREATE TABLE TBL_��ǰ
( ��ǰ�ڵ�      VARCHAR2(20)
, ��ǰ��        VARCHAR2(100)
, �Һ��ڰ���    NUMBER
, ������      NUMBER DEFAULT 0
, CONSTRAINT ��ǰ_��ǰ�ڵ�_PK PRIMARY KEY(��ǰ�ڵ�)
);
--==>> Table TBL_��ǰ��(��) �����Ǿ����ϴ�.
-- TBL_��ǰ ���̺��� ��ǰ�ڵ带 �⺻Ű(PK) �������� ����


--�� �ǽ� ���̺� ����(TBL_�԰�)
CREATE TABLE TBL_�԰�
( �԰��ȣ  NUMBER
, ��ǰ�ڵ�  VARCHAR2(20)
, �԰�����  DATE DEFAULT SYSDATE
, �԰����  NUMBER
, �԰�ܰ�  NUMBER
, CONSTRAINT �԰�_�԰��ȣ_PK PRIMARY KEY(�԰��ȣ)
, CONSTRAINT �԰�_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�)
             REFERENCES TBL_��ǰ(��ǰ�ڵ�)
);
--==>> Table TBL_�԰���(��) �����Ǿ����ϴ�.
-- TBL_�԰� ���̺��� �԰��ȣ�� �⺻Ű(PK) �������� ����
-- TBL_�԰� ���̺��� ��ǰ�ڵ�� TBL_��ǰ ���̺��� ��ǰ�ڵ带 
-- ������ �� �ֵ��� �ܷ�Ű(FK) �������� ����


--�� TBL_��ǰ ���̺� ��ǰ���� �Է�
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H001', '�޷γ�', 500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H002', '�ٹ��', 600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H003', '�ֹֽ�', 600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H004', '�ҽ���', 500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H005', '������', 700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H006', '������', 800);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('H007', 'ĵ���', 800);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('C001', '������', 1500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('C002', '�ζ�', 1600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('C003', '������', 1400);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('C004', '������', 1500);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E001', '���Ǿ�', 1200);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E002', '�ؽθ�', 300);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E003', '�Ϻ���', 2000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E004', '��帧', 800);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E005', '�źϾ�', 900);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E006', '���Դ�', 3000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���) VALUES('E007', '������', 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7


--�� Ȯ��
SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	�޷γ�	500	    0
H002	�ٹ��	600	    0
H003	�ֹֽ�	600	    0
H004	�ҽ���	500	    0
H005	������	700	    0
H006	������	800	    0
H007	ĵ���	800	    0
C001	������	1500	0
C002	�ζ�	1600	0
C003	������	1400	0
C004	������	1500	0
E001	���Ǿ�	1200	0
E002	�ؽθ�	300	    0
E003	�Ϻ���	2000	0
E004	��帧	800	    0
E005	�źϾ�	900	    0
E006	���Դ�	3000	0
E007	������	1000	0
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� TBL_�԰� ���̺� [�԰�] �̺�Ʈ �߻� ��...
--   ���� ���̺��� ����Ǿ�� �ϴ� ����

-- �� INSERT -> TBL_�԰�
--    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
--    VALUES(1, 'H001', SYSDATE, 30, 400);

-- �� UPDATE -> TBL_��ǰ 
--    UPDATE TBL_��ǰ
--    SET ������ = ������ + 30 (-> �԰����)
--    WHERE ��ǰ�ڵ� = 'H001'

SELECT *
FROM TBL_�԰�;


EXEC PRC_�԰�_INSERT('H001', 10, 500);
EXEC PRC_�԰�_INSERT('H004', 50, 980);

EXEC PRC_�԰�_INSERT('C001', 20, 980);
EXEC PRC_�԰�_INSERT('C001', 30, 960);

SELECT *
FROM TBL_�԰�;
--==>>
/*
1	H004	2020-10-19	50	980
2	C001	2020-10-19	20	980
3	C004	2020-10-19	30	960
4	C001	2020-10-19	30	960
*/


EXEC PRC_�԰�_INSERT('H001', 20, 400);
EXEC PRC_�԰�_INSERT('H002', 10, 500);
EXEC PRC_�԰�_INSERT('H003', 30, 500);
EXEC PRC_�԰�_INSERT('H004', 40, 300);
EXEC PRC_�԰�_INSERT('H005', 20, 500);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 5

EXEC PRC_�԰�_INSERT('C001', 20, 400);
EXEC PRC_�԰�_INSERT('C002', 10, 500);
EXEC PRC_�԰�_INSERT('C003', 30, 500);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 3

EXEC PRC_�԰�_INSERT('E001', 10, 900);
EXEC PRC_�԰�_INSERT('E002', 20, 900);
EXEC PRC_�԰�_INSERT('E003', 30, 900);
EXEC PRC_�԰�_INSERT('E004', 40, 900);
EXEC PRC_�԰�_INSERT('E005', 50, 900);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. * 5