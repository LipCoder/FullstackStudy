SELECT USER
FROM DUAL;

-- 김종호, 이진주(1)  과정, 강의실, 교수, 개설과정
-- 김승범, 이예슬(3)  학생, 관리자, 수강신청, 중도탈락자, 성적
-- 윤홍준, 안혜리(2)  과목, 교재, 개설과목, 배점

-- 40분 작업 10분 회의 

-- 교수, 학생, 관리자, 강의실, 과정, 과목, 교재 

-- 교수
-- PW 기본값 JUBUN 넣어야 함
CREATE TABLE PROFESSORS
( PRO_ID    VARCHAR2(15)                            -- 교수ID
, PW        VARCHAR2(20)                            -- 비밀번호
, JUBUN     CHAR(7)                                 -- 주민번호 뒷자리
, CONSTRAINT PRO_ID_PK PRIMARY KEY(PRO_ID)
, CONSTRAINT PRO_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table PROFESSORS이(가) 생성되었습니다.

-- 강의실
CREATE TABLE CLASSROOMS
( CLR_CODE  VARCHAR2(10)                             -- 강의실 코드
, CLR_INFO  VARCHAR2(20)                             -- 강의실 정보
, CONSTRAINT CLR_CODE_PK PRIMARY KEY(CLR_CODE)
);
--==>> Table CLASSROOMS이(가) 생성되었습니다.

-- 과정
CREATE TABLE COURSES
( COU_CODE  VARCHAR2(10)  
, COU_NAME  VARCHAR2(100)
, CONSTRAINT COU_CODE_PK PRIMARY KEY(COU_CODE)
, CONSTRAINT COU_NAME_NN CHECK(COU_NAME IS NOT NULL)
);
--==>> Table COURSES이(가) 생성되었습니다.

-- 관리자 테이블
-- PW에 JUBUN 디폴트값 줘야함
CREATE TABLE ADMIN
( ADM_ID  VARCHAR2(15) 
, PW      VARCHAR2(20)                -- 디폴트값으로 JUBUN을 줘야함
, JUBUN   CHAR(7)                     -- NOT NULL..
, CONSTRAINT ADM_ID_PK PRIMARY KEY(ADM_ID)
, CONSTRAINT ADM_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table ADMIN이(가) 생성되었습니다.

--> 학생 테이블
-- PW에 JUBUN 기본값 줘야함
CREATE TABLE STUDENTS
( ST_ID     VARCHAR2(15)                            -- 학생_ID
, PW        VARCHAR2(20)                            -- 바꾸는 비번
, JUBUN     CHAR(7)                                 -- 뒷자리
, CONSTRAINT STD_ID_PK PRIMARY KEY(ST_ID)       -- 학생_ID(기본키설정)
, CONSTRAINT STD_JUBUN_NN CHECK(JUBUN IS NOT NULL)
);
--==>> Table STUDENTS이(가) 생성되었습니다.

CREATE TABLE SUBJECTS
( SUB_CODE VARCHAR2(10)  
, SUB_NAME VARCHAR2(50)
, CONSTRAINT SUB_CODE_PK PRIMARY KEY(SUB_CODE)
, CONSTRAINT SUB_NAME_NN CHECK(SUB_NAME IS NOT NULL)
);
--==>> Table SUBJECTS이(가) 생성되었습니다.

CREATE TABLE TEXTBOOKS
( TB_CODE    VARCHAR2(20)   
, TB_NAME    VARCHAR2(50)
, CONSTRAINT TB_CODE_PK PRIMARY KEY(TB_CODE)
, CONSTRAINT TB_NAME_NN CHECK(TB_NAME IS NOT NULL)
);
--==>> Table TEXTBOOKS이(가) 생성되었습니다.


-- 부모테이블
-----------------------------------------------------

-- 개설과정
CREATE TABLE OPEN_COURSES
( OC_CODE           VARCHAR2(10)                -- 개설과정코드(PK)
, COU_CODE          VARCHAR2(10)                -- 과정코드(FK)
, PRO_ID            VARCHAR2(15)                -- 교수ID(FK)
, CLR_CODE          VARCHAR2(10)                -- 강의실 코드(FK)
, COU_START_DATE    DATE                        -- 시작 연월일
, COU_END_DATE      DATE                        -- 끝 연월일
, CONSTRAINT OC_CODE_PK PRIMARY KEY(OC_CODE)
); 
--==>> Table OPEN_COURSES이(가) 생성되었습니다.


-- 중도 탈락자
CREATE TABLE DROPOUT
( DR_CODE  VARCHAR2(10)  
, RC_CODE  VARCHAR2(10)  -- REGISTER_COURSES 외래키 수강신청
, DR_DATE  DATE          DEFAULT SYSDATE
, DR_REASON VARCHAR2(100)  
, CONSTRAINT DR_CODE_PK PRIMARY KEY(DR_CODE)
);
--==>> Table DROPOUT이(가) 생성되었습니다.


-- 성적
CREATE TABLE RESULTS
( RE_CODE                   VARCHAR2(10)  
, RC_CODE                   VARCHAR2(10)  -- REGISTER_COURSES 외래키
, OS_CODE                   VARCHAR2(10)  -- OPEN_SUBJECTS 외래키
, RE_DATE                   DATE          -- DEFAULT로 SYSDATE?
, ATD_RESULT                NUMBER(3)     -- NOT NULL
, PRC_RESULT                NUMBER(3)     -- NOT NULL
, WRT_RESULT                NUMBER(3)     -- NOT NULL
, CONSTRAINT RE_CODE_PK PRIMARY KEY(RE_CODE)
, CONSTRAINT RE_ATD_RESULT_NN CHECK(ATD_RESULT IS NOT NULL)
, CONSTRAINT RE_PRC_RESULT_NN CHECK(PRC_RESULT IS NOT NULL)
, CONSTRAINT RE_WRT_RESULT_NN CHECK(WRT_RESULT IS NOT NULL)
);
--==>> Table RESULTS이(가) 생성되었습니다.


--> OC_CODE 외래키 설정 전 입니다.
--> 수강신청 테이블
CREATE TABLE REGISTER_COURSES
( RC_CODE           VARCHAR2(10)                    -- 수강신청코드
, OC_CODE           VARCHAR2(10)                    -- 개설과정코드(외래키)
, ST_ID             VARCHAR2(15)                    -- 학생코드(외래키)
, REGISTER_DATE     DATE DEFAULT SYSDATE            -- 수강신청일자
, CONSTRAINT RC_CODE_PK  PRIMARY KEY(RC_CODE)    -- 수강신청코드(기본키설정)
);
--==>> Table REGISTER_COURSES이(가) 생성되었습니다.


-- 배점
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
--==>> Table DISTRIBUTIONS이(가) 생성되었습니다.

-- 개설과목
CREATE TABLE OPEN_SUBJECTS
( OS_CODE   VARCHAR2(10)                            -- PK
, SUB_CODE  VARCHAR2(10)                            -- FK
, OC_CODE   VARCHAR2(10)                            -- FK
, TB_CODE    VARCHAR2(20)                           -- FK
, PRO_ID    VARCHAR2(15)                            -- FK
, S_DATE    DATE
, E_DATE    DATE
, CONSTRAINT OS_CODE_PK   PRIMARY KEY(OS_CODE)
-- 개설과정 시작, 끝  맞춰주기
);
--==>> Table OPEN_SUBJECTS이(가) 생성되었습니다.

ALTER TABLE OPEN_SUBJECTS
ADD CONSTRAINT OS_S_DATE_CK CHECK(); 

-- 자식 테이블
------------------------------------------------------

/*
순서 : 개설과정 -> 수강신청 -> 중도탈락 -> 개설과목 -> 배점 -> 성적

개설과정    개설과목    수강신청    중도포기
성적         배점
*/


/*
27일 : 더미데이터 INSERT 형식 통일
       쿼리문 작성 
*/

-- 개설과정
ALTER TABLE OPEN_COURSES
ADD (CONSTRAINT OC_COU_CODE_FK FOREIGN KEY(COU_CODE)
                  REFERENCES COURSES(COU_CODE),
     CONSTRAINT OC_PRO_ID_FK FOREIGN KEY(PRO_ID)
                  REFERENCES PROFESSORS(PRO_ID) ,
     CONSTRAINT OC_CLR_CODE_FK FOREIGN KEY(CLR_CODE)
                  REFERENCES CLASSROOMS(CLR_CODE));
--==>> Table OPEN_COURSES이(가) 변경되었습니다.


-- 수강신청테이블 -> 개설과정코드, 학생ID (외래키 설정)
ALTER TABLE REGISTER_COURSES                            
ADD ( CONSTRAINT RC_OC_CODE_FK FOREIGN KEY(OC_CODE)     -- 개설과정코드(외래키설정추가)
                 REFERENCES OPEN_COURSES(OC_CODE)
    , CONSTRAINT RC_ST_ID_FK  FOREIGN KEY(ST_ID)        -- 학생코드(외래키설정)
                 REFERENCES STUDENTS(ST_ID) );
--==>> Table REGISTER_COURSES이(가) 변경되었습니다.



-- 중도탈락자
ALTER TABLE DROPOUT
ADD CONSTRAINT DR_RC_CODE_FK FOREIGN KEY (RC_CODE)
               REFERENCES REGISTER_COURSES(RC_CODE);
--==>> Table DROPOUT이(가) 변경되었습니다.

               

-- 개설과목        
ALTER TABLE OPEN_SUBJECTS
ADD( CONSTRAINT OS_SUB_CODE_FK  FOREIGN KEY(SUB_CODE)                   -- OPEN_SUBJECTS(개설과목) 테이블 제약조건추가
                REFERENCES SUBJECTS(SUB_CODE)
    ,CONSTRAINT OS_OC_CODE_FK FOREIGN KEY(OC_CODE)
                REFERENCES OPEN_COURSES(OC_CODE)
    ,CONSTRAINT OS_TB_CODE_FK FOREIGN KEY(TB_CODE)
                REFERENCES TEXTBOOKS(TB_CODE)
    ,CONSTRAINT OS_PRO_ID_FK FOREIGN KEY(PRO_ID)
                REFERENCES PROFESSORS(PRO_ID)
    );
--==>> Table OPEN_SUBJECTS이(가) 변경되었습니다.


-- 배점    
ALTER TABLE DISTRIBUTIONS                                               --DISTRIBUTIONS(배점) 테이블 제약조건추가
ADD( CONSTRAINT DIS_OS_CODE_FK  FOREIGN KEY(OS_CODE)
                REFERENCES OPEN_SUBJECTS(OS_CODE)
    );
--==>> Table DISTRIBUTIONS이(가) 변경되었습니다.



--성적
ALTER TABLE RESULTS
ADD ( CONSTRAINT R_RC_CODE_FK FOREIGN KEY (RC_CODE)
               REFERENCES REGISTER_COURSES(RC_CODE)
    , CONSTRAINT R_OS_CODE_FK FOREIGN KEY (OS_CODE)
               REFERENCES OPEN_SUBJECTS(OS_CODE)
);
--==>> Table RESULTS이(가) 변경되었습니다.




