/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
	 - Ŭ���� ����
	 - �迭 Ȱ��
	 - �������а� ��������������
=========================================================*/

// ����ڷκ��� ��, ��, ���� �Է¹޾�
// �ش� ��¥�� ������ ����ϴ� ���α׷��� �����Ѵ�.
// ��, �޷� Ŭ����(Calendar)�� ������� �ʴ´�.
// ����, Ŭ������ ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�. (WeekDay ����)
// �׸���, �迭�� ���䵵 ������� �ۼ��� �� �ֵ��� �Ѵ�.
// ���������������� ���䵵 Ȯ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// ���������� WeekDay Ŭ������ ���踦 ����
// Test102 Ŭ������ main() �޼ҵ尡 ���������� ���α׷� ����� �� �ֵ��� �Ѵ�.

// ���� ��)
// �� �� �� �Է�[���� ����] : 2020 8 19

// 2020�� 8�� 19�� -> ������
// ����Ϸ��� �ƹ� Ű�� ��������...


// 1�� 1�� 1�� -> ������
// ���� -> 366, ��� -> 365
// ���� -> 29, ��� -> 28

import java.util.Scanner;


class WeekDay
{
	// �ֿ� ���� ����
	private int y, m, d;		// --����ڰ� �Է��� ��, ��, ���� ��Ƴ� ����

	// �޼ҵ� ���� -> �Է¹ޱ�
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�� �� �� �Է�[���� ����] : ");
		y = sc.nextInt();
		m = sc.nextInt();
		d = sc.nextInt();
	}

	// �޼ҵ� ���� -> ���� �����ϱ�
	public String week()
	{
		// �� ���� ������ ��¥(�� ���� �ִ밪)�� �迭 ���·� ����
		int[] months = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		// �׽�Ʈ 
		//System.out.println(months.length);
		// --==>> 12

		// ���� �̸��� ���� �迭 ����
		String[] weekNames = {"��", "��", "ȭ", "��", "��", "��", "��"};

		// �� ���� ������ ����
		int nalsu = 0;

		// ���⿡ ���� 2���� �� �� ���
		// �Է� �⵵�� �����̶��... 2���� ������ ��¥�� 29�Ϸ� ����
		// �Է� �⵵�� ����̶��... 2���� ������ ��¥�� 28�Ϸ� ����
		if(y % 4 == 0 && y % 100 != 0 || y % 400 == 0)	// -- �����̶��...
		{
			// 2���� ������ ��¥�� 29�Ϸ� ����
			months[1] = 29;

		}
		else											// -- ����̶��...
		{
			// 2���� ������ ��¥�� 28�Ϸ� ����
			months[1] = 28;
		}

		// 1. 1�� 1�� 1�� ~ �Է¹޴� �⵵�� ���� �⵵ 12�� 13������ �� �� ���
		//					-------------
		//                       y
		//                  -------------------------
		//							y - 1

		// �Է������⵵*365 + �Է������⵵/4 - �Է������⵵/100 + �Է������⵵/400
		nalsu = (y - 1) * 365 + (y - 1) / 4 - (y - 1) / 100 + (y - 1) / 400;

		// �׽�Ʈ(Ȯ��)
		//System.out.println("�� �� : " + nalsu);
		// --==>> �� �� : 737424 (2020 8 19 �Է� ����)
		// 1. 1. 1 ~ 2019. 12. 31�� �� �� �� 

		// 2. �Է¹��� ���� ���� �� ������ �� �� ��� ��
		//    �� ��� ����� 1�� ����� �����ϴ�(���ϴ�) ����
		for(int i = 0; i < (m-1); i++)
		{
			nalsu += months[i];
		}
		// 737424 + 31 + 29 + 31 + 30 + 31 + 30 + 31

		// �׽�Ʈ(Ȯ��)
		//System.out.println("�� �� : " + nalsu);
		// --==>> �� �� : 737637 (2020 8 19 �Է� ����)
		// 1. 1. 1 ~ 2020. 7. 31�� �� �� �� 

		// 3. �Է¹��� ���� ��¥��ŭ �� �� ��� ��
		//    2�� ����� �����ϴ�(���ϴ�) ����
		nalsu += d;

		// �׽�Ʈ(Ȯ��)
		//System.out.println("�� �� : " + nalsu);
		// --==>> �� �� : 737656 (2020 8 19 �Է� ����)
		// 1. 1. 1 ~ 2020. 8. 19�� �� �� �� 

		// --------------------- ������� �����ϸ� �� �� ���� ��~!!

		// ���� �������� Ȯ���ϱ� ���� ����
		int w = nalsu % 7;		// ��ü���� % 7 == 0 -> �Ͽ���
								// ��ü���� % 7 == 1 -> ������
								// ��ü���� % 7 == 2 -> ȭ����
								// ..

		// �׽�Ʈ(Ȯ��)
		//System.out.println("���� : " + w);
		// --==>> ���� : 3 (2020 8 19 �Է� ����) -> ������

		return weekNames[w];
		// 0 -> "��"
		// 0 -> "��"
		// ..
	}

	// �޼ҵ� ���� -> ��� ����ϱ�
	public void print(String day)
	{
		System.out.printf("%d�� %d�� %d�� -> %s����\n", y, m, d, day);
	}
}

public class Test102
{
	public static void main(String[] args)
	{
		// WeekDay ��� �ν��Ͻ� ����
		WeekDay wd = new WeekDay();

		// �Է� �޼ҵ� ȣ��
		wd.input();

		// ���� ���� �޼ҵ� ȣ�� �� ��� Ȯ��
		String result = wd.week();

		// ��� �޼ҵ� ȣ��
		wd.print(result);
	}

}
/*
�� �� �� �Է�[���� ����] : 2020 8 19
2020�� 8�� 19�� -> ������
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/

// my code
/*
class WeekDay 
{
	// ����, ��� �ϼ�
	private final int NORMAL_YEAR_DAYS = 365;
	private final int LEAP_YEAR_DAYS = NORMAL_YEAR_DAYS + 1;

	// �� ���� �ϼ�
	// �迭�� 0��° ���� �����ϹǷ� 
	// �������� ���� 0��° �ڸ��� �������� �����Ѵ�.
	private final int NONE = 0;
	private final int[] monthDays = {NONE, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// ����
	private final char[] weekArr = {'��', '��', 'ȭ', '��', '��', '��', '��'};
	
	private int year, month, day;

	// ���� �ִ´�.
	private boolean input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�� �� �� �Է�[���� ����] : ");
		year = sc.nextInt();
		month = sc.nextInt();
		day = sc.nextInt();

		// �߸��� �Է� check
		if(year < 0) return false;
		if(month < 1 || month > 12) return false;
		if(day < 1 || day > dayCountOfMonth(month)) return false;

		return true;
	}

	// ������ ����Ѵ�.
	private char calculateWeek()
	{
		// 1�� 1�� 1�Ϻ��� ���ϴ� year month day������
		// �ϼ��� ��� ���� ����
		int passingDays = 0;

		// year���� ������ �귶���� ���
		for(int i = 1; i < year; ++i)
		{
			if(isLeapYear(i))
				passingDays += LEAP_YEAR_DAYS;
			else
				passingDays += NORMAL_YEAR_DAYS;
		}
		
		// month���� ������ �귶���� ���
		for(int i = 1; i < month; ++i)
		{
			passingDays += dayCountOfMonth(i);
		}
		
		// day���� ������ �귶���� ���
		passingDays += day;

		// �˸��� ������ ����Ѵ�.
		return weekArr[passingDays % weekArr.length];
	}
	
	// �������� �Ǻ��Ѵ�.
	private boolean isLeapYear(int year)
	{
		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	}

	// month�� ������ �ִ��� ����Ѵ�.
	private int dayCountOfMonth(int month)
	{
		// 2���� ���� ���ο� ���� �ϼ��� �ٸ��Ƿ� ���� ���
		if(month == 2)
			return (isLeapYear(year)) ? monthDays[month] + 1 : monthDays[month];
		else
			return monthDays[month];
	}
	
	// ���
	private void print(char week)
	{
		System.out.printf("%d�� %d�� %d�� -> %c����\n", year, month, day, week);
	}

	public void logic()
	{
		if(!input())
		{
			System.out.println("�߸� �Է��Ͽ����ϴ�!");
			return;
		}
		char week = calculateWeek();
		print(week);
	}
}

public class Test102
{
	public static void main(String[] args)
	{
		WeekDay w = new WeekDay();
		w.logic();
	}
}
*/