/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
	 - 생성자(Constructor)의 역할
=========================================================*/

class NumberTest2
{
	int num;

	/*
	NumberTest2()
	{
	}
	*/

	// 사용자 정의 생성자 -> int형 매개변수를 갖는 생성자
	NumberTest2(int n)
	{
		num = n;
		System.out.println("생성자 호출 시 매개변수 전달 : " + n);
	}

	int getNum()
	{
		return num;
	}
}

public class Test077
{
	public static void main(String[] args)
	{
		// NumberTest2 인스턴스 생성
		//NumberTest2 nt2 = new NumberTest2();
		// --==>> 에러 발생 (컴파일 에러)
		// -- NumberTest2 클래스에는
		//    사용자 정의 생성자가 존재하고 있는 상황이기 때문에
		//    컴파일을 수행하는 과정에서
		//    [default 생성자]가 자동으로 삽입되지 않으며
		//	  사용자 정의 생성자는 매개변수를 갖는 형태로 정의했기 때문에
		//	  위와 같이 매개변수 없는 생성자 호출 시 문제가 발생할 수 밖에 없다.

		NumberTest2 ob1 = new NumberTest2(10);
		// --==>> 생성자 호출 시 매개변수 전달 : 10

		System.out.println("메소드 반환 값 : " + ob1.getNum());
		// --==>> 메소드 반환 값 : 10

		NumberTest2 ob2 = new NumberTest2(3925);
		System.out.println("메소드 반환 값 : " + ob2.getNum());
		// --==>> 메소드 반환 값 : 3925
	}
}