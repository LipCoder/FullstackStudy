/*=======================================================
      ■■■ 클래스 고급 ■■■
	  - 상속(Inheritance)
=========================================================*/

// 다음과 같은 프로그램을 구현한다.
// 단, 상속의 개념을 적용하여 작성할 수 있도록 한다.

// 실행 예)
// 임의의 두 정수 입력(공백 구분) : 20 15
// 연산자 입력(+ - * /) : -
// >> 20 - 15 = 5.00
// 계속하려면 아무 키나 누르세요...

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

// sub class -> Aclass 를 상속받는 클래스
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

		System.out.print("임의의 두 정수 입력(공백 구분) : ");	// 20 15
		String temp = br.readLine();							// "20 15"
		String[] strArr = temp.split("\\s");					// -- 구분자 -> 공백(\s)
		// String[] strArr = {"20", "15"};
		
		// ※ 문자열.split("구분자");
		// "사과 딸기 바나나".split("\\n"); -> {"사과", "딸기", "바나나"}

		if(strArr.length != 2)
			return false;
		// -- false를 반환하며 input() 메소드 종료
		//    이 조건을 수행할 경우...
		//    아래 에 수행해야 하는 코드가 남아있더라도 
		//    결과값을 반환하며 메소드는 종료된다.

		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);

		System.out.print("연산자 입력(+ - * /) : ");
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
		
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		x = sc.nextInt();
		y = sc.nextInt();

		System.out.print("연산자 입력(+ - * /) : ");
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
임의의 두 정수 입력(공백 구분) : 20 15
연산자 입력(+ - * /) : /
>> 20 / 15 = 1.33
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백 구분) : 20 0
연산자 입력(+ - * /) : /
>> 20 / 0 = Infinity
계속하려면 아무 키나 누르십시오 . . .
*/