/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 과제
// 사용자로부터 임의의 연도를 입력받아
// 입력받은 연도가.. 윤년인지 평년인지 판별하여
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 입력은 BufferedReader를 활용하고, if 조건문을 활용하여
// 처리할 수 있도록 한다.

// 실행 예)
// 임의의 연도 입력 : 2020
// 2020 -> 윤년
// 계속하려면 아무 키나 누르세요...

// 실행 예)
// 임의의 연도 입력 : 2021
// 2021 -> 평년
// 계속하려면 아무 키나 누르세요...

// ※ 윤년 -> 2월의 마지막 날이 29일
//    평년 -> 2월의 마지막 날이 28일

// ※ 윤년을 판별하기 위한 조건
//    연도가 4의 배우시면서, 100의 배수가 아니거나,
//    또는 400의 배수이면 윤년~!!!
//    그렇지 않으면 평년~!!!

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test033
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int year;
		
		// 연도를 입력 받는다.
		System.out.print("임의의 연도 입력 : ");
		year = Integer.parseInt(br.readLine());

		// 윤년은 400의 배수, 혹은 4의 배수이면서 100의 배수가 아닐때이므로
		if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
		{
			System.out.printf("%d -> 윤년\n", year); // 윤년으로 출력해준다.
		} 
		else
		{
			System.out.printf("%d -> 평년\n", year); // 나머지는 평년으로 출력해준다.
		}
	}
}