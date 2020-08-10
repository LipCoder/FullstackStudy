/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� �������� ���� ó�� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, if ���ǹ��� Ȱ���Ͽ� ó���� �� �ֵ��� �ϸ�,
// ���� ����� ���ǻ� ���������� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 10
// �� ��° ���� �Է� : 14
// ������ �Է� [+ - * /] : +

// >> 10 + 14 = 24
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test034
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		char oper;
		int left, right, result;

		System.out.print("ù ��° ���� �Է� : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("������ �Է� [+ - * /] : ");
		oper = (char)System.in.read();
		//oper = br.readLine().charAt(0);

		// �ι�° ���
		// int oper;
		// oper = System.in.read();

		if(oper == '+')
		{
			// ù��° ���
			//System.out.printf("%d + %d = %d\n", left, right, left + right);
			// ����° ���
			result = left + right;
			System.out.printf("%d + %d = %d\n", left, right, result);
		}
		else if(oper == '-')
		{
			result = left - right;
			System.out.printf("%d - %d = %d\n", left, right, result);
		}
		else if(oper == '*')
		{
			result = left * right;
			System.out.printf("%d * %d = %d\n", left, right, result);
		}
		else if(oper == '/')
		{
			if(right == 0)
			{
				System.out.println("0�� ���� �� �����ϴ�.");
			}
			else
			{
				result = (int)(left / (double)right);
				System.out.printf("%d / %d = %d\n", left, right, result);
			}
		}
		else
		{
			System.out.println("�߸��� ������ �Դϴ�.");
		}

		// ����° ���
		//System.out.printf("\n>> %d %c %d = %d\n", left, oper, right, result);
	}
}

/*
ù ��° ���� �Է� : 10
�� ��° ���� �Է� : 30
������ �Է� [+ - * /] : *
10 * 30 = 300
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
