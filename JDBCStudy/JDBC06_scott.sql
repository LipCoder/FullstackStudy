SELECT USER
FROM DUAL;


--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
/*
1	�躸��	010-1111-1111
2	��¹�	010-2222-2222
3	�Ǽ���	010-3333-3333
4	�Ǽ���	010-4444-4444
*/


--�� �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


COMMIT;


--�� JDBC06�� ������ ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
6	�����	010-5555-5555
1	�躸��	010-1111-1111
2	��¹�	010-2222-2222
3	�Ǽ���	010-3333-3333
4	�Ǽ���	010-4444-4444
5	������	010-4444-4444
*/


--�� JDBC06�� prepareStatement ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 
/*
6	�����	010-5555-5555
9	�����	010-7777-7777
10	���ΰ�	010-9999-9999
11	������	010-1234-1234
12	������	010-2345-2345
1	�躸��	010-1111-1111
2	��¹�	010-2222-2222
3	�Ǽ���	010-3333-3333
4	�Ǽ���	010-4444-4444
5	������	010-4444-4444
*/

--�� ����Ʈ ��ȸ ������ �غ�
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
