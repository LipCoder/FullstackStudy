/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Calendar Ŭ����
=========================================================*/

/*
�� java.util.Calendar Ŭ������
   ��¥�� �ð��� ��ü �𵨸�ȭ �� Ŭ������
   ��, ��, ��, ����, ��, ��, �� ������
   �ð� �� ��¥�� ���õ� ������ �����Ѵ�.
   �׸���, Calendar Ŭ������ �߻� Ŭ�����̹Ƿ� ���� ��ü�� ������ �� ������
   �������� �޼ҵ� ������ Calendar Ŭ������ ���� Ŭ������ 
   GregorianCalendar Ŭ������ ���ǵǾ� �ִ�.

   �ý������κ��� ���� �ý��� �ð� ������ ���� ��
   getInstacne()��� ����(static) �޼ҵ带 �̿��Ͽ� ��ü�� ������ �� �ִ�.
   ������ Calendar Ŭ���� ��ü�� �ý����� ���� ��¥�� �ð� ������ ������,
   �� ��ü�� �����Ǹ� ���� �ִ� �ð� ��������
   get() �޼ҵ带 �̿��Ͽ� ���� ������(�����) �� �ִ�.

   getInstance() �޼ҵ�� ���������� GregorianCalendar ��ü�� �����Ͽ�
   �����ֱ� ������ GregorianCalendar ��ü�� ���� �����Ͽ� �ð� ������ 
   ���� ���� �ִ�.
*/

// ����ڷκ��� ��, ���� �Է¹޾�
// �޷��� �׷��ִ�(����ϴ�) ���α׷��� �����Ѵ�.
// ��, ����޷��� �ƴ϶� Calendar Ŭ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// (API Document ���� ����~!!!)

// ���� ��)
// ���� �Է� : 0
// ���� �Է� : 2020
// ��   �Է� : -2
// ��   �Է� : 16
// ��   �Է� : 8
/*
	[ 2020�� 8�� ]

  ��  ��  ȭ  ��  ��  ��  ��
============================
                           1
   2   3   4   5   6   7   8
   9  10  11  12  13  14  15
  16  17  18  19  20  21  22
  23  24  25  26  27  28  29
  30  31
============================
*/

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Calendar;

public class Test148
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader Ŭ���� ��� �ν��Ͻ� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// Calendar Ŭ���� ��� �ν��Ͻ� ����
		Calendar cal = Calendar.getInstance();

		// �ֿ� ���� ����
		int y, m;	//-- ��, ��
		int w;		//-- ����
		int i;		//-- ���� ����

		do
		{
			System.out.print("���� �Է� : ");
			y = Integer.parseInt(br.readLine());
		}
		while (y < 1);

		do
		{
			System.out.print("��   �Է� : ");
			m = Integer.parseInt(br.readLine());
		}
		while (m < 1 || m > 12);
		
		// ����ڷκ��� �Է¹��� ��(y), ��(m)�� �̿��Ͽ�
		// �޷� ��ü�� ��¥ ����
		cal.set(y, m - 1, 1);
		//-- �� ���� �� �Է°�(m)�� �״�� ����ϴ� ���� �ƴ϶�
		//   �Է°����� 1�� �� ������ ���� �����ؾ� �Ѵ�.

		// ���õ� �޷� ��ü�κ��� ���� ��������
		w = cal.get(Calendar.DAY_OF_WEEK);

		// �׽�Ʈ(Ȯ��)
		System.out.println(w);
		//--==>> ���� �Է� : 2020
		//		 ��   �Է� : 8
		//		 7 -> 2020�� 8�� ���� -> ����� -> 2020�� 8�� 1�� -> �����
		
		// Calendar Ŭ������ [getActualMaximum()] �޼ҵ� check~!!!
		// �׽�Ʈ(Ȯ��)
		//System.out.println(cal.getActualMaximum(Calendar.DATE));
		// Calendar.DAY_OF_MONTH �� ������ �ɷ��־
		// �߸��� ������ �װ��� Ȯ���� ���� ����.
		// �׷��� �ǵ����̸� Calendar.DATE�� �������

		// ��� ��� -> �޷� �׸���
		System.out.println();
		System.out.println("\t[" + y + "�� " + m + "�� ]\n");
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("============================");

		// ���� �߻�
		for(i = 1; i < w; i++)
		{
			System.out.print("    ");
		}
		
		// �׽�Ʈ(Ȯ��)
		//System.out.printf("%4d", 1);
		
		// Calendar Ŭ������ [getActualMaximum()] �޼ҵ� Ȱ��
		for(i = 1; i <= cal.getActualMaximum(Calendar.DATE); i++)
		{
			System.out.printf("%4d", i);
			w++;		   //-- �ݺ����� �����ϸ� ��¥�� ������ �� ����
						   //   ���ϵ� �Բ� ������ ���� �� �ֵ��� ó��

			if(w % 7 == 1) //-- ������ ������ �Ͽ����� �� �� ����... ���� �� ���
				System.out.println();		//-- ����
		}

		if(w % 7 != 1)
			System.out.println();			//-- ����

		System.out.println("============================");
	}
}

/*
import java.util.Scanner;
import java.util.Calendar;
import java.util.GregorianCalendar;

class MyCalendar
{
	private final char CHAR_NULL = '\0';

	private int y, m;
	private Calendar c = new GregorianCalendar();

	private int GetMonth() { return m + 1; }
	private void SetMonth(int m) { this.m = m - 1; }

	private void input()
	{
		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("���� �Է� : ");
			y = sc.nextInt();
		}
		while (y <= 0);

		do
		{
			System.out.print("��   �Է� : ");
			SetMonth(sc.nextInt());
		}
		while (GetMonth() < 1 || GetMonth() > 12);

		c.set(y, m, 1);
	}

	private void print()
	{
		System.out.printf("\n\t[ %d�� %d�� ]\t\n\n", y, GetMonth());
		System.out.println("  ��  ��  ȭ  ��  ��  ��  ��");
		System.out.println("============================");
		printDays();
		System.out.println("============================");
	}

	private void printDays()
	{
		// ���� ���� ���
		int start = c.get(Calendar.DAY_OF_WEEK);	// 1 ~ 7
		for(int i = 1; i < start; ++i)
			System.out.printf("%4c", CHAR_NULL);

		// ��¥ ���
		int limit = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		int lnCheck = start - 1;
		
		for(int i = 1; i <= limit; ++i)
		{
			System.out.printf("%4d", i);
		
			if(++lnCheck % 7 == 0)
				System.out.println();
		}
		
		// ���࿩�� Ȯ�� �� ����
		if((lnCheck % 7) != 0)
			System.out.println();
	}

	public void logic()
	{
		input();
		print();
	}
}

public class Test148
{
	public static void main(String[] args)
	{
		MyCalendar mc = new MyCalendar();
		mc.logic();
	}
}
*/