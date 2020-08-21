/*=======================================================
      ���� ����(sort) �˰��� ����
=========================================================*/

// ����ڷκ��� ���� �л��� ���� �����͸� �Է¹޾�
// ������ ���� ������ ����� �ο��Ͽ� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �迭�� ���� �˰����� Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.

// ���� ��)
// �ο� �� �Է� : 5
// �̸� ���� �Է�(1) : ���ΰ� 90
// �̸� ���� �Է�(2) : �ڴٺ� 80
// �̸� ���� �Է�(3) : ����� 85
// �̸� ���� �Է�(4) : ������ 75
// �̸� ���� �Է�(5) : ������ 95
/*
---------------
1�� ������ 95
2�� ���ΰ� 90
3�� ����� 85
4�� �ڴٺ� 80
5�� ������ 75
---------------
����Ϸ��� �ƹ� Ű�� ��������...
*/

import java.util.Scanner;

class Info
{
	String name;
	int score;
	int rank;
}

class Program
{
	private Info[] arr;

	private void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�ο� �� �Է� : ");
		int count = sc.nextInt();

		arr = new Info[count];
	
		for(int i = 0 ; i < arr.length; ++i)
		{
		    arr[i] = new Info();
			
			System.out.printf("�̸� ���� �Է�(%d) : ", i + 1);
			arr[i].name = sc.next();
			arr[i].score = sc.nextInt();
		}
	}

	private void sort()
	{
		boolean flag;
		int pass = 0;

		do
		{
			flag = false;
			++pass;

			for(int i = 0; i < arr.length - pass; ++i)
			{
				if(arr[i].score < arr[i + 1].score)
				{
					Info temp = arr[i];
					arr[i] = arr[i + 1];
					arr[i + 1] = temp;

					flag = true;
				}
			}
		}
		while (flag);
	}

	private void setRank()
	{
		int rank = 1;
		for(Info inst : arr)
		{
			inst.rank = rank++;
		}
	}

	private void print()
	{
		System.out.println();
		System.out.println("---------------");

		for(Info inst : arr)
		{
			System.out.printf("%d�� %s %d\n", inst.rank, inst.name, inst.score);
		}

		System.out.println("---------------");
	}

	public void logic()
	{
		input();
		sort();
		setRank();
		print();
	}
}

public class Test114
{
	public static void main(String[] args)
	{
		Program p = new Program();
		p.logic();
	}
}