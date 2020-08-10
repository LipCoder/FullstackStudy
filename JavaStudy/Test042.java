/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - switch 문 실습
=========================================================*/

// 사용자로부터 한 문자를 입력받아
// 입력받은 문자가 숫자인지 숫자가 아닌지를 판별하는 프로그램을 구현한다.
// 단, switch_case 문을 활용하여 처리할 수 있도록 한다.

// 실행 예)
// 한 문자 입력 : 6
// >> 입력하신 문자는 숫자입니다.
// 계속하려면 아무 키나 누르세요...

// 한 문자 입력 : t
// >> 입력하신 문자는 숫자가 아닙니다.
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;
public class Test042
{
    public static void main(String[] args) throws IOException
	{
		char ch;

		System.out.print("한 문자 입력 : ");
		ch = (char)System.in.read();

		switch(ch)
		{
		case '0': case '1': case '2': case '3': case '4':
		case '5': case '6': case '7': case '8': case '9':
			System.out.println(">> 입력하신 문자는 숫자입니다.");
		default:
			System.out.println(">> 입력하신 문자는 숫자가 아닙니다.");
		}
	}
}