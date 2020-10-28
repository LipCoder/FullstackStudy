SELECT USER
FROM DUAL;

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




