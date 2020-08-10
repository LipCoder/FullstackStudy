/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - switch �� �ǽ�
=========================================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// �ش� �������� ó�� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, switch ���� Ȱ���Ͽ� ó���� �� �ֵ��� �ϸ�,
// ����� ���ǻ� ���� ���·� ó���Ѵ�.

// ���� ��)
// ù ��° ���� �Է�    : 20
// �� ��° ���� �Է�    : 11
// ������ �Է�[+ - * /] : -

// >> 20 - 11 = 9
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		/*
		// ��� 1
		int oper;
		int left, right, result = 0;

		System.out.print("ù ��° ���� �Է� : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("������ �Է� [+ - * /] : ");
		oper = System.in.read();


		switch(oper)
		{
			case 43: result = left + right; break;
			case 45: result = left - right; break;
			case 42: result = left * right; break;
			case 47: result = left / right; break;
			default : return;	// -- �޼ҵ� ���� -> main �޼ҵ��� ����
		}

		// �� [return] 1. ���� ��ȯ -> �޼ҵ� ȣ�� ����
		//			   2. �޼ҵ��� ����
		
		// ��� ���
		System.out.println();
		System.out.printf("%d %c %d = %d\n", left, (char)oper, right, result);
		*/

		// ��� 2
		/*
		char oper;
		int left, right, result = 0;
		boolean isRight = true;

		System.out.print("ù ��° ���� �Է� : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("������ �Է� [+ - * /] : ");
		oper = (char)System.in.read();


		switch(oper)
		{
			case '+': result = left + right; break;
			case '-': result = left - right; break;
			case '*': result = left * right; break;
			case '/': result = left / right; break;
			default : isRight = false;
			// return;		// -- �޼ҵ� ���� -> main �޼ҵ��� ����
		}

		// �� [return] 1. ���� ��ȯ -> �޼ҵ� ȣ�� ����
		//			   2. �޼ҵ��� ����
		
		// ��� ���
		System.out.println();

		if(isRight)
		{
			System.out.printf("%d %c %d = %d\n", left, oper, right, result);
		}
		*/

		// ��� 3
		// �ֿ� ���� ����
		int left, right, result;
		String op;

		System.out.print("ù ��° ���� �Է� : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("������ �Է� [+ - * /] : ");
		op = br.readLine();

		switch(op)
		{
			case "+": result = left + right; break;
			case "-": result = left - right; break;
			case "*": result = left * right; break;
			case "/": result = left / right; break;
			default : return;
		}
		
		// ��� ���
		System.out.println();
		System.out.printf("%d %s %d = %d\n", left, op, right, result);
		
	}
}

/*
ù ��° ���� �Է� : 10
�� ��° ���� �Է� : 40
������ �Է� [+ - * /] : *

10 * 40 = 400
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/