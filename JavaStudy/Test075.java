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