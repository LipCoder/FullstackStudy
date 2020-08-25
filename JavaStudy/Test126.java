/*=======================================================
      ���� Ŭ���� ��� ����
	  - �������̽�(Interface)
=========================================================*/
 
 // �� �ǽ� ����
 // ���� ó�� ���α׷��� �����Ѵ�.
 // ��, �������̽��� Ȱ���� �� �ֵ��� �Ѵ�.

 // ���� ��)
 // �ο� �� �Է�(1~10) : 2
 // 1��° �л��� �й� �̸� �Է�(���� ����) : 2012170 ������
 // ���� ���� ���� ���� �Է�   (���� ����) : 90 100 85
 // 2��° �л��� �й� �̸� �Է�(���� ����) : 2012112 ��ȫ��
 // ���� ���� ���� ���� �Է�   (���� ����) : 85 70 65
 
 // 2012170 ������    90  100   85    275   91 
 //	                  ��   ��   ��  
 // 2012112 ��ȫ��    85   70   65    220   73
 //                   ��   ��   �� 
 // ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;

// �Ӽ��� �����ϴ� Ŭ����   -> �ڷ��� Ȱ��
class Record
{
	String hak, name;		//-- �й�, �̸�
	int kor, eng, mat;		//-- ����, ����, ���� ����
	int tot, avg;			//-- ����, ���(���ǻ� ���� ó��)
}

// �������̽�
interface Sungjuk
{
	public void set();		//-- �ο� �� ����
	public void input();	//-- �� ������ �Է�
	public void print();	//-- ��� ���
}

// ���� �ذ� �������� �����ؾ� �� Ŭ����
class SungjukImpl implements Sungjuk
{
	private Record[] arr;
	
	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		int count;

		do
		{
			System.out.print("�ο� �� �Է�(1~10) : ");
			count = sc.nextInt();
		}
		while (count < 1 || count > 10);
				
		arr = new Record[count];

		for(int i = 0; i < arr.length; ++i) 
			arr[i] = new Record();

	}
	
	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		int count = 1;
		
		for(Record info : arr)
		{
			System.out.print((count++) + "��° �л��� �й� �̸� �Է�(���� ����) : ");
			info.hak = sc.next();
			info.name = sc.next();

			System.out.print("���� ���� ���� ���� �Է�   (���� ����) : ");
			info.kor = sc.nextInt();
			info.eng = sc.nextInt();
			info.mat = sc.nextInt();

			info.tot = info.kor + info.eng + info.mat;
			info.avg = info.tot / 3;
		}
	}
	
	@Override
	public void print()
	{
		System.out.println();
		for(Record info : arr)
		{
			String grade = makeGradeInfo(info);

			System.out.printf("%s %s  %4d %4d %4d  %5d %5d\n", 
						info.hak, info.name, info.kor, info.eng, info.mat, info.tot, info.avg);
			System.out.println(grade);
		}
	}

	private String makeGradeInfo(Record info)
	{
		String result = "";

		// (�й� + ���� + �̸� * 2 + ����) ��ŭ ���� �����  
		int spaceSize = info.hak.length() + 1 + (info.name.length() * 2) + 1;
		for(int i = 0; i < spaceSize; ++i)
			result += ' ';
		
		int[] score = {info.kor, info.eng, info.mat};
			
		for(int s : score)
		{
			if(s >= 90)		 result += "   ��";
			else if(s >= 80) result += "   ��";
			else if(s >= 70) result += "   ��";
			else if(s >= 60) result += "   ��";
			else			 result += "   ��";
		}

		return result;
	}
}

public class Test126
{
	public static void main(String[] args)
	{
		Sungjuk ob;

		// ���� �ذ� �������� �ۼ��ؾ� �� ob ����
		ob = new SungjukImpl();

		ob.set();
		ob.input();
		ob.print();
	}
}

/*
�ο� �� �Է�(1~10) : 2
1��° �л��� �й� �̸� �Է�(���� ����) : 2012170 ������
���� ���� ���� ���� �Է�   (���� ����) : 90 100 85
2��° �л��� �й� �̸� �Է�(���� ����) : 2012112 ��ȫ��
���� ���� ���� ���� �Է�   (���� ����) : 85 70 65

2012170 ������    90  100   85    275    91
                  ��   ��   ��
2012112 ��ȫ��    85   70   65    220    73
                  ��   ��   ��
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/