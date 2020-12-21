SELECT USER
FROM DUAL;
--==>> SCOTT

--���� ����Ŭ_��ȣȭ��ȣȭ_03_scott.sql ����-- 

--�� ���̺� ����
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(30)
);
--==>> Table TBL_EXAM��(��) �����Ǿ����ϴ�.

--�� ������ �Է�
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, '201218');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EXAM;
--==>> 1	201218

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� ��ȣȭ/��ȣȭ ��Ű���� ��ȣȭ �Լ��� Ȱ���� ������ �Է�
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('201218', 'SUPERMAN'));

--�� Ȯ��
SELECT *
FROM TBL_EXAM;
--==>> 1	"?"?
-- SUPERMAN Ű�� �𸣸� �� PW�� ���� �Ұ���

--�� Ŀ��
COMMIT;

SELECT ID, CRYPTPACK.DECRYPT(PW, 'BATMAN') AS PW
FROM TBL_EXAM;
--==>> 1	E??

SELECT ID, CRYPTPACK.DECRYPT(PW, 'SUPERMAN') AS PW
FROM TBL_EXAM;
--==>> 1	201218

