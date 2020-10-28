SELECT USER
FROM DUAL;
--==>> MANAGER



-- ����ȣ, ������(1)  ����, ���ǽ�, ����, ��������
-- ��¹�, �̿���(3)  �л�, ������, ������û, �ߵ�Ż����, ����
-- ��ȫ��, ������(2)  ����, ����, ��������, ����

-- 40�� �۾� 10�� ȸ�� 

-- ����, �л�, ������, ���ǽ�, ����, ����, ���� 

-- ����
-- PW �⺻�� JUBUN �־�� ��
CREATE TABLE PROFESSORS
( PRO_ID    VARCHAR2(15)                            -- ����ID
, PW        VARCHAR2(20)                            -- ��й�ȣ
, JUBUN     CHAR(7)                                 -- �ֹι�ȣ ���ڸ�
, CONSTRAINT PRO_ID_PK PRIMARY KEY(PRO_ID)
, CONSTRAINT PRO_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table PROFESSORS��(��) �����Ǿ����ϴ�.

-- ���ǽ�
CREATE TABLE CLASSROOMS
( CLR_CODE  VARCHAR2(10)                             -- ���ǽ� �ڵ�
, CLR_INFO  VARCHAR2(20)                             -- ���ǽ� ����
, CONSTRAINT CLR_CODE_PK PRIMARY KEY(CLR_CODE)
);
--==>> Table CLASSROOMS��(��) �����Ǿ����ϴ�.

-- ����
CREATE TABLE COURSES
( COU_CODE  VARCHAR2(10)  
, COU_NAME  VARCHAR2(100)
, CONSTRAINT COU_CODE_PK PRIMARY KEY(COU_CODE)
, CONSTRAINT COU_NAME_NN CHECK(COU_NAME IS NOT NULL)
);
--==>> Table COURSES��(��) �����Ǿ����ϴ�.

-- ������ ���̺�
-- PW�� JUBUN ����Ʈ�� �����
CREATE TABLE ADMIN
( ADM_ID  VARCHAR2(15) 
, PW      VARCHAR2(20)                -- ����Ʈ������ JUBUN�� �����
, JUBUN   CHAR(7)                     -- NOT NULL..
, CONSTRAINT ADM_ID_PK PRIMARY KEY(ADM_ID)
, CONSTRAINT ADM_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table ADMIN��(��) �����Ǿ����ϴ�.

--> �л� ���̺�
-- PW�� JUBUN �⺻�� �����
CREATE TABLE STUDENTS
( ST_ID     VARCHAR2(15)                            -- �л�_ID
, PW        VARCHAR2(20)                            -- �ٲٴ� ���
, JUBUN     CHAR(7)                                 -- ���ڸ�
, CONSTRAINT STD_ID_PK PRIMARY KEY(ST_ID)       -- �л�_ID(�⺻Ű����)
, CONSTRAINT STD_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table STUDENTS��(��) �����Ǿ����ϴ�.

CREATE TABLE SUBJECTS
( SUB_CODE VARCHAR2(10)  
, SUB_NAME VARCHAR2(50)
, CONSTRAINT SUB_CODE_PK PRIMARY KEY(SUB_CODE)
, CONSTRAINT SUB_NAME_NN CHECK(SUB_NAME IS NOT NULL)
);
--==>> Table SUBJECTS��(��) �����Ǿ����ϴ�.

CREATE TABLE TEXTBOOKS
( TB_CODE    VARCHAR2(20)   
, TB_NAME    VARCHAR2(50)
, CONSTRAINT TB_CODE_PK PRIMARY KEY(TB_CODE)
, CONSTRAINT TB_NAME_NN CHECK(TB_NAME IS NOT NULL)
);
--==>> Table TEXTBOOKS��(��) �����Ǿ����ϴ�.


-- �θ����̺�
-----------------------------------------------------

-- ��������
CREATE TABLE OPEN_COURSES
( OC_CODE           VARCHAR2(10)                -- ���������ڵ�(PK)
, COU_CODE          VARCHAR2(10)                -- �����ڵ�(FK)
, PRO_ID            VARCHAR2(15)                -- ����ID(FK)
, CLR_CODE          VARCHAR2(10)                -- ���ǽ� �ڵ�(FK)
, COU_START_DATE    DATE                        -- ���� ������
, COU_END_DATE      DATE                        -- �� ������
, CONSTRAINT OC_CODE_PK PRIMARY KEY(OC_CODE)
); 
--==>> Table OPEN_COURSES��(��) �����Ǿ����ϴ�.


-- �ߵ� Ż����
CREATE TABLE DROPOUT
( DR_CODE  VARCHAR2(10)  
, RC_CODE  VARCHAR2(10)  -- REGISTER_COURSES �ܷ�Ű ������û
, DR_DATE  DATE          DEFAULT SYSDATE
, DR_REASON VARCHAR2(100)  
, CONSTRAINT DR_CODE_PK PRIMARY KEY(DR_CODE)
);
--==>> Table DROPOUT��(��) �����Ǿ����ϴ�.


-- ����
CREATE TABLE RESULTS
( RE_CODE                   VARCHAR2(10)  
, RC_CODE                   VARCHAR2(10)  -- REGISTER_COURSES �ܷ�Ű
, OS_CODE                   VARCHAR2(10)  -- OPEN_SUBJECTS �ܷ�Ű
, RE_DATE                   DATE          -- DEFAULT�� SYSDATE?
, ATD_RESULT                NUMBER(3)     -- NOT NULL
, PRC_RESULT                NUMBER(3)     -- NOT NULL
, WRT_RESULT                NUMBER(3)     -- NOT NULL
, CONSTRAINT RE_CODE_PK PRIMARY KEY(RE_CODE)
, CONSTRAINT RE_ATD_RESULT_NN CHECK(ATD_RESULT IS NOT NULL)
, CONSTRAINT RE_PRC_RESULT_NN CHECK(PRC_RESULT IS NOT NULL)
, CONSTRAINT RE_WRT_RESULT_NN CHECK(WRT_RESULT IS NOT NULL)
);
--==>> Table RESULTS��(��) �����Ǿ����ϴ�.


--> OC_CODE �ܷ�Ű ���� �� �Դϴ�.
--> ������û ���̺�
CREATE TABLE REGISTER_COURSES
( RC_CODE           VARCHAR2(10)                    -- ������û�ڵ�
, OC_CODE           VARCHAR2(10)                    -- ���������ڵ�(�ܷ�Ű)
, ST_ID             VARCHAR2(15)                    -- �л��ڵ�(�ܷ�Ű)
, REGISTER_DATE     DATE DEFAULT SYSDATE            -- ������û����
, CONSTRAINT RC_CODE_PK  PRIMARY KEY(RC_CODE)    -- ������û�ڵ�(�⺻Ű����)
);
--==>> Table REGISTER_COURSES��(��) �����Ǿ����ϴ�.


-- ����
CREATE TABLE DISTRIBUTIONS
( DIS_CODE  VARCHAR2(10)                            -- PK
, OS_CODE   VARCHAR2(10)                            -- FK
, ATD_DIS    NUMBER(3)                           
, WRT_DIS NUMBER(3)
, PRC_DIS NUMBER(3)
, CONSTRAINT DIS_CODE_PK  PRIMARY KEY(DIS_CODE)
, CONSTRAINT DIS_ATD_NN CHECK(ATD_DIS IS NOT NULL)
, CONSTRAINT DIS_WRT_NN CHECK(WRT_DIS IS NOT NULL)
, CONSTRAINT DIS_PRC_NN CHECK(PRC_DIS IS NOT NULL)
, CONSTRAINT DIS_TOTAL_CK CHECK(ATD_DIS+WRT_DIS+PRC_DIS = 100)
);
--==>> Table DISTRIBUTIONS��(��) �����Ǿ����ϴ�.

-- ��������
CREATE TABLE OPEN_SUBJECTS
( OS_CODE   VARCHAR2(10)                            -- PK
, SUB_CODE  VARCHAR2(10)                            -- FK
, OC_CODE   VARCHAR2(10)                            -- FK
, TB_CODE    VARCHAR2(20)                           -- FK
, PRO_ID    VARCHAR2(15)                            -- FK
, S_DATE    DATE
, E_DATE    DATE
, CONSTRAINT OS_CODE_PK   PRIMARY KEY(OS_CODE)
-- �������� ����, ��  �����ֱ�
);
--==>> Table OPEN_SUBJECTS��(��) �����Ǿ����ϴ�.

ALTER TABLE OPEN_SUBJECTS
ADD CONSTRAINT OS_S_DATE_CK CHECK(); 

-- �ڽ� ���̺�
------------------------------------------------------

/*
���� : �������� -> ������û -> �ߵ�Ż�� -> �������� -> ���� -> ����

��������    ��������    ������û    �ߵ�����
����         ����
*/


/*
27�� : ���̵����� INSERT ���� ����
       ������ �ۼ� 
*/

-- ��������
ALTER TABLE OPEN_COURSES
ADD (CONSTRAINT OC_COU_CODE_FK FOREIGN KEY(COU_CODE)
                  REFERENCES COURSES(COU_CODE),
     CONSTRAINT OC_PRO_ID_FK FOREIGN KEY(PRO_ID)
                  REFERENCES PROFESSORS(PRO_ID) ,
     CONSTRAINT OC_CLR_CODE_FK FOREIGN KEY(CLR_CODE)
                  REFERENCES CLASSROOMS(CLR_CODE));
--==>> Table OPEN_COURSES��(��) ����Ǿ����ϴ�.


-- ������û���̺� -> ���������ڵ�, �л�ID (�ܷ�Ű ����)
ALTER TABLE REGISTER_COURSES                            
ADD ( CONSTRAINT RC_OC_CODE_FK FOREIGN KEY(OC_CODE)     -- ���������ڵ�(�ܷ�Ű�����߰�)
                 REFERENCES OPEN_COURSES(OC_CODE)
    , CONSTRAINT RC_ST_ID_FK  FOREIGN KEY(ST_ID)        -- �л��ڵ�(�ܷ�Ű����)
                 REFERENCES STUDENTS(ST_ID) );
--==>> Table REGISTER_COURSES��(��) ����Ǿ����ϴ�.



-- �ߵ�Ż����
ALTER TABLE DROPOUT
ADD CONSTRAINT DR_RC_CODE_FK FOREIGN KEY (RC_CODE)
               REFERENCES REGISTER_COURSES(RC_CODE);
--==>> Table DROPOUT��(��) ����Ǿ����ϴ�.

               

-- ��������        
ALTER TABLE OPEN_SUBJECTS
ADD( CONSTRAINT OS_SUB_CODE_FK  FOREIGN KEY(SUB_CODE)                   -- OPEN_SUBJECTS(��������) ���̺� ���������߰�
                REFERENCES SUBJECTS(SUB_CODE)
    ,CONSTRAINT OS_OC_CODE_FK FOREIGN KEY(OC_CODE)
                REFERENCES OPEN_COURSES(OC_CODE)
    ,CONSTRAINT OS_TB_CODE_FK FOREIGN KEY(TB_CODE)
                REFERENCES TEXTBOOKS(TB_CODE)
    ,CONSTRAINT OS_PRO_ID_FK FOREIGN KEY(PRO_ID)
                REFERENCES PROFESSORS(PRO_ID)
    );
--==>> Table OPEN_SUBJECTS��(��) ����Ǿ����ϴ�.


-- ����    
ALTER TABLE DISTRIBUTIONS                                               --DISTRIBUTIONS(����) ���̺� ���������߰�
ADD( CONSTRAINT DIS_OS_CODE_FK  FOREIGN KEY(OS_CODE)
                REFERENCES OPEN_SUBJECTS(OS_CODE)
    );
--==>> Table DISTRIBUTIONS��(��) ����Ǿ����ϴ�.



--����
ALTER TABLE RESULTS
ADD ( CONSTRAINT R_RC_CODE_FK FOREIGN KEY (RC_CODE)
               REFERENCES REGISTER_COURSES(RC_CODE)
    , CONSTRAINT R_OS_CODE_FK FOREIGN KEY (OS_CODE)
               REFERENCES OPEN_SUBJECTS(OS_CODE)
);
--==>> Table RESULTS��(��) ����Ǿ����ϴ�.



--------------------------------------------------------------------------------
-- ���̵�����

-- 13�� ���̺� ���̵����� --


-- ������ ���̵����� 3��
INSERT INTO ADMIN(ADM_ID, PW, JUBUN) VALUES('ADM_0001', '1223344', '1223344');
INSERT INTO ADMIN(ADM_ID, PW, JUBUN) VALUES('ADM_0002', '2223344', '2223344');
INSERT INTO ADMIN(ADM_ID, PW, JUBUN) VALUES('ADM_0003', '1556677', '1556677');


-- ���� ���̵����� 3��
INSERT INTO PROFESSORS(PRO_ID, PW, JUBUN)
VALUES('PR_0001', '1234567', '1234567');

INSERT INTO PROFESSORS(PRO_ID, PW, JUBUN)
VALUES('PR_0002', '2234567', '2234567');

INSERT INTO PROFESSORS(PRO_ID, PW, JUBUN)
VALUES('PR_0003', '3234567', '3234567');

    
-- �л� ���������� 3��

INSERT INTO STUDENTS(ST_ID, PW, JUBUN) VALUES('ST_0001', '1234567', '1234567');
INSERT INTO STUDENTS(ST_ID, PW, JUBUN) VALUES('ST_0002', '2234567', '2234567');
INSERT INTO STUDENTS(ST_ID, PW, JUBUN) VALUES('ST_0003', '3234567', '3234567');  

-- ���ǽ� ���� ������
INSERT INTO CLASSROOMS(CLR_CODE, CLR_INFO) VALUES('CLR_0001', '2�� A��');
INSERT INTO CLASSROOMS(CLR_CODE, CLR_INFO) VALUES('CLR_0002', '4�� D��');
INSERT INTO CLASSROOMS(CLR_CODE, CLR_INFO) VALUES('CLR_0003', '4�� F��');


-- ���� ���̵����� 3��

INSERT INTO TEXTBOOKS(TB_CODE, TB_NAME) VALUES('TB_0001', 'JAVA�� ��� �� ���� ����');
INSERT INTO TEXTBOOKS(TB_CODE, TB_NAME) VALUES('TB_0002', 'ORACLE�� ��� �� ���� ����');
INSERT INTO TEXTBOOKS(TB_CODE, TB_NAME) VALUES('TB_0003', 'SPRING�� ��� �� ���� ����');

--�������� ���� ������ 3��INSERT INTO SUBJECTS(SU_CODE,SU_NAME)
INSERT INTO SUBJECTS(SUB_CODE, SUB_NAME)
VALUES('SU_0001','JAVA');
INSERT INTO SUBJECTS(SUB_CODE, SUB_NAME)
VALUES('SU_0002','Oracle');
INSERT INTO SUBJECTS(SUB_CODE, SUB_NAME)
VALUES('SU_0003','JSP');


---------------------------------------------------------------
--�ߵ� Ż���� ���̵�����3��
INSERT INTO DROPOUT(DR_CODE,RC_CODE,DR_DATE,DR_REASON)
VALUES('DR_0001','RC_0001',SYSDATE,'�� �� �ڰڽ��ϴ�....');
INSERT INTO DROPOUT(DR_CODE,RC_CODE,DR_DATE,DR_REASON)
VALUES('DR_0002','RC_0002',SYSDATE,'�ʹ���ƴ�....');
INSERT INTO DROPOUT(DR_CODE,RC_CODE,DR_DATE,DR_REASON)
VALUES('DR_0003','RC_0003',SYSDATE,'��������');
----------------------------------------------------------------


-- ��������
INSERT INTO OPEN_COURSES(OC_CODE, COU_CODE, PRO_ID, CLR_CODE, COU_START_DATE, COU_END_DATE)
VALUES('OC_0001', 'COU_0001', 'PR_0001', 'CLR_0001', '2020-04-20', '2020-10-19');
INSERT INTO OPEN_COURSES(OC_CODE, COU_CODE, PRO_ID, CLR_CODE, COU_START_DATE, COU_END_DATE)
VALUES('OC_0002', 'COU_0002', 'PR_0002', 'CLR_0002', '2020-06-20', '2020-12-19');
INSERT INTO OPEN_COURSES(OC_CODE, COU_CODE, PRO_ID, CLR_CODE, COU_START_DATE, COU_END_DATE)
VALUES('OC_0003', 'COU_0003', 'PR_0003', 'CLR_0003', '2020-07-20', '2021-01-19');

--�������� ���̵����� 3��
INSERT INTO OPEN_SUBJECTS(OS_CODE,SUB_CODE,OC_CODE,TB_CODE,PRO_ID,S_DATE,E_DATE)
VALUES('OS_0001','SU_0001','OC_0001','TB_0001','PR_0001',SYSDATE,SYSDATE);
INSERT INTO OPEN_SUBJECTS(OS_CODE,SUB_CODE,OC_CODE,TB_CODE,PRO_ID,S_DATE,E_DATE)
VALUES('OS_0002','SU_0002','OC_0002','TB_0002','PR_0002',SYSDATE,SYSDATE);
INSERT INTO OPEN_SUBJECTS(OS_CODE,SUB_CODE,OC_CODE,TB_CODE,PRO_ID,S_DATE,E_DATE)
VALUES('OS_0003','SU_0003','OC_0003','TB_0003','PR_0003',SYSDATE,SYSDATE);

-- ������û���̺�

INSERT INTO REGISTER_COURSES(RC_CODE, OC_CODE, ST_ID, REGISTER_DATE)
VALUES('RC_0001', 'OC_0001', 'ST_0001', SYSDATE);
INSERT INTO REGISTER_COURSES(RC_CODE, OC_CODE, ST_ID, REGISTER_DATE)
VALUES('RC_0002', 'OC_0002', 'ST_0002', SYSDATE);
INSERT INTO REGISTER_COURSES(RC_CODE, OC_CODE, ST_ID, REGISTER_DATE)
VALUES('RC_0003', 'OC_0003', 'ST_0003', SYSDATE);


-- ���� ���̵����� 3��
INSERT INTO RESULTS(RE_CODE,RC_CODE,OS_CODE,RE_DATE,ATD_RESULT,PRC_RESULT,WRT_RESULT)
VALUES('RE_0001','RC_0001','OS_0001',SYSDATE,10,20,30);
INSERT INTO RESULTS(RE_CODE,RC_CODE,OS_CODE,RE_DATE,ATD_RESULT,PRC_RESULT,WRT_RESULT)
VALUES('RE_0002','RC_0002','OS_0003',SYSDATE,60,10,30);
INSERT INTO RESULTS(RE_CODE,RC_CODE,OS_CODE,RE_DATE,ATD_RESULT,PRC_RESULT,WRT_RESULT)
VALUES('RE_0003','RC_0002','OS_0003',SYSDATE,50,30,20);

-- ���� ���� ������
INSERT INTO DISTRIBUTIONS(DIS_CODE, OS_CODE, ATD_DIS, WRT_DIS, PRC_DIS)
VALUES('DIS_0001', 'OS_0001', 80, 10, 10);
INSERT INTO DISTRIBUTIONS(DIS_CODE, OS_CODE, ATD_DIS, WRT_DIS, PRC_DIS)
VALUES('DIS_0002', 'OS_0002', 50, 30, 20);
INSERT INTO DISTRIBUTIONS(DIS_CODE, OS_CODE, ATD_DIS, WRT_DIS, PRC_DIS)
VALUES('DIS_0003', 'OS_0003', 0, 30, 70);

-- ���� ���� ������
INSERT INTO COURSES(COU_CODE, COU_NAME) VALUES('COU_0001', '�ڹ�(JAVA)�� Ȱ���� Ǯ���� ���� SW������ �缺����(A)');
INSERT INTO COURSES(COU_CODE, COU_NAME) VALUES('COU_0002', '�ڹ�(JAVA) ����� ����Ʈ �� �������� �缺����');
INSERT INTO COURSES(COU_CODE, COU_NAME) VALUES('COU_0003', '�ڹ�_���̽� ��� ��Ƽ �� ������ �缺����(C)');


-- Ŀ��
COMMIT;