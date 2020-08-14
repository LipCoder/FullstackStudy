/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
=========================================================*/

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 사칙 연산을 수행하는 프로그램을 구현한다.
// 단, 클래스와 인스턴스의 개념을 활용하여 작성할 수 있도록 한다.

// 실행 예)
// 임의의 두 정수 입력(공백 구분) : 10 5
// 임의의 연산자 입력( + - * / )  : +
// >> 10 + 5 = 15
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.io.IOException;

//teacher's code
class Calculate
{
	// 주요 속성 구성 -> 변수 선언
	int su1, su2;	// -- 사용자로부터 입력받은 두 정수를 담아낼 변수
	char op;		// -- 사용자로부터 입력받은 연산자를 담아낼 변수

	// 주요 기능 정의 -> 메소드 정의 (기능 : 입력)
	void input() throws IOException
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		su1 = sc.nextInt();
		su2 = sc.nextInt();

		System.out.print("임의의 연산자 입력 (+ - * /) : ");
		op = (char)System.in.read();
	}

	// 주요 기능 정의 -> 메소드 정의 (기능 : 연산)
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
	
	// 주요 기능 정의 -> 메소드 정의 (기능 : 출력)
	void print(int s)
	{
		System.out.printf(">> %d %c %d = %d\n", su1, op, su2, s);
	}
}

public class Test075
{
	public static void main(String[] args) throws IOException
	{
		// Calculate 인스턴스 생성
		Calculate cal = new Calculate();

		// 생성된 인스턴스를 통해 입력 메소드 호출
		cal.input();

		// 생성된 인스턴스를 통해 연산 메소드 호출
		int result = cal.cal();
		
		// 생성된 인스턴스를 통해 출력 메소드 호출
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
		
		System.out.print("임의의 두 정수 입력(공백 구분) : ");
		left = sc.nextInt();
		right = sc.nextInt();
	}
	

	void inputCalc() throws IOException
	{
		System.out.print("임의의 연산자 입력( + - * / )  : ");
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