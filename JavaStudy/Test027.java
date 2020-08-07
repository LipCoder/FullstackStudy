/*=======================================================
	 ■■■ 연산자(Operator) ■■■
	 - 조건 연산자(-> 삼항 연산자)
=========================================================*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 양수인지, 음수인지, 영인지 구분하여
// 이 결과를 출력하는 프로그램을 구현한다.
// 단 입력 데이터는 BufferedReader 의 readLine()을 통해 넘겨받을 수 있도록 하며
// 조건 연산자(삼항연산자)를 활용해 기능을 구현할 수 있도록 한다.

// 실행 예)
// 임의의 정수 입력 : -12
// -12 -> 음수
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력 : 257
// 257 -> 음수
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력 : 0
// 0 -> 영
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test027
{
    public static void main(String[] args)	throws IOException
    {
		// 주요 변수 선언
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int nNum;			// -- 사용자의 입력값을 담을 변수
		String type;		// -- 판별 결과(양수인지 음수인지 영인지)를 담을 변수

		// 연산 및 처리
		// 1. 사용자에게 안내 메세지 출력
		System.out.print("임의의 정수 입력 : ");
		// 2. 사용자의 입력값을 정수로 변환 후 변수 nNum에 담아내기
		nNum = Integer.parseInt(br.readLine());
		
		// 3. 조건 연산 처리(분기문)
		/*
		n이 0보다 크다 - true	-> nNum은 양수
					   - false  -> nNum이 0보다 작다    - true  -> nNum은 음수
					   									- false	-> nNum은 영
		*/
		type = (nNum < 0) ? "음수" : ((nNum == 0) ? "영" : "양수");
		
		//type = (nNum < 0 ) ? "음수" : "양수";
		//type = (nNum == 0) ? "영" : type;
		
		System.out.printf("\n%d -> %s\n", nNum, type);
    }
}

/*
임의의 정수 입력 : 10

10 -> 양수
계속하려면 아무 키나 누르십시오 . . .


임의의 정수 입력 : -10

-10 -> 음수
계속하려면 아무 키나 누르십시오 . . .


임의의 정수 입력 : 0

0 -> 영
계속하려면 아무 키나 누르십시오 . . .
*/