/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����ڷκ��� ������ ������ �� �� �Է¹޾�
// ū ���� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �Է¹��� �� ���� ���� ���
// �ƹ��͵� ������� �ʵ��� �����Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 11
// �� ��° ���� �Է� : 22
// >> ū �� -> 22
// ����Ϸ��� �ƹ� Ű�� ��������...

// ù ��° ���� �Է� : 55
// �� ��° ���� �Է� : 4
// >> ū �� -> 55
// ����Ϸ��� �ƹ� Ű�� ��������...

// ù ��° ���� �Է� : 31
// �� ��° ���� �Է� : 31
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test035
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b;

		System.out.print("ù ��° ���� �Է� : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		b = Integer.parseInt(br.readLine());

		if(a > b)
		{
			System.out.println(">> ū �� -> " + a);
		}
		else if (a < b)
		{
			System.out.println(">> ū �� -> " + b);
		}

		// my code
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num1, num2, max;

		System.out.print("ù ��° ���� �Է� : ");
		num1 = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		num2 = Integer.parseInt(br.readLine());

		if(num1 != num2)
		{
			max = (num1 > num2) ? num1 : num2;
			System.out.println(">> ū �� -> " + max);
		}
		*/
	}
}

/*
ù ��° ���� �Է� : 10
�� ��° ���� �Է� : 30
>> ū �� -> 30
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

ù ��° ���� �Է� : 7
�� ��° ���� �Է� : 7
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/