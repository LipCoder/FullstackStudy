/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 사용자로부터 임의의 두 정수와 연산자를 입력받아
// 해당 연산자의 연산 처리 결과를 출력하는 프로그램을 구현한다.
// 단, if 조건문을 활용하여 처리할 수 있도록 하며,
// 연산 결과는 편의상 정수형으로 처리될 수 있도록 한다.

// 실행 예)
// 첫 번째 정수 입력 : 10
// 두 번째 정수 입력 : 14
// 연산자 입력 [+ - * /] : +

// >> 10 + 14 = 24
// 계속하려면 아무 키나 누르세요...

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

		System.out.print("첫 번째 정수 입력 : ");
		left = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		right = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /] : ");
		oper = (char)System.in.read();
		//oper = br.readLine().charAt(0);

		// 두번째 방법
		// int oper;
		// oper = System.in.read();

		if(oper == '+')
		{
			// 첫번째 방법
			//System.out.printf("%d + %d = %d\n", left, right, left + right);
			// 세번째 방법
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
				System.out.println("0을 나눌 수 없습니다.");
			}
			else
			{
				result = (int)(left / (double)right);
				System.out.printf("%d / %d = %d\n", left, right, result);
			}
		}
		else
		{
			System.out.println("잘못된 연산자 입니다.");
		}

		// 세번째 방법
		//System.out.printf("\n>> %d %c %d = %d\n", left, oper, right, result);
	}
}

/*
첫 번째 정수 입력 : 10
두 번째 정수 입력 : 30
연산자 입력 [+ - * /] : *
10 * 30 = 300
계속하려면 아무 키나 누르십시오 . . .
*/
