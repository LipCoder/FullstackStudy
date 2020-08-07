/*=======================================================
	 ���� �ڹ� �⺻ ���α׷��� ����
	 - ��� ������
	 - BufferedReader
	 - printf()
=========================================================*/

// ����ڷκ��� ������ ������ �� ���̳� �Է¹޾�
// ��Ģ���� �� ������ ������ �����Ͽ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �Է¹޴� ������ BufferedReader�� Ȱ���� �� �ֵ��� �ϰ�
// ����ϴ� ������ printf() �޼ҵ带 Ȱ���� �� �ֵ��� �Ѵ�.
// ����, ������ ������ ���ǻ� ���� ������� ó���Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 10
// �� ��° ���� �Է� : 2

// =====[���]=====
// 10 + 2 = 12
// 10 - 2 = 8
// 10 * 2 = 20
// 10 / 2 = 5
// 10 % 2 = 0
// ===============
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test020
{
	public static void main(String[] args) throws IOException
	{
		// my code
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int left, right;		// -- ����� �Է°��� ���� ����
		
		System.out.print("ù ��° ���� �Է� : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("\n=====[���]=====\n");
		System.out.printf("%d + %d = %d\n",  left, right, left + right);
		System.out.printf("%d - %d = %d\n",  left, right, left - right);
		System.out.printf("%d * %d = %d\n",  left, right, left * right);
		System.out.printf("%d / %d = %d\n",  left, right, left / right);
		System.out.printf("%d %% %d = %d\n", left, right, left % right);
		System.out.print("===============\n");
		*/

		// teacher's code
		// �ֿ� ���� ����
		int num1, num2;						// -- ����� �Է°��� ���� ����
		int res1, res2, res3, res4, res5;	// -- ���� ����� ���� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ���� �� ó��
		// 1. ����ڿ��� �ȳ� �޼��� ���
		System.out.print("ù ��° ���� �Է� : ");

		// 2. ����ڰ� �Է��� ��(���ڿ�)��
		//    ���� ���·� ��ȯ�� �� ���� num1�� ���
		num1 = Integer.parseInt(br.readLine());
		
		// 3. ����ڿ��� �ȳ� �޼��� ���
		System.out.print("�� ��° ���� �Է� : ");

		// 4. ����ڰ� �Է��� ��(���ڿ�)��
		//    ���� ���·� ������ �� ���� num2�� ���
		num2 = Integer.parseInt(br.readLine());

		// 5. ��� ���� ����
		res1 = num1 + num2;
		res2 = num1 - num2;
		res3 = num1 * num2;
		res4 = num1 / num2;
		res5 = num1 % num2;

		// ��� ���
		System.out.print("\n=====[���]=====\n");
		System.out.printf("%d + %d = %d\n",  num1, num2, num1 + num2);
		System.out.printf("%d - %d = %d\n",  num1, num2, num1 - num2);
		System.out.printf("%d * %d = %d\n",  num1, num2, num1 * num2);
		System.out.printf("%d / %d = %d\n",  num1, num2, num1 / num2);
		System.out.printf("%d %% %d = %d\n", num1, num2, num1 % num2);
		System.out.print("===============\n");
	}
}

/*
ù ��° ���� �Է� : 10
�� ��° ���� �Է� : 20

=====[���]=====
10 + 20 = 30
10 - 20 = -10
10 * 20 = 200
10 / 20 = 0
10 % 20 = 10
===============
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
