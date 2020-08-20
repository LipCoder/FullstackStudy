/*=======================================================
 ���� ����޷� ����
=========================================================*/

// ���� ��)
// ���������� �Է��ϼ��� : 2021
// �������� �Է��ϼ���   : 1

/*
	   [ 2021�� 1�� ]

  ��  ��  ȭ  ��  ��  ��  ��
============================
                       1   2
   3   4   5   6   7   8   9
  10  11  12  13  14  15  16
  17  18  19  20  21  22  23
  24  25  26  27  28  29  30
  31
============================
����Ϸ��� �ƹ� Ű�� ��������...
*/

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

//������ Ǯ��
public class Test108
{
	public static void main(String[] args) throws IOException
	{
     BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

      //�迭 ���� �� �ʱ�ȭ
      // -- �� ���� ����ִ� ������ ��¥(�� ���� �ִ� ��¥)
      int[] days = {31,28,31,30,31,30,31,31,30,31,30,31};

      //�׽�Ʈ(Ȯ��)
      //System.out.println(days.length);

      //�ֿ� ���� ����
      int nalsu=0, y=0,m=0,w=0;         //--�� ��,��,��,����

      do
      {
         System.out.print("���⵵���� �Է��ϼ��� : ");
         y = Integer.parseInt(br.readLine());
         System.out.print("�������� �Է��ϼ���   : ");
         m = Integer.parseInt(br.readLine());
      }
      while (m<1 || m>12);
      // -- �Է¹��� ���� 1���� �۰ų� 12���� Ŭ ���... �ٽ� �Է¹��� �� �ֵ��� ó��
      //-----------------������� �����ϸ� ��ȿ�� ��, ���� �Է��� ����!!

      //�Է¹��� �⵵�� �ش��ϴ� 2���� ������ �� ���
      if(y%4==0 && y%100!=0 || y%400==0)      //--�����̶��...
         days[1]=29;
      //--else������
      //   ���� days �迭�� 1��° ���(2��)�� 28�� �����Ǿ� �ִ�
      //  �����̱� ������ ���� ������ ������ �ȴ�.

      //1�� 1�� 1�� ~ �Է¹��� �⵵ �����⵵�� 12�� 31�ϱ�����
      //�� �� ���
      nalsu = (y-1)*365 + (y-1)/4 - (y-1)/100 + (y-1)/400;

      //�Է¹��� �⵵(�ش�⵵)�� 1��1�� ~ �Է��� ���� ���� ��������
      //�� �� ���� ����
      for(int i=0;i<(m-1);i++)
      {
         nalsu += days[i];
      }

      //----------������� �����ϸ� �Է³� �Է¿��� �Ϸ� �� �� �� ���� ����

      //�Է¹��� ���� 1���� �� �� ���� ����
      nalsu += 1;         //++nalsu;

      //-----------------������� �����ϸ� ��� �� ���� ���� ���� �Ϸ�!!

      //���� ����
      //: �Է¹��� ���� 1���� ���� �������� Ȯ���ϱ� ���� ����
      //   �� ������ �����ؾ� �޷¿��� 1���� ��� ��ġ���� �׸��� �����ؾ� �ϴ���
      //  �� �� �ְ� �Ǵ� ��Ȳ.
      w = nalsu % 7;      //0:

      //�׽�Ʈ(Ȯ��)
      //System.out.println(w);

      //---------------������� �����ϸ� �ش� �� �ش� �� 1����
      //             ���� �������� Ȯ�� �Ϸ�~!

      //���(�޷� �׸���)
      System.out.println();
      System.out.printf("\t[ %d�� %d�� ]\n",y,m);
      System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
      System.out.println("=============================");

      //Ư�� ���Ϻ��� 1���� ����� �� �ֵ��� ���� �߻�(����)
      for(int i=1;i<=w;i++)
      {
         System.out.print("    ");      //���� 4ĭ �߻�
      }

      //�׽�Ʈ(Ȯ��)
      //System.out.printf("%4d",1);
	  for(int i = 1; i <= days[m-1]; i++)
	  {
		  System.out.printf("%4d", i);	// 1 2 3 4 5 ...
		  w++;							// 7 8 9 10  ...

		  if(w%7 == 0)
		  {
			  System.out.println(); // ����
		  }
	  }

	  // ���� ������ ��¥�� ��� ������ ��� ä���� ���
	  // �̹� �Ͽ��� ������ �̷������ ������
	  // �� ��쿡�� �߰� ������ ���� �ʵ��� ó��
	  if(w % 7 != 0)
		  System.out.println();

	  System.out.println("=============================");
   }
}

/*
class MyCalendar
{
	private final int[] months = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	private int y, m;

	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("���������� �Է��ϼ��� : ");
			y = sc.nextInt();
		}
		while (y < 0);
		
		do
		{
			System.out.print("�������� �Է��ϼ���   : ");
			m = sc.nextInt();
		}
		while (m < 1 || m > 13);
	}
	
	// ��� (�޷� �׸���)
	public void print()
	{
		System.out.println();
		System.out.printf("\t[ %d�� %d�� ]\n\n", y, m);
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("============================");
		
		printDays();
		
		System.out.println("============================");
	}
	
	private void printDays()
	{
		
		int start = calcWeekStart();
		int limit = getMonth(m);
		
		// ��¥��    ���� üũ��
		int day = 1, check = 0;

		for(int i = 0; i < 6; ++i)
		{
			for(int j = 0; j < 7; ++j)
			{
				// �ش� ���� ������ �ϼ����� ����ϸ� ������ �Լ� ����
				if(day > limit) 
				{
					System.out.println();
					return;
				}
	
				// ��¥ ���� ������ ���� ���
				if(check < start)
					System.out.printf("%4c", 0);
				else
					System.out.printf("%4d", day++);

				++check;
			}
			System.out.println();
		}
	}

	private int calcWeekStart()
	{
		int stackDays = 0;

		int yearGap = y - 1;
		stackDays = (yearGap * 365) + (yearGap / 400) - (yearGap / 100) + (yearGap / 4);

		for(int i = 1; i < m; ++i)
			stackDays += getMonth(i);

		stackDays += 1;

		return stackDays % 7;
	}

	private boolean isLeapYear(int year)
	{
		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	}
	
	private int getMonth(int month)
	{
		if(isLeapYear(y)) 
			months[2] = 29;

		return months[month];
	}
}

public class Test108
{
	public static void main(String[] args)
	{
		MyCalendar mc = new MyCalendar();
		
		mc.input();
		mc.print();
	}
}
*/
