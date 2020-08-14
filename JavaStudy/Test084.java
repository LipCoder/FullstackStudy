/*=======================================================
	 ���� �迭 ����
	 - �迭�� �⺻�� Ȱ��
=========================================================*/

// ����ڷκ��� ó�� �Է¹��� �ο� �� ��ŭ�� 
// �л� �̸��� ��ȭ��ȣ�� �Է¹ް�
// �Է¹��� ������ ��ü ����ϴ� ���α׷��� �����Ѵ�.
// ��, �迭�� Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// �Է� ó���� �л� �� �Է�(��, 1~10) : 27
// �Է� ó���� �л� �� �Է�(��, 1~10) : 3
// �̸� ��ȭ��ȣ �Է�[1](���� ����) : ����� 010-1111-1111
// �̸� ��ȭ��ȣ �Է�[2](���� ����) : ������ 010-2222-2222
// �̸� ��ȭ��ȣ �Է�[3](���� ����) : ������ 010-3333-3333

// -----------------------------------
// ��ü �л� �� : 3��
// -----------------------------------
// �̸�		��ȭ��ȣ
// �����	010-1111-1111
// ������	010-2222-2222
// ������	010-3333-3333
// -----------------------------------
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;

public class Test084
{
	public static void main(String[] args)
	{
		// Scanner �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// ����ڰ� �Է��ϴ� �л� ���� ��Ƶ� ����
		int memCount = 0;
		
		do
		{
			System.out.print("�Է� ó���� �л� �� �Է�(��, 1~10) : ");
			memCount = sc.nextInt();
		}
		while (memCount < 1 || memCount > 10);
		
		// �׽�Ʈ(Ȯ��)
		//System.out.println("����ڰ� �Է��� �ο� �� : " + memCount);

		//String name1, name2, name3, ....
		// ��ȿ����

		// �̸� ���� �迭 ����
		String[] names = new String[memCount]; 

		// ��ȭ��ȣ ���� �迭 ����
		String[] tels = new String[memCount];
		//String[] tels = new String[names.length]; <= ������ ����
		

		// for(int i = 0; i < names.length; ++i)
		// for(int i = 0; i < tels.length; ++i)
		for(int i = 0; i < memCount; ++i)
		{
			System.out.printf("�̸� ��ȭ��ȣ �Է�[%d](���� ����) : ", i + 1);
			// ����� 010-1111-1111
			// ������ 010-2222-2222
			
			// �̸� -> ��ȭ��ȣ ������� �Է� �޴´�.
			names[i] = sc.next();
			tels[i] = sc.next();
		}

		// ���� ���(�̸�, ��ȭ��ȣ) ���
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.printf("��ü �л� �� : %d��\n", memCount);
		System.out.println("-----------------------------------");
		System.out.println("�̸�    ��ȭ��ȣ");

		for(int i = 0; i < memCount; i++)
		{
			System.out.printf("%4s %13s\n", names[i], tels[i]);
		}

		System.out.println("-----------------------------------");
		// my code
		/*
		Scanner sc = new Scanner(System.in);
		int numOfStudent = 0;
		String[] arrName, arrPhoneNumber;
	
		// �л� �� �Է� (���� �ȿ� ���ö�����) 
		do
		{
			System.out.print("�Է� ó���� �л� �� �Է�(��, 1~10) : ");
			numOfStudent = sc.nextInt();
		}
		while (numOfStudent < 1 || numOfStudent > 10);
			
		// �л� �� ��ŭ�� �迭 �Ҵ�
		arrName = new String[numOfStudent];
		arrPhoneNumber = new String[numOfStudent];
		
		// �л� ���� �Է�
		for(int i = 0; i < numOfStudent; ++i)
		{
			System.out.printf("�̸� ��ȭ��ȣ �Է�[%d](���� ����) : ", i + 1);
			arrName[i] = sc.next();
			arrPhoneNumber[i] = sc.next();
		}
		
		// ��� �л� ���� ���
		System.out.print("\n-----------------------------------\n");
		System.out.printf("��ü �л� �� : %d��", numOfStudent);
		System.out.print("\n-----------------------------------\n");
	
		System.out.println("�̸�\t ��ȭ��ȣ");
		for(int i = 0; i < numOfStudent; ++i)
		{
			System.out.printf("%s\t %s\n", arrName[i], arrPhoneNumber[i]);
		}
		System.out.print("-----------------------------------\n");
		*/
	}
}

/*
�Է� ó���� �л� �� �Է�(��, 1~10) : 27
�Է� ó���� �л� �� �Է�(��, 1~10) : 3
�̸� ��ȭ��ȣ �Է�[1](���� ����) : ����� 010-1111-1111
�̸� ��ȭ��ȣ �Է�[2](���� ����) : ������ 010-2222-2222
�̸� ��ȭ��ȣ �Է�[3](���� ����) : ������ 010-3333-3333

-----------------------------------
��ü �л� �� : 3��
-----------------------------------
�̸�     ��ȭ��ȣ
�����   010-1111-1111
������   010-2222-2222
������   010-3333-3333
-----------------------------------
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/