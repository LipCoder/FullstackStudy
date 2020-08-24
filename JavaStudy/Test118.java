/*=======================================================
      ���� Ŭ���� ��� ����
	  - ���(Inheritance)
=========================================================*/

// ������ ���� ���α׷��� �����Ѵ�.
// ��, ����� ������ �����Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.

// ���� ��)
// ������ �� ���� �Է�(���� ����) : 20 15
// ������ �Է�(+ - * /) : -
// >> 20 - 15 = 5.00
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

// super class
class Aclass
{
	protected int x, y;
	protected char op;

	Aclass()
	{
	}

	void write(double result)
	{
		System.out.printf(">> %d %c %d = %.2f\n", x, op, y, result);
	}
}

// sub class -> Aclass �� ��ӹ޴� Ŭ����
class Bclass extends Aclass
{
	/*
	protected int x, y;
	protected char op;

	void write(double result)
	{
		System.out.printf(">> %d %c %d = %.2f\n", x, op, y, result);
	}
	*/

	Bclass()
	{
	}

	boolean input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("������ �� ���� �Է�(���� ����) : ");	// 20 15
		String temp = br.readLine();							// "20 15"
		String[] strArr = temp.split("\\s");					// -- ������ -> ����(\s)
		// String[] strArr = {"20", "15"};
		
		// �� ���ڿ�.split("������");
		// "��� ���� �ٳ���".split("\\n"); -> {"���", "����", "�ٳ���"}

		if(strArr.length != 2)
			return false;
		// -- false�� ��ȯ�ϸ� input() �޼ҵ� ����
		//    �� ������ ������ ���...
		//    �Ʒ� �� �����ؾ� �ϴ� �ڵ尡 �����ִ��� 
		//    ������� ��ȯ�ϸ� �޼ҵ�� ����ȴ�.

		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);

		System.out.print("������ �Է�(+ - * /) : ");
		op = (char)System.in.read();

		/*
		if (op != '+' && op != '-' && op != '*' && op != '/')
		{
			return false;
		}

		return true;
		*/

		if(op == '+' || op == '-' || op == '*' || op == '/')
			return true;
		
		return false;
	}//end input()


	double calc()
	{
		double result = 0.0;
	
		switch(op)
		{
			case '+' : result = x + y; break;
			case '-' : result = x - y; break;
			case '*' : result = x * y; break;
			case '/' : result = (double)x / y; break;
		}

		return result;
	}//end calc()

	/*
	public void logic()
	{
		input();
		double result = calc();
		write(result);
	}

	private void input()
	{	
		Scanner sc = new Scanner(System.in);
		
		System.out.print("������ �� ���� �Է�(���� ����) : ");
		x = sc.nextInt();
		y = sc.nextInt();

		System.out.print("������ �Է�(+ - * /) : ");
		op = (sc.next()).charAt(0);
	}

	private double calc()
	{
		double result = 0.0;
		switch(op)
		{
			case '+' : result = x + y; break;
			case '-' : result = x - y; break;
			case '*' : result = x * y; break;
			case '/' : result = (double)x / y; break;
		}
		return result;
	}
	*/
} // end Bclass

public class Test118
{
	public static void main(String[] args) throws IOException
	{
		Bclass ob = new Bclass();
		
		if(!ob.input()) 
		{
			System.out.println("Error...");
			return;
		}

		double result = ob.calc();
		ob.write(result);
		
		//ob.logic();
		

	}
}

/*
������ �� ���� �Է�(���� ����) : 20 15
������ �Է�(+ - * /) : /
>> 20 / 15 = 1.33
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

������ �� ���� �Է�(���� ����) : 20 0
������ �Է�(+ - * /) : /
>> 20 / 0 = Infinity
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/