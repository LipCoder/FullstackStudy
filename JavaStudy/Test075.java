/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
=========================================================*/

// ����ڷκ��� ������ �� ������ �����ڸ� �Է¹޾�
// ��Ģ ������ �����ϴ� ���α׷��� �����Ѵ�.
// ��, Ŭ������ �ν��Ͻ��� ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.

// ���� ��)
// ������ �� ���� �Է�(���� ����) : 10 5
// ������ ������ �Է�( + - * / )  : +
// >> 10 + 5 = 15
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
import java.io.IOException;

//teacher's code
class Calculate
{
	// �ֿ� �Ӽ� ���� -> ���� ����
	int su1, su2;	// -- ����ڷκ��� �Է¹��� �� ������ ��Ƴ� ����
	char op;		// -- ����ڷκ��� �Է¹��� �����ڸ� ��Ƴ� ����

	// �ֿ� ��� ���� -> �޼ҵ� ���� (��� : �Է�)
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("������ �� ���� �Է�(���� ����) : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();

		System.out.print("������ ������ �Է� (+ - * /) : ");
		op = (char)System.in.read();
	}

	// �ֿ� ��� ���� -> �޼ҵ� ���� (��� : ����)
	int cal()
	{
		int result = 0;

		switch(op)
		{
			case '+' : result = su1 + su2; break;
			case '-' : result = su1 - su2; break;
			case '*' : result = su1 * su2; break;
			case '/' : result = su1 / su2; break;
		}

		return result;
	}
	
	// �ֿ� ��� ���� -> �޼ҵ� ���� (��� : ���)
	void print(int s)
	{
		System.out.printf(">> %d %c %d = %d\n", su1, op, su2, s);
	}
}

public class Test075
{
	public static void main(String[] args) throws IOException
	{
		// Calculate �ν��Ͻ� ����
		Calculate cal = new Calculate();

		// ������ �ν��Ͻ��� ���� �Է� �޼ҵ� ȣ��
		cal.input();

		// ������ �ν��Ͻ��� ���� ���� �޼ҵ� ȣ��
		int result = cal.cal();
		
		// ������ �ν��Ͻ��� ���� ��� �޼ҵ� ȣ��
		cal.print(result);
	}
}

//my code
/*
class Calculate
{
	int left, right;
	char calcType;

	void inputNum()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("������ �� ���� �Է�(���� ����) : ");
		left = sc.nextInt();
		right = sc.nextInt();
	}
	

	void inputCalc() throws IOException
	{
		System.out.print("������ ������ �Է�( + - * / )  : ");
		calcType = (char)System.in.read();
		
		System.in.skip(2);
	}
	

	int getResult()
	{
		int result = 0;
		
		switch(calcType)
		{
			case '+' : result = left + right; break;
			case '-' : result = left - right; break;
			case '*' : result = left * right; break;
			case '/' : result = left / right; break;
		}

		return result;
	}


	void print(int result)
	{
		System.out.printf(">> %d %c %d = %d\n", left, calcType, right, result);
	}
}

public class Test075
{
	public static void main(String[] args) throws IOException
	{
		Calculate c = new Calculate();

		c.inputNum();
		c.inputCalc();
		int r = c.getResult();
		c.print(r);
	}
}
*/