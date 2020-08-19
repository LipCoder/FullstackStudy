/*=======================================================
 ���� Ŭ������ �ν��Ͻ� ����
 - Ŭ������ �ν��Ͻ� Ȱ��
=========================================================*/

// �л����� ��������, ��������, ���������� �Է¹޾�
// ����, ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, Ŭ������ ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// ����, �� �������� �迭�� ���������� Ȱ���� �� �ֵ��� �Ѵ�.

// ���α׷��� �����ϴ� Ŭ����
// 1. Record Ŭ����
//	  -> �Ӽ��� �����ϴ� Ŭ������ ������ ��~!!!
//
// 2. Sungjuk Ŭ����
//    -> �ο� ���� �Է¹޾�, �Է¹��� �ο� �� ��ŭ
//		 �̸�, ��������, ��������, ���������� �Է¹ް�
//       ������ ����� �����ϴ� Ŭ������ ������ ��~!!!
//		  * �Ӽ� : �ο���, Record ������ �迭
//		  * ��� : �ο��� �Է�, �� ������ �Է�, ���� �� ��� ����, ��� ���
//
// 3. Test104 Ŭ����
//	  -> main() �޼ҵ尡 �����ϴ� �ܺ� Ŭ������ ������ ��~!!!

// ���� ��)
// �ο� �� �Է�(1~100) : 102
// �ο� �� �Է�(1~100) : -10
// �ο� �� �Է�(1~100) : 3

// 1��° �л��� �̸� �Է� : ��ȫ��
// ���� ���� : 90
// ���� ���� : 80
// ���� ���� : 70

// 2��° �л��� �̸� �Է� : ��¹�
// ���� ���� : 82
// ���� ���� : 72
// ���� ���� : 62

// 3��° �л��� �̸� �Է� : �̿���
// ���� ���� : 98
// ���� ���� : 88
// ���� ���� : 78

// ��ȫ��  90  80  70  240  xx.xx  2
// ��¹�  82  72  62  xxx  xx.xx  3
// �̿���  98  88  78  xxx  xx.xx  1

// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;

class Record
{
	String name;
	int kor, eng, math, total, rank;
	double avg;
}

class Sungjuk
{
	private Scanner sc = new Scanner(System.in);
	private int count;
	private Record[] students;

	// �ο��� �Է�
	public void input()
	{
		do
		{
			System.out.print("�ο� �� �Է�(1~100) : ");
			count = sc.nextInt();
		}
		while (count < 1 || count > 100);
		
		// ���ڵ带 ��� �迭 �޸� �Ҵ�
		// �� ���ڵ� �迭 ������ �ν��Ͻ� ����
		students = new Record[count];
		for(int i = 0; i < count; ++i)
		{
			students[i] = new Record();
		}
	}

	// ������ �Է�
	public void inputDetail()
	{
		for(int i = 0; i < count; ++i)
		{
			System.out.println();
			System.out.printf("%d��° �л��� �̸� �Է� : ", i + 1);
			students[i].name = sc.next();

			System.out.print("���� ���� : ");
			students[i].kor = sc.nextInt();

			System.out.print("���� ���� : ");
			students[i].eng = sc.nextInt();

			System.out.print("���� ���� : ");
			students[i].math = sc.nextInt();
		}
	}
	
	// ���� �� ��� ����
	public void calcScore()
	{
		for(int i = 0; i < count; ++i)
		{
			students[i].total = students[i].kor + students[i].eng + students[i].math;
			students[i].avg = students[i].total / 3.0;
		}
	}

	// ��� ����
	public void calcRank()
	{
		for(int i = 0; i < count; ++i)
		{
			// �� �л� ����� 1������ �ְ�
			// �ٸ� �л� �������� �������ٸ� ����� ����߸���.
			students[i].rank = 1;
			for(int j = 0; j < count; ++j)
			{
				// ���� �л��� ������ �ʰ� �Ѿ��.
				if(i == j) continue;	
				
				if(students[i].total < students[j].total) 
					++students[i].rank;
			}
		}
	}
	
	// ���
	public void print()
	{
		System.out.println();
		for(int i = 0; i < count; ++i)
		{
			Record r = students[i];
			System.out.printf("%s  %d  %d  %d  %d  %.2f  %d\n",
							  r.name, r.kor, r.eng, r.math, r.total, r.avg, r.rank);
		}
	}
}

public class Test104
{
	public static void main(String[] args)
	{
		Sungjuk sj = new Sungjuk();

		sj.input();
		sj.inputDetail();
		sj.calcScore();
		sj.calcRank();
		sj.print();
	}
}