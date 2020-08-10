/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����ڷκ��� ������ ���� �� ���� �Է¹޾�
// ���� ������ ū �� ������ ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 112
// �� ��° ���� �Է� : 8
// �� ���� ���� �Է� : 21

// >> ���� ��� : 8 21 112
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b, c;		// ����ڰ� �Է��ϴ� ������ ������ ��Ƶ� ����
		int tmp;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		c = Integer.parseInt(br.readLine());


		if(a > b) // ù ��° ����(a)�� �� ��° ����(b)���� ũ�ٸ�...
		{
			// a�� b�� �ڸ��� �ٲ۴�.
			a = a ^ b;
			b = b ^ a;
			a = a ^ b;
		}

		if(a > c)	// ù ��° ����(a)�� �� ��° ����(c)���� ũ�ٸ�...
		{
			// a�� c�� �ڸ��� �ٲ۴�.
			a = a ^ c;
			c = c ^ a;
			a = a ^ c;
		}

		if(b > c)	// �� ��° ����(b)�� �� ��° ����(c)���� ũ�ٸ�...
		{
			// b�� c�� �ڸ��� �ٲ۴�.
			b = b ^ c;
			c = c ^ b;
			b = b ^ c;
		}

		// ���� ��� ��� -> a, b, c ������� ���
		System.out.printf("���� ��� : %d %d %d\n", a, b, c);

		// my code
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b, c;
		int first, second, third;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		c = Integer.parseInt(br.readLine());

		// 1 
		third = (a > b) ? (a > c ? a : c) : (b > c ? b : c);	// �ִ밪
		first = (a < b) ? (a < c ? a : c) : (b < c ? b : c);	// �ּҰ�
		second = (a < b) ? (a > c ? a : (b < c ? b : c)) : (b > c ? b : (a < c ? a : c));
		
		// 2
		if(a < b)
		{
			if(b < c)	
			{
				first = a; second = b; third = c;			
			}	
			else
			{
				if(a < c)	// ���� a, c�� ������ �ʾ����Ƿ�
				{
					first = a; second = c; third = b;
				}
				else
				{
					first = c; second = a; third = b;
				}
			}
		}
		else // if(a > b)
		{
			if(a < c)
			{
				first = b; second = a; third = c;			
			}	
			else
			{
				if(b < c)  // ���� b, c�� ������ �ʾ����Ƿ�
				{
					first = b; second = c; third = a;
				}
				else
				{
					first = c; second = b; third = a;
				}
			}
		}
		

		System.out.printf("���� ��� : %d %d %d\n", first, second, third);
		*/
	}
}

/*
ù ��° ���� �Է� : 5
�� ��° ���� �Է� : 2
�� ��° ���� �Է� : 3
���� ��� : 2 3 5
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

ù ��° ���� �Է� : 55
�� ��° ���� �Է� : 55
�� ��° ���� �Է� : 11
���� ��� : 11 55 55
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/