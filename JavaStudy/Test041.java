/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - switch 문 실습
=========================================================*/

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 해당 연산자의 처리 결과를 출력하는 프로그램을 구현한다.
// 단, switch 문을 활용하여 처리할 수 있도록 하며,
// 결과는 편의상 정수 형태로 처리한다.

// 실행 예)
// 첫 번째 정수 입력    : 20
// 두 번째 정수 입력    : 11
// 연산자 입력[+ - * /] : -

// >> 20 - 11 = 9
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		/*
		// 방법 1
		int oper;
		int left, right, result = 0;

		System.out.print("첫 번째 정수 입력 : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /] : ");
		oper = System.in.read();


		switch(oper)
		{
			case 43: result = left + right; break;
			case 45: result = left - right; break;
			case 42: result = left * right; break;
			case 47: result = left / right; break;
			default : return;	// -- 메소드 종료 -> main 메소드의 종료
		}

		// ※ [return] 1. 값의 반환 -> 메소드 호출 지점
		//			   2. 메소드의 종류
		
		// 결과 출력
		System.out.println();
		System.out.printf("%d %c %d = %d\n", left, (char)oper, right, result);
		*/

		// 방법 2
		/*
		char oper;
		int left, right, result = 0;
		boolean isRight = true;

		System.out.print("첫 번째 정수 입력 : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /] : ");
		oper = (char)System.in.read();


		switch(oper)
		{
			case '+': result = left + right; break;
			case '-': result = left - right; break;
			case '*': result = left * right; break;
			case '/': result = left / right; break;
			default : isRight = false;
			// return;		// -- 메소드 종료 -> main 메소드의 종료
		}

		// ※ [return] 1. 값의 반환 -> 메소드 호출 지점
		//			   2. 메소드의 종류
		
		// 결과 출력
		System.out.println();

		if(isRight)
		{
			System.out.printf("%d %c %d = %d\n", left, oper, right, result);
		}
		*/

		// 방법 3
		// 주요 변수 선언
		int left, right, result;
		String op;

		System.out.print("첫 번째 정수 입력 : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /] : ");
		op = br.readLine();

		switch(op)
		{
			case "+": result = left + right; break;
			case "-": result = left - right; break;
			case "*": result = left * right; break;
			case "/": result = left / right; break;
			default : return;
		}
		
		// 결과 출력
		System.out.println();
		System.out.printf("%d %s %d = %d\n", left, op, right, result);
		
	}
}

/*
첫 번째 정수 입력 : 10
두 번째 정수 입력 : 40
연산자 입력 [+ - * /] : *

10 * 40 = 400
계속하려면 아무 키나 누르십시오 . . .
*/