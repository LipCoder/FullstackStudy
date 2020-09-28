SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ �����͸� ������� �ݿø�, ���� ���� ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "COL1"                   -- 2020-09-28  ->  �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "COL2"    -- 2021-01-01  ->  �⵵���� ��ȿ�� ������ (��ݱ�/�Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "COL3"   -- 2020-10-01  ->  ������ ��ȿ�� ������ (15�� ����)
     , ROUND(SYSDATE, 'DD') "COL4"      -- 2020-09-28  ->  �ϱ��� ��ȿ�� ������ (���� ����)
     , ROUND(SYSDATE, 'DAY') "COL5"     -- 2020-09-27  ->  �ϱ��� ��ȿ�� ������ 
                                                        -- (������ ���� ���� ��� ���� �Ͽ��Ϸ� �����ΰ��� �����ش�)
FROM DUAL;


--�� ��¥ ����
SELECT SYSDATE "COL1"                   -- 2020-09-28  ->  �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "COL2"    -- 2021-01-01  ->  �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "COL3"   -- 2020-09-01  ->  ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "COL4"      -- 2020-09-28  ->  �ϱ��� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "COL5"     -- 2020-09-27  ->  �� �� �ֿ� �ش��ϴ� �Ͽ���
                                                      
FROM DUAL;

--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���...
--   �������� ���� ������ ������ �� �ִ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\'; -- ��ȭ ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�. * 4

-- �� ��¥�� -> ������
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"    -- 2020-09-28
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"          -- 2020
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"          -- TWENTY TWENTY
     , TO_CHAR(SYSDATE, 'MM') "COL4"            -- 09
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"         -- 9��
     , TO_CHAR(SYSDATE, 'DD') "COL6"            -- 28
     , TO_CHAR(SYSDATE, 'MM-DD') "COL7"         -- 09-28
     , TO_CHAR(SYSDATE, 'DAY') "COL8"           -- ������
     , TO_CHAR(SYSDATE, 'DY') "COL9"            -- ��
     , TO_CHAR(SYSDATE, 'HH24') "COL10"         -- 11
     , TO_CHAR(SYSDATE, 'HH') "COL11"           -- 11
     , TO_CHAR(SYSDATE, 'HH AM') "COL12"        -- 11 ����
     , TO_CHAR(SYSDATE, 'HH PM') "COL13"        -- 11 ����
     , TO_CHAR(SYSDATE, 'MI') "COL14"           -- 11
     , TO_CHAR(SYSDATE, 'SS') "COL15"           -- 49
     , TO_CHAR(SYSDATE, 'SSSSS') "COL16"        -- 40336       -- ���� 0�� 0�� 0�� -> ���ݱ��� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q') "COL17"            -- 3            -- 123:1�б� / 456:2�б� / 789:3�б� / 101112:4�б�
FROM DUAL;

SELECT 7 "COL1", '7' "COL2", TO_CHAR(7) "COL3"
FROM DUAL;
--==>> 7	7	7
--> ��ȸ ����� ���� ����(����)���� ���� ����(����)���� Ȯ��~!!!

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) "RESULT"
FROM DUAL;
--==>> 2020

--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1"      -- 2020(������)    -> ������ �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'MM') "COL2"        -- 09(������)      -> ���� �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'DD') "COL3"        -- 28(������)      -> ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(YEAR FROM SYSDATE) "COL4"    -- 2020(������)    -> ������ �����Ͽ� ���� Ÿ������...
     , EXTRACT(MONTH FROM SYSDATE) "COL5"   -- 9(������)       -> ���� �����Ͽ� ���� Ÿ������...
     , EXTRACT(DAY FROM SYSDATE) "COL6"     -- 28(������)      -> ���� �����Ͽ� ���� Ÿ������...
FROM DUAL;
--> ��, ��, �� �̿��� �ٸ� �׸��� �Ұ�~!!!


--�� TO_CHAR() Ȱ�� -> ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "COL1"                             -- 60000
     , TO_CHAR(60000) "COL2"                    -- 60000
     , TO_CHAR(60000, '99,999') "COL3"          -- 60,000
     , TO_CHAR(60000, '$99,999') "COL4"         -- $60,000
     , TO_CHAR(60000, 'L99,999') "COL5"         --          \60,000
     , LTRIM(TO_CHAR(60000, 'L99,999')) "COL6"  -- \60,000
FROM DUAL;


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�ϴ� �������� �����Ѵ�.
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/24*60) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>> 
/*
2020-09-28 11:48:14	
2020-10-07 01:48:18
*/


--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
--   TO_YMINTERVAL(), TO_DSINERVAL)
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� �ð�"
FROM DUAL;
--==>>
/*
2020-09-28 11:51:14	
2021-12-01 15:56:20
*/

--------------------------------------------------------------------------------

--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2�� �����' END
FROM DUAL;
--==>> 5+2�� �����

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '����'
       END
FROM DUAL;
--==>> 1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 2 THEN '1+1=4'
                ELSE '����'
       END
FROM DUAL;
--==>> 1+1=2

SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-3=3 THEN '6-3=3'
            WHEN 2*1=3 THEN '2*1=3'
            WHEN 6/3=3 THEN '6/3=3'
            ELSE '����'
       END
FROM DUAL;
--==>> 6-3=3

--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����')
FROM DUAL;
--==>> 5-2=3


--�� CASE WHEN THEN ELSE END Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �� �Ұ�'
       END
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN 'ȫ�ظ���'
            WHEN 5>2 OR 2=3 THEN '�¹�����'
            ELSE '��������'
       END
FROM DUAL;
--==>> ȫ�ظ���

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN 'ȫ�ظ���'
            WHEN 5<2 AND 2=3 THEN '�¹�����'
            WHEN 1+1=2 AND 2+2=4 THEN '���ϸ���'
            ELSE '��������'
       END
FROM DUAL;
--==>> ȫ�ظ���


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN 'ȫ�ظ���'
            WHEN 5<2 AND 2=3 THEN '�¹�����'
            WHEN 1+1=2 AND 2+2=4 THEN '���ϸ���'
            ELSE '��������'
       END
FROM DUAL;
--==>> ���ϸ���


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
--   [�����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�]
--  ��, ���糪�̴� �⺻ �ѱ����� ������ ���� ������ �����Ѵ�.
--  ����, ������������ �ش� ������ ���̰� �ѱ� ���̷� 60���� �Ǵ� ����
--  �� ������ �Ի��, �Ϸ� ������ �����Ѵ�.
--  �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
--- �� ����� ���� �޿� ���� 30% ����, 2000�� �̻� �ٹ��� �����
--  �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

-- MY CODE
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN,7, 1) IN ('1', '3') THEN '����' ELSE '����' END "����"
     , CASE WHEN SUBSTR(JUBUN,7, 1) IN ('3', '4') 
         THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END "���糪��"
     , HIREDATE "�Ի���"
     , HIREDATE + TO_YMINTERVAL(TO_CHAR(60 - (CASE WHEN SUBSTR(JUBUN,7, 1) IN (3, 4) 
         THEN TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END))||'-00') "����������"
     , TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
     , TRUNC(HIREDATE + TO_YMINTERVAL(TO_CHAR(60 - (CASE WHEN SUBSTR(JUBUN,7, 1) IN (3, 4) 
         THEN TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+2000)+1
         ELSE TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY'))-(TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1900)+1
         END))||'-00') - SYSDATE) "�����ϼ�"
     , SAL "�޿�"
     , CASE WHEN (1000 <= TRUNC(SYSDATE - HIREDATE) AND TRUNC(SYSDATE - HIREDATE) < 2000) 
            THEN SAL * (3/10)
            WHEN 2000 <= TRUNC(SYSDATE - HIREDATE) 
            THEN SAL * (5/10)
            ELSE 0
       END "���ʽ�"
FROM TBL_SAWON;


-- TEACHER'S CODE
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� '1' �Ǵ� '3' THEN '����' 
            THEN �ֹι�ȣ 7��°�ڸ� 1���� '2' �Ǵ� '4' THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1
     , CASE WHEN 1900��� ���̶�� THEN ����⵵ - (�ֹι�ȣ�յ��ڸ� + 1899)
            WHEN 2000��� ���̶�� THEN ����⵵ - (�ֹι�ȣ�յ��ڸ� + 1999)
            ELSE -1
       END "���糪��"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1
     , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� '1' �Ǵ� '2' ��� THEN ����⵵ - (�ֹι�ȣ�յ��ڸ� + 1899)
            WHEN �ֹι�ȣ 7��°�ڸ� 1���� '3' �Ǵ� '4' ��� THEN ����⵵ - (�ֹι�ȣ�յ��ڸ� + 1999)
            ELSE -1
       END "���糪��"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (�ֹι�ȣ�յ��ڸ� + 1899) 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (�ֹι�ȣ�յ��ڸ� + 1999)
            ELSE -1
       END "���糪��"
FROM TBL_SAWON;

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
            ELSE '����Ȯ�κҰ�' 
       END "����"
       -- ���糪�� = ����⵵ - �¾�⵵ + 1
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE -1
       END "���糪��"
       -- �Ի���
     , HIREDATE "�Ի���"
       -- �޿�
     , SAL "�޿�"
FROM TBL_SAWON;
--==>>
/*
1012	���켱	    0203024234567	����	19	2002-07-14	2000
1001	������	    9611111234567	����	25	2005-01-03	3000
1002	������	    9412212234567	����	27	1999-11-23	4000
1003	������	    9503092234567	����	26	2006-08-10	1000
1004	������	    7502031234567	����	46	1990-09-20	2000
1005	���ر�	    9606221234567	����	25	2007-10-10	2000
1006	������	    9405222234567	����	27	2010-12-20	3000
1009	Ȳ����	    7202022234567	����	49	1998-03-16	2000
1010	������	    7505051234567	����	46	1998-03-16	1000
1011	������	6909092234567	����	52	1996-01-10	1000
1013	����	    0101013234567	����	20	2002-07-14	1000
1014	���ù�	    0402063234567	����	17	2012-08-14	1000
1015	�����	    9510302234567	����	26	2010-05-06	4600
1016	����	    7212121234567	����	49	1995-05-06	2000
1007	������	    0203044234567	����	19	2012-04-06	1000
1008	������	    0506074234567	����	16	2016-08-17	1000
1017	������	    0603194234567	����	15	2015-01-20	1500
*/


SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
    -- ����������
    -- ���������⵵ -> �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
    -- ���� ���̰�... 57��...  3�� ��        2020 -> 2023
    -- ���� ���̰�... 28��... 32�� ��        2020 -> 2052
    -- ADD_MONTHS(SYSDATE, �������*12)
    --                     ---------
    --                    60 - ���糪��
    -- ADD_MONTHS(SYSDATE, (60 - ���糪��) * 12)    -> Ư�� ��¥
    -- TO_CHAR(Ư������, 'YYYY')                     -> �������� �⵵�� ����
    -- TO_CHAR('�Ի���', 'MM-DD')                    -> ���ϸ� ����
    -- TO_CHAR(Ư������, 'YYYY') || '-' || TO_CHAR('�Ի���', 'MM-DD') "����������"
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��) * 12), 'YYYY') || '-'  || TO_CHAR('�Ի���', 'MM-DD') "����������"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
    -- �ٹ��ϼ�
    -- �ٹ��ϼ� = ������ - �Ի���
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
    -- �����ϼ�
    -- �����ϼ� = ���������� - ������
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
    -- �޿�
     , T.�޿�
    -- ���ʽ�
    -- �ٹ��ϼ��� 1000�� �̻� 2000�� �̸� -> ���� �޿��� 30% ����
    -- �ٹ��ϼ��� 2000�� �̻�             -> ���� �޿��� 50% ����
    -- ������                             -> 0
    ----------------------------------------------------------------------------
    -- �ٹ��ϼ��� 2000�� �̻�             -> �޿� * 0.5
    -- �ٹ��ϼ��� 1000�� �̻�             -> �޿� * 0.3            
    -- ������                             -> 0
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3 
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
                ELSE '����Ȯ�κҰ�' 
           END "����"
           -- ���糪�� = ����⵵ - �¾�⵵ + 1
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "���糪��"
           -- �Ի���
         , HIREDATE "�Ի���"
           -- �޿�
         , SAL "�޿�"
    FROM TBL_SAWON
) T;


SELECT *
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) "����", SAL*12+NVL(COMM, 0)*2 "�ι迬��"
     ,  SAL*12+NVL(COMM, 0)*3 "���迬��",  SAL*12+NVL(COMM, 0)*4 "�׹迬��"
FROM EMP;
-- ���� ���� �����ϴ�...

-- SUBQUERY(INLINE VIEW)
SELECT T.����, T.����*2 "�ι迬��", T.����*3 "���迬��", T.����*4 "�׹迬��" -- OUTER QUERY
FROM 
(
    SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) "����"              -- INNER QUERY
    FROM EMP
) T;


SELECT �����ȣ, �����
FROM 
(
    SELECT EMPNO "�����ȣ", ENAME "�����"
    FROM EMP
);


-- �� �ڵ忡�� �ּ� ������ �ڵ�
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3 
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
                ELSE '����Ȯ�κҰ�' 
           END "����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "���糪��"
         , HIREDATE "�Ի���"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;


-- ������ ó���� ������ �������
-- Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�...
-- Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 �߻��� �� �ִ�.
-- �̿� ���� ���... �ش� �������� �ٽ� �����ؾ� �ϴ� ���ŷο��� ���� �� �ֵ���
-- ��(VIEW)�� ����� �����ص� �� �ִ�.

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3 
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
                ELSE '����Ȯ�κҰ�' 
           END "����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "���糪��"
         , HIREDATE "�Ի���"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;
--==>> ���� �߻�
-- ORA-01031 : insufficient priviliges
--             (���� �����)


--�� SYS�������� ���� SCOTT ������ VIEW�� CREATE �� �� �ֵ��� GRANT
-- Grant��(��) �����߽��ϴ�. 
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD') "����������"
     , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��) * 12), 'YYYY') || '-' 
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5
            WHEN TRUNC(SYSDATE - T.�Ի���) >= 1000 THEN T.�޿� * 0.3 
            ELSE 0
       END "���ʽ�"
FROM
(
    SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����' 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'  
                ELSE '����Ȯ�κҰ�' 
           END "����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
           END "���糪��"
         , HIREDATE "�Ի���"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;
-- View VIEW_SAWON��(��) �����Ǿ����ϴ�.


SELECT *
FROM VIEW_SAWON;
--==>>
/*
1012	���켱	    0203024234567	����	19	2002-07-14	2061-07-14	6651	14898	2000	1000
1001	������	    9611111234567	����	25	2005-01-03	2055-01-03	5747	12514	3000	1500
1002	������	    9412212234567	����	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1003	������	    9503092234567	����	26	2006-08-10	2054-08-10	5163	12368	1000	500
1004	������	    7502031234567	����	46	1990-09-20	2034-09-20	10966	5104	2000	1000
1005	���ر�	    9606221234567	����	25	2007-10-10	2055-10-10	4737	12794	2000	1000
1006	������	    9405222234567	����	27	2010-12-20	2053-12-20	3570	12135	3000	1500
1009	Ȳ����	    7202022234567	����	49	1998-03-16	2031-03-16	8232	3820	2000	1000
1010	������	    7505051234567	����	46	1998-03-16	2034-03-16	8232	4916	1000	500
1011	������	6909092234567	����	52	1996-01-10	2028-01-10	9028	2659	1000	500
1013	����	    0101013234567	����	20	2002-07-14	2060-07-14	6651	14533	1000	500
1014	���ù�	    0402063234567	����	17	2012-08-14	2063-08-14	2967	15659	1000	500
1015	�����	    9510302234567	����	26	2010-05-06	2054-05-06	3798	12272	4600	2300
1016	����	    7212121234567	����	49	1995-05-06	2031-05-06	9277	3871	2000	1000
1007	������	    0203044234567	����	19	2012-04-06	2061-04-06	3097	14799	1000	500
1008	������	    0506074234567	����	16	2016-08-17	2064-08-17	1503	16028	1000	300
1017	������	    0603194234567	����	15	2015-01-20	2065-01-20	2078	16184	1500	750
*/


SELECT *
FROM VIEW_SAWON
WHERE �ٹ��ϼ� >= 10000;
--==>> 1004	������	7502031234567	����	46	1990-09-20	2034-09-20	10966	5104	2000	1000

SELECT *
FROM VIEW_SAWON
WHERE ���ʽ� >= 2000;
--==>>
/*
1002	������	9412212234567	����	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1015	�����	9510302234567	����	26	2010-05-06	2054-05-06	3798	12272	4600	2300
*/


/*
���̺���� --------------- �� ���� -------------- ���ڵ� �Է� ------------- �� ��ȸ
 (100)                      (100)                   (10)                     (110)
*/

CREATE OR REPLACE VIEW VIEW_EMP
AS
SELECT EMPNO, ENAME, JOB, SAL, SAL*12+NVL(COMM, 0) "����"
FROM EMP;


SELECT *
FROM VIEW_EMP;


--�� TBL_SAWON ���̺��� ������� 
--   ���������� Ȱ���Ͽ� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
---------------------------------------------------
--   �����   ����   ���糪��   �޿�   ���̺��ʽ�
---------------------------------------------------

--   ��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
--   30�� �̻� 40�� �̸��̸� �޿��� 50%
--   20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.

--   ����, �ϼ��� ��ȸ ������ ����
--   VIEW_SAWON2 ��� �̸��� ��(VIEW)�� �����Ѵ�.

-- ���������� �̿��� ������
SELECT T.*
     , CASE WHEN 40 <= ���糪�� THEN �޿� * 0.7
            WHEN 30 <= ���糪�� THEN �޿� * 0.5
            WHEN 20 <= ���糪�� THEN �޿� * 0.3
            ELSE 0
       END "���̺��ʽ�"
FROM
(
    SELECT SANAME "�����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE '�����Ǻ��Ұ�'
           END "����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000 - 1)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900 - 1)
                ELSE -1
           END "���糪��"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;

-- VIEW ����
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT �����, ����, ���糪��, �޿�
     , CASE WHEN 40 <= ���糪�� THEN �޿� * 0.7
            WHEN 30 <= ���糪�� THEN �޿� * 0.5
            WHEN 20 <= ���糪�� THEN �޿� * 0.3
            ELSE 0
       END "���̺��ʽ�"
FROM
(
    SELECT SANAME "�����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE '�����Ǻ��Ұ�'
           END "����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000 - 1)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900 - 1)
                ELSE -1
           END "���糪��"
         , SAL "�޿�"
    FROM TBL_SAWON
) T;

-- Ȯ��
SELECT * 
FROM VIEW_SAWON;
--==>>
/*
1012	���켱	    0203024234567	����	19	2002-07-14	2061-07-14	6651	14898	2000	1000
1001	������	    9611111234567	����	25	2005-01-03	2055-01-03	5747	12514	3000	1500
1002	������	    9412212234567	����	27	1999-11-23	2053-11-23	7615	12108	4000	2000
1003	������	    9503092234567	����	26	2006-08-10	2054-08-10	5163	12368	1000	500
1004	������	    7502031234567	����	46	1990-09-20	2034-09-20	10966	5104	2000	1000
1005	���ر�	    9606221234567	����	25	2007-10-10	2055-10-10	4737	12794	2000	1000
1006	������	    9405222234567	����	27	2010-12-20	2053-12-20	3570	12135	3000	1500
1009	Ȳ����	    7202022234567	����	49	1998-03-16	2031-03-16	8232	3820	2000	1000
1010	������	    7505051234567	����	46	1998-03-16	2034-03-16	8232	4916	1000	500
1011	������	6909092234567	����	52	1996-01-10	2028-01-10	9028	2659	1000	500
1013	����	    0101013234567	����	20	2002-07-14	2060-07-14	6651	14533	1000	500
1014	���ù�	    0402063234567	����	17	2012-08-14	2063-08-14	2967	15659	1000	500
1015	�����	    9510302234567	����	26	2010-05-06	2054-05-06	3798	12272	4600	2300
1016	����	    7212121234567	����	49	1995-05-06	2031-05-06	9277	3871	2000	1000
1007	������	    0203044234567	����	19	2012-04-06	2061-04-06	3097	14799	1000	500
1008	������	    0506074234567	����	16	2016-08-17	2064-08-17	1503	16028	1000	300
1017	������	    0603194234567	����	15	2015-01-20	2065-01-20	2078	16184	1500	750
*/