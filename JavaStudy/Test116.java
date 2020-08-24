/*=======================================================
      ■■■ 클래스 고급 ■■■
	  - 상속(Inheritance)
=========================================================*/

/*
	○	상속(Inheritance)이란
		새로 설계(생성)하고자 하는 클래스가
		이미 설계되어 있는 다른 클래스의 기능과 중복되는 경우
		이미 설계된 클래스의 일부분이나 전체 구조를 공유할 수 있도록 하는 기능을 의미한다.

		즉, 상속은 객체를 좀 더 쉽게 만들 수 있는
		고수준의 재사용성(reusability)을 확보하고
		객체간의 관계를 구성함으로써
		객체 지향의 또 다른 큰 특징인 [다형성]의 문법적 토대가 된다.

		상속은 기존 프로그램의 클래스 내용을 고유함으로써
		중복된 코드들을 재작성 할 필요 없이
		반복적이고 세부적인 작업을 처리하지 않기 때문에
		프로그램을 작성하는 시간을 절약할 수 있고
		유지보수를 편리하게 할 수 있으며,
		프로그램의 길이도 짧아지게 된다.

		또한, 이미 작성된 프로그램들은 앞서 테스트되었기 때문에
		오류를 줄일 수 있어 현재 작성중인 프로그램에만 전념할 수 있다.


	※	물려주는 클래스 -> 상속하는 클래스 -> 상위 클래스 -> 부모(조상) 클래스 -> Super Class
		물려받는 클래스 -> 상속받는 클래스 -> 하위 클래스 -> 자식(자손) 클래스 -> Sub Class


	※	주의할 점 
		자바는 다.중.상.속. 을 지원하지 않기 때문에
		두 개 이상의 클래스로부터 상속을 받을 수 없다.
		자바는 단.일.상.속. 만 허용된다.

*/

// 부모 클래스
class SuperTest116 
{
	// [protected] : 상속받는 클래스, 동일한 패키지, 클래스 내부에서 접근 가능
	protected double area;
	
	// [default] : 동일한 패키지, 클래스 내부에서 접근 가능
	// 부모 클래스의 생성자 
	SuperTest116()
	{
		System.out.println("Super Class...");
	}

	// [default] : 동일한 패키지, 클래스 내부에서 접근 가능
	void write(String title)
	{
		System.out.println(title + " - " + area);
	}
}


// 자식 클래스(동일한 패키지에 존재하는 자식 클래스
public class Test116 extends SuperTest116 //, SuperTest117, SuperTest118	// 우리 부모님이 SuperTest116 이다~!!!
{
	// 부모 클래스로부터 상속받은 내용
	/*
	protected double area;

	(생성자는 상속에서 제외된다.)

	// write는 default 접근 제어 지시자이므로
	// 만약 SuperTest116이 자식 클래스인 Test116과
	// 동일한 패키지에 존재하지 않는다면
	// Test116은 write를 호출할 수 없다.
	void write(String title)
	{
		System.out.println(title + " - " + area);
	}
	*/

	//double area = 10.1234;

	// 자식 클래스의 생성자
	Test116()
	{
		// 부모 클래스의 생성자 호출
		//SuperTest116();	// -> super();
		
		//Test116();		// -> this();
		
		System.out.println("Sub Class...");

		//Super Class가 항상 먼저 출력되어야 한다.
		//super();
		// --==>> 에러 발생(컴파일 에러)
	}

	public void circle()
	{
		int r = 10;
		area = r * r * 3.141592;
		write("원");
	}

	public void rect()
	{
		int w = 20, h = 5;
		// super를 사용하면 자식 클래스 변수가 아닌 부모 클래스 변수가 온다.
		super.area = w * h;	
		super.write("사각형");
	}

	public static void main(String[] args)
	{
		// Test116 클래스(자식 클래스) 기반 인스턴스 생성
		Test116 ob = new Test116();
		// --==>> Super Class...
		//		  Sub Class...

		ob.circle();
		// --==>> 원 - 314.1592;

		ob.rect();
		// --==>> 사각형 - 100.0


	}
}