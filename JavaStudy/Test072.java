/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
=========================================================*/

// 직사각형 클래스 설계

/*

직사각형의 넓이와 둘레 계산, 클래스로 표현

클래스의 정체성 -> 직사각형
클래스의 속성   -> 가로, 세로 (넓이, 둘레, 부피, 무게, 재질, 색깔, ....)
클래스의 기능	-> 넓이 계산, 둘레 계산, 가로세로 입력, 결과 출력, ...

객체를 구성		-> 데이터(속성, 상태, 값) + 기능(행위, 동작)	-> 객체 생성
	
클래스를 설계	->			변수		  +			메소드		-> 인스턴스 생성

class 직사각형
{
	// 데이터(속성, 상태)	-> 변수
	int 가로, 세로;

	// 기능(동작, 행위)		-> 메소드
	가로세로 입력()
	{
	}

	둘레 계산()
	{
	}

	넓이 계산()
	{
	}

	결과 출력()
	{
	}
}

*/
import java.util.Scanner;

class Rect
{
	// 데이터(속성, 상태)	-> 변수
	int w, h;				// 가로세로 입력

	// 기능(동작, 행위)		-> 메소드
	void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("가로 입력 : ");
		w = sc.nextInt();

		System.out.print("세로 입력 : ");
		h = sc.nextInt();
	}

	int calLength()		// 둘레 계산
	{
		int result = 0;
		result = (w + h) * 2;

		return result;
	}

	int calArea()		// 넓이 계산
	{
		//return w * h;

		int result = 0;

		result = w * h;

		return result;
	}
	
	// 메서드는 그 기능만 충실히 해주도록 만들어야 한다.
	// 그러면 성능이 더 좋다.(한가지 기능에만 집중하기 때문에)
	void print(int a, int l)				// 결과 출력
	{
		// 가로 : 10
		// 세로 : 20
		// 넓이 : xxx
		// 둘레 : xx
		System.out.println("가로 : " + w);
		System.out.println("세로 : " + h);
        System.out.println("넓이 : " + a);
		System.out.println("둘레 : " + l);
	}
}


// ※	하나의 자바 파일(.java)에 여러 개의 클래스(class)를 만들 수 있다.
//		하지만, [public class]는 하나만 올 수 있다.
//		파일을 저장할 때의 이름은
//		이 [public class]의 이름으로 지정해야 한다.
//		일반적으로는 하나의 파일 하나의 클래스를 설계한다.
//		또한, 여러 개의 클래스가 설계된 파일을 컴파일하게 되면
//		내부에 설계된 클래스의 수 만큼 클래스 파일(.class)이 파생된다.

public class Test072
{
	public static void main(String[] args)
	{
		// Rect 인스턴스 생성
		Rect ob = new Rect();
		
		// 입력 메소드 호출
		ob.input();
		
		// 넓이를 연산하는 메소드 호출
		int area = ob.calArea();

		// 둘레를 연산하는 메소드 호출
		int length = ob.calLength();

		// 넓이, 둘레를 출력하는 메소드 호출
		ob.print(area, length);
	}
}