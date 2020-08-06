/*=======================================================
     ■■■ 자바 기본 프로그래밍 ■■■
	 - 퀴즈
	   삼각형의 밑변의 길이와 높이를 사용자로부터 입력받아
	   이 삼각형의 넓이를 구하는 프로그램을 구현한다.
=========================================================*/

// 실행 예)
// ■ 삼각형의 넓이 구하기 ■
// - 삼각형의 밑변 입력 : 3
// - 삼각형의 높이 입력 : 5

// >> 밑변이 3, 높이가 5인 삼각형의 넓이 : xxxx
// 계속하려면 아무 키나 누르세요. . .

// 삼각형 넓이 공식 : (밑변 * 높이) / 2
// 사용자로부터 데이터를 입력받아 처리 -> BufferedReader 활용

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test012
{
	public static void main(String[] args) throws IOException
	{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int bottomLength, height;	// -- 밑변, 높이
		double area;				// -- 넓이

		// 1. 사용자에게 안내 메시지 출력
		System.out.println("■ 삼각형의 넓이 구하기 ■");
		System.out.print("- 삼각형의 밑변 입력 : ");

		// 2. 사용자가 입력한 데이터를 정수 형태로 변환한 후
		//	  변수 bottomLength에 담아내기
		bottomLength = Integer.parseInt(br.readLine());
		
		// 3. 다시 사용자에게 안내 메시지 출력
		System.out.print("- 삼각형의 높이 입력 : ");
		
		// 4. 사용자가 입력한 데이터를 정수 형태로 변환한 후
		//	  변수 height에 담아내기
		height = Integer.parseInt(br.readLine());

		// 5. 삼각형의 넓이를 구하는 연산 처리
		area = bottomLength * height / 2.0;	
		//        정수형      정수형  정수형 -> 정수 기반 연산 -> 몫만 취하는 연산
		//        정수형      정수형  실수형 -> 실수 기반 연산 -> 나머지 포함 연산

		// ※ 실수 자료형이 결과값으로 나오는 과정에서
		//    실수 기반의 연산이 필요한 상황이다.
		//    정수형 [2]가 아닌 실수형 [2.0]으로 나눗셈 연산을 수행하게 되면
		//    이 연산은 실수 기반으로 처리된다.

		// 6. 높이, 밑변 길이, 넓이 양식에 맞게 출력
		// System.out.println();		// 개행
		// System.out.print();			// 에러 발생
		System.out.printf("\n>> 밑변이 %d, 높이가 %d인 삼각형의 넓이 : %.2f\n", 
						  bottomLength, height, area);

	}	
}	

/*
■ 삼각형의 넓이 구하기 ■
- 삼각형의 밑변 입력 : 5
- 삼각형의 높이 입력 : 3

>> 밑변이 5, 높이가 3인 삼각형의 넓이 : 7.50
계속하려면 아무 키나 누르십시오 . . .
*/