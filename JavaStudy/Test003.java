/*=============================================
     ■■■ 자바 기본 프로그래밍 ■■■
	 - 변수와 자료형
=============================================*/

public class Test003
{
	public static void main(String[] args)
	{
		// 변수 선언
		int a;

		// 변수 초기화(변수 a에 10을 대입)
		a = 10;

		// 변수 선언 및 초기화
		int b = 20;

		// 변수 선언
		int c;

		// 테스트
		System.out.println(a);	// --==> 10
		System.out.println(b);	// --==> 20
		
		// System.out.println(c);
		// --==> 변수(지역) 선언은 하였지만 초기화하지 않아 컴파일 에러
		//		 초기화 하지 않은 지역변수는 사용을 할 수 없다.

		// 연산 및 처리
		c = a + b;

		// 테스트 
		System.out.println(c);	// --==> 30

		// 출력
		System.out.println(a + " " + b + " " + c);
		System.out.printf("%d %d %d\n", a, b, c);
		// --==> 10 20 30

		// System.out.println(a b c);
		// --==> 에러 발생(컴파일 에러)

		// *	덧셈 연산자(+)
		//		피연산자 중 어느 하나라도 문자열 형태의 데이터가 존재한다면
		//		산술연산자로써의 기능을 수행하는 것이 아니라
		//		문자열 결합 연산자로써의 기능도 수행할 수 있다.

		System.out.println("a의 값은 " + a + "입니다.");
		System.out.println("b의 값은 " + b + "입니다.");
		System.out.println("a와 b를 더한 결과값 : " + c);



	}
}

// 실행 결과
/*
10
20
30
10 20 30
10 20 30
a의 값은 10입니다.
b의 값은 20입니다.
a와 b를 더한 결과값 : 30
계속하려면 아무 키나 누르십시오 . . .
*/