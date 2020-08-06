/*=======================================================
     ■■■ 변수와 자료형 ■■■
	 - 퀴즈
	   사전에 부여된 반지름 정보를 통해
	   원의 넓이와 둘레를 구하는 프로그램을 구현한다.
	   -> 반지름 : 10
=========================================================*/

// 원의 넓이 = 반지름 * 반지름 * PI
// 원의 둘레 = 반지름 * 2 * PI

// 실행 예)
// 넓이 : xxxx
// 둘레 : xxxx
// 계속하려면 아무 키나 누르세요...

public class Test010
{	
	public static void main(String[] args)
	{
		/*
		//나의 Code
		double pi = 3.141592;
		double radius = 10.0;
		
		double area = radius * radius * pi;
		double round = 2 * radius * pi;
		
		System.out.printf(" 넓이 : %f\n 둘레 : %f\n", area, round);
		//System.out.println("넓이 : " + area);
		//System.out.println("둘레 : " + round);
		*/

		// ※ 행단위 주석문(단일행 주석문)은
		//    블럭단위 주석문(다중행 주석문)으로 처리할 수 있지만
		//    블럭단위 주석문(다중행 주석문)은 
		//    이를 감싸는 또다른 블럭단위 주석문으로 처리할 수 없다.

		// 주요 변수 선언(반지름, 원주율, 넓이, 둘레)
		int r = 10;						// -- 반지름
		final double PI = 3.141592;		// -- 원주율
		// ※ [final] 키워드 : 변수의 상수화~!!!

		double area, length;			// -- 넓이, 둘레

		
		// 연산 및 처리
		// 1. 넓이 연산
		// 원의 넓이 = 반지름 * 반지름 * 3.141592;
		area = r * r * PI;

		// 2. 둘레 연산
		// 원의 둘레 = 2 * 반지름 * 3.141592;
		length = 2 * r * PI;

		// 결과 출력
		System.out.println("넓이 : " + area);
		System.out.println("둘레 : " + length);
		System.out.printf("넓이 : %.4f\n둘레 : %.4f\n", area, length);
	}
}

/*
 넓이 : 314.1592
 둘레 : 62.83184
계속하려면 아무 키나 누르십시오 . . .
*/
