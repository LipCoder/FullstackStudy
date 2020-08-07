/*=======================================================
	 ■■■ 연산자(Operator) ■■■
	 - 조건 연산자(-> 삼항 연산자)
=========================================================*/

// 사용자로부터 임의의 연도를 입력받아
// 입력받은 연도가... 윤년인지 평년인지 판별하여
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 입력은 BufferedReader를 활용하고
// 조건연산자를 활용하여 연산을 수행할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력 : 2000
// 2000년 -> 윤년
// 계속하려면 아무 키나 누르세요...

// 임의의 연도 입력 : 2012
// 2012년 -> 윤년
// 계속하려면 아무 키나 누르세요...

// * 2월 28일 까지 있는 해 -> 평년
//		 29일 까지 있는 해 -> 윤년

// * 윤년의 판별 조건
//   연도가 4의 배수이면서 100의 배수가 아니거나
//   400의 배수이면 윤년
//   그렇지 않으면 평년

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test029
{
	public static void main(String[] args) throws IOException
	{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		int year;
		
		System.out.print("임의의 연도 입력 : ");
		year = Integer.parseInt(br.readLine());

		String yearType;
		// 400의 배수이거나 or (4의 배수이지만, 100의 배수가 아닌) 것
		boolean isLeap = (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
		yearType = isLeap ? "윤년" : "평년";

		System.out.printf("%d년 -> %s\n", year, yearType);
	}
}

/*
임의의 연도 입력 : 2000
2000년 -> 윤년
계속하려면 아무 키나 누르십시오 . . .


임의의 연도 입력 : 3000
3000년 -> 평년
계속하려면 아무 키나 누르십시오 . . .
*/