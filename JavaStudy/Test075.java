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