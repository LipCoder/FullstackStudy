/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
	 - 정보은닉과 접근제어지시자
=========================================================*/

import java.util.Scanner;

class CircleTest2
{
	// 정보 은닉(Information Hiding)
	// 멤버 변수, 인스턴스 변수, 전역 변수(이 클래스 영역에서)
	// [private] 이라는 접근제어지시자의 선언은
	// 클래스 내부에서만 접근 및 참조가 가능하게 하겠다는 의미
	// int 형 변수 0으로 초기화 지원
	private int r;
	
	//int r;

	// getter / setter 구성
	/*
	int getR()
	{
		return r;
	}

	void setR(int r)
	{
		this.r = r;
	}
	*/

	void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("반지름 입력 : ");
		r = sc.nextInt();
	}

	double calArea()
	{
		return r * r * 3.141592;
	}
	
	void write(double a)
	{
		System.out.println("반지름 : " + r);
		System.out.println("넓  이 : " + a);
	}

}

public class Test101
{
	public static void main(String[] args)
	{
		CircleTest2 ob = new CircleTest2();
		
		// -- error: r has private access in CircleTest2
		//ob.r = 10;
		//System.out.println("원의 반지름 : " + ob.r);

		// getter / setter 사용
		//ob.setR(100);
		//System.out.println("원의 반지름 : " + ob.getR());
		// --==>> 원의 반지름 : 100

		ob.input();
		// --==>> 반지름 입력 : 1000
		// ob.r = 1000;

		double result = ob.calArea();
		ob.write(result);
		/*
		--==>>	반지름 입력 : 2000
				반지름 : 2000
				넓  이 : 1.2566368E7
				계속하려면 아무 키나 누르십시오 . . 
		*/


	}
}