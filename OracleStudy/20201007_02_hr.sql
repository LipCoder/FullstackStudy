SELECT USER
FROM DUAL;
--==>> HR

--���� ����ȭ(Normalization) ����--

--�� ����ȭ��?
--   �� ����� �����ͺ��̽� ������ �޸� ���� ���� ����
--   � �ϳ��� ���̺���... �ĺ��ڸ� ������ ���� ���� ���̺�� ������ ������ ���Ѵ�.

-- ex) ȫ���̰�... �������� �Ǹ��Ѵ�.
--     ������Ʈ -> �ŷ�ó ������ ����� �����ִ� ��ø�� ������
--                   �����ͺ��̽�ȭ �Ϸ��� �Ѵ�.

-- ���̺�� : �ŷ�ó����
/*
    10Byte    10Byte   10Byte         10Byte    10Byte 10Byte     10Byte
--------------------------------------------------------------------------------
�ŷ�óȸ��� ȸ���ּ� ȸ����ȭ     �ŷ�ó������ ����  �̸���      �޴���
--------------------------------------------------------------------------------
    LG      ���￩�ǵ� 02-345-6789    ������     ����  kjw@na....  010-1...
    LG      ���￩�ǵ� 02-345-6789    �Ǽ���     ����  ksy@da....  010-7...
    LG      ���￩�ǵ� 02-345-6789    ������     �븮  jyj@te....  010-2...
    LG      ���￩�ǵ� 02-345-6789    ������     ����  ahj@na....  010-1...    
    SK      ����Ұ��� 02-345-6789    ���ر�     ����  ljk@gm....  010-9...
    LG      �λ굿���� 051-777-8888   ������     �븮  jye@na....  010-8...
    LG      �λ굿���� 051-777-8888   ������     �븮  cys@na....  010-3...
    SK      ����Ұ��� 02-987-6543    ���Ͽ�     ����  kiw@da....  010-9...
                                        :
                                        :
--------------------------------------------------------------------------------
*/

/* 
����) ���� ���ǵ� LG ��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�� ���̶�� �����Ѵ�.
      (70byte * 100��)
      
      ��� ��... [���￩�ǵ�]�� ��ġ�� LG ���簡 [����ϻ�] ����
      ����� �����ϰ� �Ǿ���.
      
      ȸ���ּҴ� [����ϻ�]���� �ٲ��, ȸ����ȭ [031-111-2222] �� �ٲ�� �Ǿ���.
      
      �׷���... 100�� ���� ȸ���ּҿ� ȸ����ȭ�� �����ؾ� �Ѵ�.
      
      -- �� �� ����Ǿ�� �� ������ -> UPDATE
      

      
      UPDATE �ŷ�ó����
      SET ȸ���ּ�='����ϻ�', ȸ����ȭ='031-111-2222'
      WHERE �ŷ�óȸ��� = 'LG'
        AND ȸ���ּ� = '���￩�ǵ�';
      
      -- 100�� �� ��(���ڵ�)�� �ϵ��ũ �󿡼� �о�ٰ�
         �޸𸮿� �ε���� �־�� �Ѵ�.
         ��, 100�� * 70Byte �� ���
         �ϵ��ũ �󿡼� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
         
         --> �̴� ���̺��� ���谡 �߸��Ǿ����Ƿ�
             DB ������ ������ �޸� ���� ���� DOWN �� ���̴�.
            
             --> �׷��Ƿ� ����ȭ ������ �����ؾ� �Ѵ�.
*/


-- �� 1 ����ȭ
--> � �ϳ��� ���̺� �ݺ��Ǵ� �÷� ������ �����Ѵٸ�
--  ������ �ݺ��Ǿ� ������ �÷��� �и��Ͽ�
--  ���ο� ���̺��� ������ش�.

--> �� 1 ����ȭ�� �����ϴ� �������� �и��� ���̺���
--  �ݵ�� �θ� ���̺�� �ڽ� ���̺��� ���踦 ���� �ȴ�.

--> �θ� ���̺� -> �����޴� �÷� -> PRIMARY KEY
--> �ڽ� ���̺� -> �����ϴ� �÷� -> FOREIGN KEY

--�� �����޴� �÷��� ���� Ư¡
--   �ݵ�� ������ ��(������)�� ���;� �Ѵ�.
--   �ߺ��� ��(������)�� ����� �Ѵ�.
--   NULL �� �־�� �ȵȴ�. (��, NOT NULL �̾�� �Ѵ�.)
 
--> �� 1 ����ȭ�� �����ϴ� ��������
--  �θ� ���̺��� PRIMARY KEY �� �׻� �ڽ� ���̺��� FOREIGN KEY �� ���̵ȴ�.

-- ���̺�� : ȸ�� -> �θ����̺�
/*
10Byte   10Byte    10Byte   10Byte         
--------------------------------------------------------------------------------
ȸ��ID �ŷ�óȸ��� ȸ���ּ� ȸ����ȭ   
======
�����޴� �÷� -> P.K
--------------------------------------------------------------------------------
 10     LG      ���￩�ǵ� 02-345-6789         
 20     SK      ����Ұ��� 02-345-6789    
 30     LG      �λ굿���� 051-777-8888  
--------------------------------------------------------------------------------
*/

-- ���̺�� : ���� -> �ڽ����̺�
/*
  10Byte    10Byte 10Byte     10Byte
--------------------------------------------------------------------------------
�ŷ�ó������ ����  �̸���      �޴���        ȸ��ID
                                             =========
                                             �����ϴ� �÷� -> F.K
--------------------------------------------------------------------------------
  ������     ����  kjw@na....  010-1...      10
  �Ǽ���     ����  ksy@da....  010-7...      10
  ������     �븮  jyj@te....  010-2...      10
  ������     ����  ahj@na....  010-1...      10
  ���ر�     ����  ljk@gm....  010-9...      20
  ������     �븮  jye@na....  010-8...      30
  ������     �븮  cys@na....  010-3...      30
  ���Ͽ�     ����  kiw@da....  010-9...      20
            :
            :
--------------------------------------------------------------------------------
*/


-- ���̺��� �и��Ǳ� ���� ���·� ��ȸ
SELECT A.�ŷ�óȸ���, A.ȸ���ּ�, A.ȸ����ȭ, 
       B.�ŷ�ó������, B.����, B.�̸���, B.�޴���
FROM ȸ�� A, ���� B
WHERE A.ȸ��ID = B.ȸ��ID;

/* 
����) ���� ���ǵ� LG ��� ȸ�翡 �ٹ��ϴ� �ŷ�ó ���� �����
      �� 100�� ���̶�� �����Ѵ�.

      ��ü ������ 200�� ���̴�.      

      ��� ��... [���￩�ǵ�]�� ��ġ�� LG ���簡 [����ϻ�] ����
      ����� �����ϰ� �Ǿ���.
      
      ȸ���ּҴ� [����ϻ�]���� �ٲ��, ȸ����ȭ [031-111-2222] �� �ٲ�� �Ǿ���.
      
      �׷���... 100�� ���� ȸ���ּҿ� ȸ����ȭ�� �����ؾ� �Ѵ�.
      
      -- �� �� ����Ǿ�� �� ������ -> UPDATE
      
      UPDATE ȸ��
      SET ȸ���ּ� = '����ϻ�', ȸ����ȭ = '031-111-2222'
      WHERE ȸ��ID = 10;
   
      -- 1�� ��(���ڵ�)�� �ϵ��ũ �󿡼� �о�ٰ�
         �޸𸮿� �ε���� �־�� �Ѵ�.
         ��, 1 * 40Byte �� �ϵ��ũ �󿡼� �о�ٰ� �޸𸮿� �ε���� �־�� �Ѵٴ� ���̴�.
         
         --> ����ȭ �������� 100�� ���� ó���ؾ� �� ��������
             1�Ǹ� ó���ϸ� �Ǵ� ������ �ٲ� ��Ȳ�̱� ������ 
             DB ������ �޸� ���� �Ͼ�� �ʰ� ���� ������ ó���� ���̴�.
*/

/*
-- �ŷ�óȸ���, ȸ����ȭ
SELECT �ŷ�óȸ���, ȸ����ȭ         |     SELECT �ŷ�óȸ���, ȸ����ȭ
FROM ȸ��;                            |     FROM �ŷ�ó����;
--> 3 * 40 Byte                       |     --> 200�� * 70Byte

-- �ŷ�ó������, ����
SELECT �ŷ�ó������, ����             |     SELECT �ŷ�ó ������, ����
FROM ����;                            |     FROM �ŷ�ó����;
--> 200�� * 50Byte                    |     -> 200�� * 70Byte

-- �ŷ�óȸ���, �ŷ�ó������
SELECT A.�ŷ�óȸ���, B.�ŷ�ó������ |    SELECT �ŷ�óȸ���, �ŷ�ó������
FROM ȸ�� A JOIN ���� B               |    FROM �ŷ�ó����;
ON A.ȸ��ID = B.ȸ��ID;               |     
--> (3 * 40 Byte) + (200�� * 50Byte)       -> 200�� * 70Byte

--> �����ϴ� �޸𸮰� ���� �پ���!
*/


-- ���̺�� : �ֹ�
/*
--------------------------------------------------------------------------------
     ��ID         ��ǰ�ڵ�           �ֹ�����              �ֹ�����
--------------------------------------------------------------------------------
    LJJ1217(������) PKKBK(�ܲʹ��)    2020-10-02 13:50:47        10
    AHR9238(������) PKKBC(����Ĩ)      2020-10-02 14:23:15        20
    KJH5266(����ȣ) PKKDS(��ũ�ٽ�)    2020-10-02 14:15:30        13
    KSY1234(�����) PKWKK(�����)      2020-10-03 09:00:11         5
                        :
                        :
--------------------------------------------------------------------------------
*/

--�� �ϳ��� ���̺� �����ϴ� PRIMARY KEY �� �ִ� ������ 1���̴�.
--   ������, PRIMARY KEY �� �̷��(�����ϴ�) �÷��� ������ ����(������)�� ���� �����ϴ�.
-->  �÷� �� ���θ� ������ PRIMARY KEY �� SINGLE PRIMARY KEY ��� �θ���.
--   (���� �����̸Ӹ� Ű)
-->  �� �� �̻��� �÷����� ������ PRIMARY KEY �� COMPOSITE PRIMARY KEY ��� �θ���.
--   (���� �����̸Ӹ� Ű)
--   ������� ���� �����̸Ӹ� Ű��� �� 2 ����ȭ�� �ǳʶپ ������
--   ���� ���� �����̸Ӹ� Ű��� �� �� 2 ����ȭ�� ����� �Ѵ�.
--   �� 2 ����ȭ�� �̰� �ɰ��� �����̱� �����̴�.


-- �� 2 ����ȭ
--> �� 1 ����ȭ�� ��ģ ��������� PRIMARY KEY �� SINGLE COLUMN �̶��
--  �� 2 ����ȭ�� �������� �ʴ´�.
--  ������, PRIMARY KEY �� COMPOSITE COLUMN �̶��
--  ��.��.��. �� 2 ����ȭ�� �����ؾ� �Ѵ�.

--> �ĺ��ڰ� �ƴ� �÷��� �ĺ��� ��ü �÷��� ���� �������̾�� �ϴµ�
--  �ĺ��� ��ü �÷��� �ƴ� �Ϻ� �ĺ��� �÷��� ���ؼ��� �������̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� ������ �ش�.
--  �� ������ �� 2 ����ȭ��� �Ѵ�.

/*
-- ���̺�� : ���� -> �θ� ���̺�
--------------------------------------------------------------------------------
�����ȣ   �����   ������ȣ   �����ڸ�   ���ǽ��ڵ�   ���ǽǼ���
++++++++            ++++++++
       P      .     K
--------------------------------------------------------------------------------
  J0101    �ڹٱ���    21      ������ó       A301     ����ǽ��� 3�� 40��
  J0102    �ڹ��߱�    22      �׽���         T502     ���ڰ��а� 5�� 60��
  O3309    ����Ŭ�߱�  22      �׽���         A201     ����ǽ��� 2�� 30��
  O3324    ����Ŭ��ȭ  10      �念��         T502     ���ڰ��а� 5�� 60��
  J3342    JSP����     20      �ƽ���         K101     �ι����а� 1�� 90��
                              :
--------------------------------------------------------------------------------

-- ���̺�� : ���� -> �ڽ� ���̺�
--------------------------------------------------------------------------------
�����ȣ   ������ȣ          �й�           ����
===================
       F.K
++++++++                   ++++++++++
    P         .              K
--------------------------------------------------------------------------------
  O3309       22           2018316(������)   92
  O3309       22           2018317(��ȫ��)   80
  O3309       22           2018324(�̿���)   96
                        :
--------------------------------------------------------------------------------
*/

-- �� 3 ����ȭ
--> �ĺ��ڰ� �ƴ� �÷��� �ĺ��ڰ� �ƴ� �÷��� ���� �������� ��Ȳ�̶��
--  �̸� �и��Ͽ� ���ο� ���̺��� ������ �־�� �Ѵ�.
--  �� ������ �� 3 ����ȭ��� �Ѵ�.


--�� ����(Relation)�� ����

-- 1 : MANY(��) ����
--> �� 1 ����ȭ�� �����Ͽ� ������ ��ģ ��������� ��Ÿ���� �ٶ����� ����.
--  ������ �����ͺ��̽��� Ȱ���ϴ� �������� �߱��ؾ� �ϴ� ����.

-- 1 : 1 ����
--> ����, ���������� ������ �� �ִ� �����̱� ������
--  ������ �����ͺ��̽� ���� �������� �������̸� ���ؾ� �� ����

-- MANY(��) : MANY(��) ����
--> ������ �𵨸������� ������ �� ������
--  ���� �������� �𵨸������� ������ �� ���� ����.

/*
-- ���̺�� : ��                        -- ���̺�� : ��ǰ
--------------------------------------    -----------------------------------------------------------
����ȣ  ����   �̸���  ��ȭ��ȣ       ��ǰ��ȣ   ��ǰ��   ��ǰ�ܰ�   ��ǰ����...
+++++++++                                 +++++++++
--------------------------------------    -----------------------------------------------------------
 1001     ������   jyj@te..  010-1...     pswk       �����     700      ���찡 ���...
 1002     ������   jyw@na..  010-7...     pkjk       ���ڱ�     800      ���ڰ� ����ִ�...
 1003     ������   jys@gm..  010-9...     pkkm       ������   900      ������ ��� �� ���ִ�...
 1004     ���ΰ�   jik@ha..  010-2...     pjkc       �ڰ�ġ     600      �ڰ��� ����ִ�...
                :                                               :
--------------------------------------    -----------------------------------------------------------

                            -- ���̺�� : �ֹ�����(�Ǹ�)
                            ----------------------------------------------
                            ����ȣ    ��ǰ��ȣ    �ֹ�����    �ֹ�����
                            =========  ==========
                            ----------------------------------------------
                            1001        pswk        2020-10-...     10
                            1001        pkjk        2020-10-...     20
                            1002        pkjk        2020-10-...     50
                            1004        pkjk        2020-10-...    100
                                            :
                            ----------------------------------------------
*/

-- �� 4 ����ȭ
--> ������ Ȯ���� ����� ���� [many(��) : many(��)] ���踦 
--  [1(��) : many(��)] ����� ���߸��� ������ �ٷ� �� 4 ����ȭ ���� �����̴�.
--  -> �Ļ� ���̺� ���� -> ��:�� ���踦 1:�� ����� ���߸��� ���� ����.
--     ex) �ֹ��������̺�, ������û���̺�



-- ������ȭ(������ȭ)
/*
A ��� -> ������ȭ�� �������� �ʴ� ���� �ٶ����� ���~!!!

-- ���̺�� : �μ�            -- ���̺�� : ���
   10        10      10          10       10     10    10     10       10          10
--------------------------    ------------------------------------------------ + -------
�μ���ȣ   �μ���   �ּ�      �����ȣ  �����  ����  �޿�  �Ի���  �μ���ȣ     �μ���
--------------------------    ------------------------------------------------ + -------
          10�� ��                          1,000,000�� ��
--------------------------    ------------------------------------------------ + -------

-->> ��ȸ �����
-------------------------------
�μ���   �����   ����   �޿�
-------------------------------
*/

--> [�μ�] ���̺�� [���] ���̺��� JOIN ���� ���� ũ��
--  (10 * 30Byte) + (1000000 * 60byte) = 300 + 60000000 = 60000300Byte

--> [���] ���̺��� ������ȭ ������ �� �� ���̺� �о�� ���� ũ��
--  10000000 * 70Byte = 70000000Byte


/*
B ��� -> ������ȭ�� �������� �ʴ� ���� �ٶ����� ���~!!!

-- ���̺�� : �μ�            -- ���̺�� : ���
   10        10      10          10       10     10    10     10       10          10
--------------------------    ------------------------------------------------ + -------
�μ���ȣ   �μ���   �ּ�      �����ȣ  �����  ����  �޿�  �Ի���  �μ���ȣ     �μ���
--------------------------    ------------------------------------------------ + -------
     500,000�� ��                          1,000,000�� ��
--------------------------    ------------------------------------------------ + -------

-->> ��ȸ �����
-------------------------------
�μ���   �����   ����   �޿�
-------------------------------
*/

--> [�μ�] ���̺�� [���] ���̺��� JOIN ���� ���� ũ��
--  (500000 * 30Byte) + (1000000 * 60byte) = 15000000 + 60000000 = 75000000Byte

--> [���] ���̺��� ������ȭ ������ �� �� ���̺� �о�� ���� ũ��
--  10000000 * 70Byte = 70000000Byte

-- ����ȭ ������ȭ ���� 
--> �� ���̺� ���̿� ������ ���̰� ���̳��� ����ȭ �ٶ���
--  �� ���̺� ���̿� ������ ���̰� ���̳��� ������ ������ȭ �ٶ���
--  JOIN ���·� ��ȸ�� �ʿ��� ��쿡...


--------------------------------------------------------------------------------
/*
--�� ����

1. ����(relationship, relation)
   - ��� ��Ʈ��(entry)�� ���ϰ��� ������.
   - �� ��(column)�� ������ �̸��� ������ ������ ���ǹ��ϴ�.
   - ���̺��� ��� ��(row = Ʃ�� = tuple)�� �������� ������ ������ ���ǹ��ϴ�.
   
2. �Ӽ�(attribute)
   - ���̺��� ��(column)�� ��Ÿ����.
   - �ڷ��� �̸��� ���� �ּ� ���� ���� : ��ü�� ����, ���� ���
   - �Ϲ� ����(file)�� �׸�(������ = item = �ʵ� = field)�� �ش��Ѵ�.
   - ��ƼƼ(entity)�� Ư���� ���¸� ���.
   - �Ӽ�(attribute)�� �̸��� ��� �޶�� �Ѵ�.
   
3. Ʃ��(tuple) = ��ƼƼ = entity
   - ���̺��� ��(row)
   - ������ �� ���� �Ӽ����� ����.
   - ���� ���� ����.
   - �Ϲ� ����(file)�� ���ڵ�(record)�� �ش��Ѵ�.
   - Ʃ�� ����(tuple variable)
      : Ʃ��(tuple)�� ����Ű�� ����, ��� Ʃ�� ������ ���������� �ϴ� ����
      
4. ������(domain)
   - �� �Ӽ�(attribute)�� ���� �� �ֵ��� ���� ������ ����
   - �Ӽ� ��� ������ ���� �ݵ�� ������ �ʿ�� ����
   - ��� �����̼ǿ��� ��� �Ӽ����� �������� ������(atomic)�̾�� ��.
   - ������ ������
       : �������� ���Ұ� �� �̻� �������� �� ���� ����ü�� ���� ��Ÿ��.
       
5. �����̼�(relation)
   - ���� �ý��ۿ��� ����(file)�� ���� ����.
   - �ߺ��� Ʃ��(tuple = entity = ��ƼƼ)�� �������� �ʴ´�. -> ��� ������(Ʃ���� ���ϼ�)
   - �����̼� = Ʃ��(��ƼƼ = entity)�� ����. ���� Ʃ���� ������ ���ǹ��ϴ�.
   - �Ӽ�(attribute)������ ������ ����.
*/


--------------------------------------------------------------------------------
/*
--���� ���Ἲ(Integrity) ����--

1. ���Ἲ���� ��ü ���Ἲ(Entity Integrity)
              ���� ���Ἲ(Relation Integrity)
              ������ ���Ἲ(Domain Integrity)�� �ִ�.
              
2. ��ü ���Ἲ(Entity Integrity)
   ��ü ���Ἲ�� �����̼ǿ��� ����Ǵ� Ʃ��(tuple)��
   ���ϼ��� �����ϱ� ���� ���������̴�.
   
3. ���� ���Ἲ(Relation Integrity)
   ���� ���Ἲ�� �����̼� ���� ������ �ϰ����� 
   �����ϱ� ���� ���������̴�.
   
4. ������ ���Ἲ(Domain Integrity)
   ������ ���Ἲ�� ��� ������ ���� ������ 
   �����ϱ� ���� ���������̴�.
   
5. ���������� ����

   - PRIMARY KEY(PK:P) -> �⺻Ű, ����Ű
     �ش� �÷��� ���� �ݵ�� �����ؾ� �ϸ�(NOT NULL)
     , �����ؾ� �Ѵ�(�ߺ�X).
     (NOT NULL �� UNIQUE �� ���յ� ����)
     
   - FOREIGN KEY(FK:F:R) -> �ܷ�Ű, �ܺ�Ű, ����Ű
     �ش� �÷��� ���� �����Ǵ� ���̺��� �÷� �����͵� �� �ϳ���
     ��ġ�ϰų� NULL �� ������.
     
   - UNIQUE(UK:U)
     ���̺� ������ �ش� �÷��� ���� �׻� �����ؾ� �Ѵ�.
     
   - NOT NULL(NN:CK:C)
     �ش� �÷��� NULL �� ������ �� ����.
     
   - CHECK(CK:C)
     �ش� �÷��� ���� ������ �������� ���� ������ ������ �����Ѵ�.

*/


-------------------------------------------------------------------------------
--���� PRIMARY KEY ����--

--1. ���̺� ���� �⺻ Ű�� �����Ѵ�.

--2. ���̺��� �� ���� �����ϰ� �ĺ��ϴ� �÷� �Ǵ� �÷��� �����̴�.
--   �⺻ Ű�� ���̺� �� �ִ� �ϳ��� �����Ѵ�.
--   �׷��� �ݵ�� �ϳ��� �÷����θ� �����Ǵ� ���� �ƴϴ�.
--   NULL �� �� ����, �̹� ���̺� �����ϰ� �ִ� �����͸�
--   �ٽ� �Է��� �� ������ ó���Ѵ�.
--   ���������� UNIQUE INDEX �� �ڵ����� �����ȴ�. (����Ŭ�� ��ü������ �����.)

-- 3. ���� �� ����
--  �� �÷� ������ ����
--  �÷��� ������ Ÿ�� [CONSTRAINT CONSTRAINT��] PRIMARY KEY[(�÷���, ...)]
--  ( [] �� �κ��� ������ ������ �κ� )

--  �� ���̺� ������ ����
--  �÷��� ������Ÿ��,
--  �÷��� ������Ÿ��,
--  CONSTRAINT CONSTRAINT�� PRIMARY KEY(�÷���, ...)
--  ---------- ------------
--    ��������  �����������̸�

-- 4. CONSTRAINT �߰� �� CONSTRAINT ���� �����ϸ�
--    ����Ŭ ������ �ڵ������� CONSTRAINT ���� �ο��Ѵ�.
--    �Ϲ������� CONSTRAINT ���� �����̺��_�÷���_CONSTRAINT���ڡ�
--    �������� ����Ѵ�.

-- �� PK ���� �ǽ�(�� �÷� ������ ����)
-- ���̺� ����
CREATE TABLE TBL_TEST1
( COL1   NUMBER(5)       PRIMARY KEY
, COL2   VARCHAR2(30)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'TEST');      --> ���� �߻�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(1, 'ABCD');      --> ���� �߻�
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST1(COL1) VALUES(4);
INSERT INTO TBL_TEST1(COL1) VALUES(4);                    --> ���� �߻�
INSERT INTO TBL_TEST1(COL2) VALUES('STUDY');              --> ���� �߻�(COL1�� NULL)
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES(NULL, NULL);     --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	(NULL)
4	(NULL)
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)     -> PK �������� Ȯ�� �Ұ�~!!!
COL2          VARCHAR2(30) 
*/


--�� �������� Ȯ��
SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
HR	REGION_ID_NN	C	REGIONS	"REGION_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	REG_ID_PK	P	REGIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	REG_ID_PK		
HR	COUNTRY_ID_NN	C	COUNTRIES	"COUNTRY_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	COUNTRY_C_ID_PK	P	COUNTRIES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	COUNTRY_C_ID_PK		
HR	COUNTR_REG_FK	R	COUNTRIES		HR	REG_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_CITY_NN	C	LOCATIONS	"CITY" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	LOC_ID_PK	P	LOCATIONS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	LOC_ID_PK		
HR	LOC_C_ID_FK	R	LOCATIONS		HR	COUNTRY_C_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_NAME_NN	C	DEPARTMENTS	"DEPARTMENT_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_ID_PK	P	DEPARTMENTS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	DEPT_ID_PK		
HR	DEPT_LOC_FK	R	DEPARTMENTS		HR	LOC_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JOB_TITLE_NN	C	JOBS	"JOB_TITLE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JOB_ID_PK	P	JOBS					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JOB_ID_PK		
HR	EMP_LAST_NAME_NN	C	EMPLOYEES	"LAST_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_EMAIL_NN	C	EMPLOYEES	"EMAIL" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_HIRE_DATE_NN	C	EMPLOYEES	"HIRE_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_NN	C	EMPLOYEES	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_SALARY_MIN	C	EMPLOYEES	salary > 0				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_EMAIL_UK	U	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMAIL_UK		
HR	EMP_EMP_ID_PK	P	EMPLOYEES					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	EMP_EMP_ID_PK		
HR	EMP_DEPT_FK	R	EMPLOYEES		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_JOB_FK	R	EMPLOYEES		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	EMP_MANAGER_FK	R	EMPLOYEES		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	DEPT_MGR_FK	R	DEPARTMENTS		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMPLOYEE_NN	C	JOB_HISTORY	"EMPLOYEE_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_START_DATE_NN	C	JOB_HISTORY	"START_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_END_DATE_NN	C	JOB_HISTORY	"END_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_JOB_NN	C	JOB_HISTORY	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_DATE_INTERVAL	C	JOB_HISTORY	end_date > start_date				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMP_ID_ST_DATE_PK	P	JOB_HISTORY					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29	HR	JHIST_EMP_ID_ST_DATE_PK		
HR	JHIST_JOB_FK	R	JOB_HISTORY		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_EMP_FK	R	JOB_HISTORY		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	JHIST_DEPT_FK	R	JOB_HISTORY		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			2014-05-29				
HR	SYS_C004102	O	EMP_DETAILS_VIEW					ENABLED	NOT DEFERRABLE	IMMEDIATE	NOT VALIDATED	GENERATED NAME			2014-05-29				
HR	SYS_C007121	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2020-10-08	HR	SYS_C007121		
*/


-- ���� �߰�
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007121	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			2020-10-08	HR	SYS_C007121		


--�� ���������� ������ �÷� Ȯ��(��ȸ)
SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007121	TBL_TEST1	COL1	1


--�� USER_CONSTRAINTS �� USER_CONS_COLUMNS �� �������
--   ���������� ������ ������, �������Ǹ�, ���̺��, �������� ����, �÷��� �׸��� ��ȸ�Ѵ�.
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>>
/*
HR	REGION_ID_NN	REGIONS	C	REGION_ID
HR	REG_ID_PK	REGIONS	P	REGION_ID
HR	COUNTRY_ID_NN	COUNTRIES	C	COUNTRY_ID
HR	COUNTRY_C_ID_PK	COUNTRIES	P	COUNTRY_ID
HR	COUNTR_REG_FK	COUNTRIES	R	REGION_ID
HR	LOC_ID_PK	LOCATIONS	P	LOCATION_ID
HR	LOC_CITY_NN	LOCATIONS	C	CITY
HR	LOC_C_ID_FK	LOCATIONS	R	COUNTRY_ID
HR	DEPT_ID_PK	DEPARTMENTS	P	DEPARTMENT_ID
HR	DEPT_NAME_NN	DEPARTMENTS	C	DEPARTMENT_NAME
HR	DEPT_MGR_FK	DEPARTMENTS	R	MANAGER_ID
HR	DEPT_LOC_FK	DEPARTMENTS	R	LOCATION_ID
HR	JOB_ID_PK	JOBS	P	JOB_ID
HR	JOB_TITLE_NN	JOBS	C	JOB_TITLE
HR	EMP_EMP_ID_PK	EMPLOYEES	P	EMPLOYEE_ID
HR	EMP_LAST_NAME_NN	EMPLOYEES	C	LAST_NAME
HR	EMP_EMAIL_NN	EMPLOYEES	C	EMAIL
HR	EMP_EMAIL_UK	EMPLOYEES	U	EMAIL
HR	EMP_HIRE_DATE_NN	EMPLOYEES	C	HIRE_DATE
HR	EMP_JOB_NN	EMPLOYEES	C	JOB_ID
HR	EMP_JOB_FK	EMPLOYEES	R	JOB_ID
HR	EMP_SALARY_MIN	EMPLOYEES	C	SALARY
HR	EMP_MANAGER_FK	EMPLOYEES	R	MANAGER_ID
HR	EMP_DEPT_FK	EMPLOYEES	R	DEPARTMENT_ID
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	C	EMPLOYEE_ID
HR	JHIST_EMP_FK	JOB_HISTORY	R	EMPLOYEE_ID
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	P	EMPLOYEE_ID
HR	JHIST_START_DATE_NN	JOB_HISTORY	C	START_DATE
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	C	START_DATE
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	P	START_DATE
HR	JHIST_END_DATE_NN	JOB_HISTORY	C	END_DATE
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	C	END_DATE
HR	JHIST_JOB_NN	JOB_HISTORY	C	JOB_ID
HR	JHIST_JOB_FK	JOB_HISTORY	R	JOB_ID
HR	JHIST_DEPT_FK	JOB_HISTORY	R	DEPARTMENT_ID
HR	SYS_C007121	TBL_TEST1	P	COL1
*/

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST1';
--==>> HR	SYS_C007121	TBL_TEST1	P	COL1


--�� PK ���� �ǽ�(�� ���̺� ������ ����)
CREATE TABLE TBL_TEST2
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1) -- �������� ����
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

-- ������ �Է�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'TEST');      --> ���� �߻�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(1, 'ABCD');      --> ���� �߻�
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1) VALUES(4);                    --> ���� �߻�
INSERT INTO TBL_TEST2(COL2) VALUES('STUDY');              --> ���� �߻�(COL1�� NULL)
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES(NULL, NULL);     --> ���� �߻�

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	TEST
2	ABCD
3	(NULL)
4	(NULL)
5	ABCD
*/

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST2';
--==>> HR	TEST2_COL1_PK	TBL_TEST2	P	COL1


--�� PK ���� �ǽ�(�� ���� �÷� PK ����)
CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.


-- ������ �Է�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST'); --> ���� �߻�
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'ABCD'); --> ���� �����̸Ӹ� Ű�� ��� ó���ȴ�.
                                                     --  �����̸Ӹ� Ű�� ���̺�� �ϳ��� ��������
                                                     -- �׷��Ƿ� �����̸Ӹ� Ű�� ���� 2���� �ƴϴ�.
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);   --> ���� �߻�(�����̸Ӹ� Ű�� NULL �Ұ���)
INSERT INTO TBL_TEST3(COL1) VALUES(4);               --> ���� �߻�        
INSERT INTO TBL_TEST3(COL1) VALUES(4);               --> ���� �߻�
INSERT INTO TBL_TEST3(COL2) VALUES('STUDY');         --> ���� �߻�(COL1�� NULL)
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL);--> ���� �߻�

COMMIT; 
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_TEST3;
--==>> 
/*
1	ABCD
1	TEST
2	ABCD
5	ABCD
*/

--�� PK ���� �ǽ�(�� ���̺� ���� ���� �������� �߰� ����)
CREATE TABLE TBL_TEST4
( COL1  NUMBER(5)
, COL2  VARCHAR2(30)
);
--==>> Table TBL_TEST4��(��) �����Ǿ����ϴ�.

--�� �̹� �������(�����Ǿ�) �ִ� ���̺�
--   �ο��Ϸ��� ���������� ������ �����Ͱ� ���ԵǾ� ���� ���
--   �ش� ���̺� ���������� �߰��ϴ� ���� �Ұ����ϴ�.


-- �������� �߰�
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4��(��) ����Ǿ����ϴ�.


SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1




