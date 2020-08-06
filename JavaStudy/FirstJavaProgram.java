/*======================================
  ■■■ 자바의 개요 및 특징 ■■■
======================================*/

// 클래스 이름은 [FirstJavaProgram]
// 자바 프로그램의 클래스 이름은 첫 글자를 대문자로 시작.
// 자바 프로그램 시작할 때 클래스(class)와 main() 함수를
// 기본적으로 입력.
// 소스 저장 시 클래스 이름과 동일한 파일 이름으로 저장.
// 단, 이 때 확장자는 [.java]

public class FirstJavaProgram 
{
	// [main()] 이라는 이름을 가진 함수(메소드)
	// -- 자바 인터프리터가 처음 찾는 함수
	public static void main(String[] args)
	{
		//
		// 앞으로 우리가 당분간 코딩해야 하는 영역
		//

		System.out.println("Welcome to Java");
		System.out.println("First Java Program");

		// * 이름() -> 함수(메소드) 호출
		//   자바에서의 함수는 독립적으로 존재할 수 없고,
		//	 클래스에 정의되는 형태로 만들어져야 한다.

		// System.out.println()

		// [System] 이라는 도구 상자 안의 [out] 상자 안의
		// [println()] 이라는 도구 즉, 함수(메소드)를
		// 호출(불러다)하여 사용.
	}
}

/*
Welcome to Java
First Java Program
계속하려면 아무 키나 누르십시오 . . .
*/