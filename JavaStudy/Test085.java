/*=======================================================
	 ���� �迭 ����
	 - �迭�� �⺻�� Ȱ��
=========================================================*/

// �� ����
// ����ڷκ��� ������ ������ ������ ������ŭ �Է¹޾�
// �Է¹��� �� �߿��� ���� ū ���� ����ϴ� ���α׷��� �ۼ��Ѵ�.
// ��, �迭�� Ȱ���Ͽ� ������ �� �ֵ��� �Ѵ�.

// ���� ��)
// �Է��� �������� ����   : 10
// ������ �Է�(���� ����) : 74 65 92 13 2 86 7 12 25 64
// >> ���� ū �� -> 92
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
public class Test085
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int numCount = 0;

		System.out.print("�Է��� �������� ���� : ");
		numCount = sc.nextInt();

		// �Է��� ������ ������ŭ �迭 �Ҵ�
		int[] arr = new int[numCount];

		System.out.print("������ �Է�(���� ����) : ");
		for(int i = 0; i < arr.length; ++i)
		{
			arr[i] = sc.nextInt();
		}
		
		// �ִ밪�� �����ϱ� ���� max�� �����Ѵ�.
		// �ּҰ��� ������ �� �� �����Ƿ� �������� ���� ���� ���� �־��ش�.
		int max = Integer.MIN_VALUE;
		for(int i = 0; i < arr.length; ++i)
		{
			if(max < arr[i]) 
				max = arr[i];
		}

		System.out.println(">> ���� ū �� -> " + max);
	}
}