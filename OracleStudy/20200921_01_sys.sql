
-- 1�� �ּ��� ó��

/*
������
(������)
�ּ���
ó��
*/


-- �� ���� ����Ŭ ������ ������ ����� ���� ��ȸ
show user;
--==>> USER��(��) "SYS"�Դϴ�.
--> sqlplus ������ �� ����ϴ� ��ɾ�

select user
from dual;
--==>> SYS

SELECT USER
FROM DUAL;
--==>> SYS
-- �������� ��ҹ��� ������ ����(������ ������ �ۼ��� �����ϰ� ��)

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT 1 + 4
FROM DUAL;
--==>> 5

SELECT                              1        +      4
FROM DUAL;
--==>> 5

SELECT 2+3
FROM                    DUAL;
--==>> 5

SELECT 2 + 3
FROMDUAL;
--==>> ���� �߻�
/*
ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
43��, 8������ ���� �߻�
*/

SELECT �ֿ뱳������ F������
FROM DUAL;
--==>> ���� �߻�
/*
ORA-00904: "�ֿ뱳������": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
53��, 8������ ���� �߻�
*/

SELECT "�ֿ뱳������ F������"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-00904: "�ֿ뱳������ F������": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
64��, 8������ ���� �߻�
*/


SELECT '�ֿ뱳������ F������'
FROM DUAL;
--==>> �ֿ뱳������ F������

SELECT '������ ������ ����Ŭ ����'
FROM DUAL;
--==>> ������ ������ ����Ŭ ����


SELECT 3.14 + 3.14
FROM DUAL;
--==>> 6.28

SELECT 10.5 - 4.5
FROM DUAL;
--==>> 6

SELECT 10 * 5
FROM DUAL;
--==>> 50

SELECT 10 * 5.0
FROM DUAL;
--==>> 50

SELECT 4 / 2
FROM DUAL;
--==>> 2

SELECT 4 / 2.0
FROM DUAL;
--==>> 2

SELECT 4.0 / 2.0
FROM DUAL;
--==>> 2

SELECT 5 / 2
FROM DUAL;
--==>> 2.5

SELECT 100-77.1
FROM DUAL;
--==>> 22.9

SELECT '�ٺ��' + '������'
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/


--�� ���� ����Ŭ ������ �����ϴ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
SYS                     	OPEN
SYSTEM	                    OPEN
ANONYMOUS               	OPEN
HR	                        OPEN
APEX_PUBLIC_USER	        LOCKED
FLOWS_FILES	                LOCKED
APEX_040000	                LOCKED
OUTLN	                    EXPIRED & LOCKED
DIP	                        EXPIRED & LOCKED
ORACLE_OCM	                EXPIRED & LOCKED
XS$NULL	                    EXPIRED & LOCKED
MDSYS	                    EXPIRED & LOCKED
CTXSYS	                    EXPIRED & LOCKED
DBSNMP	                    EXPIRED & LOCKED
XDB	                        EXPIRED & LOCKED
APPQOSSYS	                EXPIRED & LOCKED
*/

SELECT *
FROM DBA_USERS;
--==>>
/*
SYS	                0		OPEN		21/03/20	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
SYSTEM	            5		OPEN		21/03/16	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
ANONYMOUS	        35		OPEN		14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP			N	PASSWORD
HR	                43		OPEN		21/03/17	USERS	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APEX_PUBLIC_USER	45		LOCKED	14/05/29	14/11/25	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
FLOWS_FILES	        44		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APEX_040000	        47		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
OUTLN	            9		EXPIRED & LOCKED	20/09/17	20/09/17	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DIP	                14		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
ORACLE_OCM	        21		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XS$NULL	     2147483638		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
MDSYS	            42		EXPIRED & LOCKED	14/05/29	20/09/17	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
CTXSYS	            32		EXPIRED & LOCKED	20/09/17	20/09/17	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DBSNMP	            29		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XDB	                34		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APPQOSSYS	        30		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
*/

SELECT DEFAULT_TABLESPACE, USERNAME
FROM DBA_USERS;
--==>>
/*
SYSTEM	SYS
SYSTEM	SYSTEM
SYSAUX	ANONYMOUS
USERS	HR
SYSTEM	APEX_PUBLIC_USER
SYSAUX	FLOWS_FILES
SYSAUX	APEX_040000
SYSTEM	OUTLN
SYSTEM	DIP
SYSTEM	ORACLE_OCM
SYSTEM	XS$NULL
SYSAUX	MDSYS
SYSAUX	CTXSYS
SYSAUX	DBSNMP
SYSAUX	XDB
SYSAUX	APPQOSSYS
*/

--> [DBA_]�� �����ϴ� ORACLE DATA DICTIONARY VIEW ��
--  ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�.
--  ���� ������ ��ųʸ� ������ ���� ���ص� �������.


--�� HR ����� ������ ��� ���·� ����
ALTER USER HR ACCOUNT LOCK;
--==>> User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
    :
HR  LOCKED
    :
*/

--�� HR ����� ������ ��� ���� ���·� ����
ALTER USER HR ACCOUNT UNLOCK;
--==>> User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>
/*
    :
HR  OPEN
    :
*/

--------------------------------------------------------------------------------

--�� TABLESPACE 

--�� TABLESPACE ��?
--> ���׸�Ʈ(���̺�, �ε���, ...)�� ��Ƶδ�(�����صδ�)
--  ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�.


CREATE TABLESPACE TBS_EDUA              -- �����ϰڴ�. ���̺����̽���... TBS_EDUA ��� �̸�����
DATAFILE 'C:\TESTDATA\TBS_EDUA01.DBF'   -- ������ ������ ���� ��� �� �̸�
SIZE 4M                                 -- ������(�뷮)
EXTENT MANAGEMENT LOCAL                 -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����     
SEGMENT SPACE MANAGEMENT AUTO;          -- ���׸�Ʈ ���� ������ ����Ŭ ������ �ڵ����� ����

-- �� ���̺����̽� ���� ������ �����ϱ� ����
--    �ش� ����� �������� ���͸� ���� �ʿ�

--==>> TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.


--�� ������ ���̺����̽� ��ȸ
SELECT *
FROM DBA_TABLESPACES;
--==>>
/*
SYSTEM	    8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
SYSAUX	    8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
UNDOTBS1	8192	65536		1	2147483645	2147483645		65536	ONLINE	UNDO	LOGGING	NO	LOCAL	SYSTEM	NO	MANUAL	DISABLED	NOGUARANTEE	NO	HOST	NO	
TEMP	    8192	1048576	1048576	1		2147483645	0	1048576	ONLINE	TEMPORARY	NOLOGGING	NO	LOCAL	UNIFORM	NO	MANUAL	DISABLED	NOT APPLY	NO	HOST	NO	
USERS	    8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
*/


--�� ���� �뷮 ���� ��ȸ(�������� ���� �̸� ��ȸ)
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF 	4	USERS	104857600	12800	AVAILABLE	4	YES	11811160064	1441792	1280	103809024	12672	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSAUX.DBF	2	SYSAUX	692060160	84480	AVAILABLE	2	YES	34359721984	4194302	1280	691011584	84352	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\UNDOTBS1.DBF	3	UNDOTBS1	398458880	48640	AVAILABLE	3	YES	524288000	64000	640	397410304	48512	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF	1	SYSTEM	377487360	46080	AVAILABLE	1	YES	629145600	76800	1280	376438784	45952	SYSTEM
C:\TESTDATA\TBS_EDUA01.DBF	                    5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
*/


--�� ����Ŭ ����� ���� ����
CREATE USER ksb IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> ksb �̶�� ����� ������ �����ϰڴ�. (����ڴ�)
--  �� ����� ������ �н������ java006$�� �ϰڴ�.
--  �� ������ ���� �����ϴ� ����Ŭ ��ü��(���׸�Ʈ��)
--  �⺻������ TBS_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.
--==>> User KSB��(��) �����Ǿ����ϴ�.


--�� ������ ����Ŭ ����� ����(���� ���� �̸� ���� -> ksb)�� ���� ���� �õ�
--   -> ���� �Ұ�(����)
-->  ���� : [CREATE SESSION] ������ ���� ������ ������ �źε�.


--�� ������ ����Ŭ ����� ����(���� ���� �̸� ���� -> ksb)�� 
--   ����Ŭ ���� ������ �����ϵ��� CREATE SESSION ���� �ο�
GRANT CREATE SESSION TO ksb;
--==>> Grant��(��) �����߽��ϴ�.


--�� ������ ����Ŭ ����� ����(���� ���� �̸� ���� -> ksb)��
--   �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*
    :
KSB	CREATE SESSION	NO
    :
*/


--�� ������ �̸� �̴ϼ� �������� ���̺��� ������ �� �ֵ��� ���� �ο�
--    -> ���̺� ������ �����ϵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO ksb;
--==>> Grant��(��) �����߽��ϴ�.


--�� ������ �̸� �̴ϼ� ������
--   ���̺����̽�(TBS_EDUA)���� ����� �� �ִ� ����(�Ҵ緮)
--   �� ũ�⸦ ���������� ����.
ALTER USER KSB
QUOTA UNLIMITED ON TBS_EDUA;
--==>> User KSB��(��) ����Ǿ����ϴ�.



CREATE USER SCOTT
IDENTIFIED BY tiger;
--==>> User SCOTT��(��) �����Ǿ����ϴ�.

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO SCOTT;
--==>> Grant��(��) �����߽��ϴ�.

ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--==>> User SCOTT��(��) ����Ǿ����ϴ�.

ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
--==>> User SCOTT��(��) ����Ǿ����ϴ�.
