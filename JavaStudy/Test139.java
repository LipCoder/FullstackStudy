/*=======================================================
      ■■■ 자바의 주요(중요) 클래스 ■■■
	  - Wrapper 클래스
=========================================================*/

public class Test139
{
	public static void main(String[] args)
	{
		byte b = 3;
		int i = 256;

		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);

		System.out.println("b2 : " + b2);
		System.out.println("i2 : " + i2);

		// 이와 같은 호출이 가능하도록 print() 메소드 정의~!!!
		// -> API Document 참조
		print(b2);
		print(i2);

		
		// Byte 클래스의 byteValue() 메소드 호출
		byte b3 = b2.byteValue();

		// Integer 클래스의 intValue() 메소드 호출
		int i3 = i2.intValue();


		// check~!!!
		int i4 = b2.byteValue();
		byte b4 = i2.byteValue();
		//byte b5 = i2.intValue();	//--==>> 에러 발생
	
	}
	
	/*
	static void print(Object obj)
	{
		//System.out.println(obj.toString());
		System.out.println(obj);
	}
	*/

	// [java.lang.Number] 클래스(추상 클래스)는
	// 모든 Wrapper 클래스의 부모 클래스
	// (슈퍼 클래스, 상위 클래스)이다.
	// b2, i2 자료형이 Number n 에 넘어오면서
	// 업 캐스팅이 일어나게 된다.
	static void print(Number n) // <- 3 (Auto-Boxing)
	{
		System.out.println(n);
	}
}