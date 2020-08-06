/*=============================================
     ■■■ 자바 기본 프로그래밍 ■■■
=============================================*/

public class Test002
{
	public static void main(String[] args) 
	{
		System.out.println("첫 번째 구문...");
		System.out.println("두 번째 구문...");
		System.out.print("세 번째 구문...\n"); // -> \n 개행 
		System.out.print("네 번째 구문...\n"); // -> \n 개행 
		// -- [println()] 메소드와 [print()] 메소드의 차이는
		// 라인 스킵(줄바꿈) 유무에 있다.
		// -- [\n] 을 문자열에 포함하면 라인 스킵이 가능하다.

		System.out.println(7 + 7);			// -- 산술 연산
		System.out.println("7" + "7");		// -- 문자열 결합 연산
	}
}
/*
첫 번째 구문...
두 번째 구문...
세 번째 구문...
네 번째 구문...
14
77
계속하려면 아무 키나 누르십시오 . . .
*/