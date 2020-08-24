/*=======================================================
      ■■■ 클래스 고급 ■■■
	  - 상속(Inheritance)
=========================================================*/

/*
○ 메소드 오버라이딩(Method Overriding)의 특징

	- 메소드 이름, 리턴타입, 파라미터 수나 타입이 완전히 일치해야 한다.
	- 반드시 상속 관계가 있어야 한다.
	- 재정의된 하위 클래스의 메소드 접근제어지시자는
	  상위 클래스의 메소드 접근제어지시자보다 범위가 크거나 같아야 한다.
	  예를 들어, 상위 클래스 메소드의 접근제어지시자가 [protected]인 경우
	  하위 클래스가 이 메소드를 오버라이딩(Overriding)하는 경우
	  접근제어지시자는 [protected] 또는 [public] 이어야 한다.
	- [static], [final], [private] 메소드는 오버라이딩(Overriding)할 수 없다.
	- Exception의 추가가 불가능하다.
      즉, 상위 클래스의 메소드가 가지고 있는 기존 예외 사항에 
	  새로운 Exception을 추가하는 것은 불가능하다는 것이다.
*/

// 부모 클래스
class SuperTest119
{
	private int a = 5;
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() 메소드 : " + a + " : " + b + " : " + c);
	}
}

// 자식 클래스
class SubTest119 extends SuperTest119
{
	protected int b = 100;

	public void print()
	{
		//System.out.println("Sub print() 메소드 : " + a + " : " + b + " : " + c);
		// -- 슈퍼클래스에서 선언된 변수 a에는 접근할 수 없다.
		//	  -> private 변수이기 때문에...

		System.out.println("Sub print() 메소드 : " + b + " : " + c);

		//System.out.println("Sub print() 메소드 : " + b);
		//System.out.println("Sub print() 메소드 : " + this.b);
		//System.out.println("Sub print() 메소드 : " + super.b);
		// -- 변수 b 는 접근 방법에 따라
		//    다른 b 로 접근 및 출력이 이루어진다.
		//	  슈퍼클래스에서 선언된 b, 서브클래스에서 선언된 b


		//System.out.println("Sub print() 메소드 : " + c);
		//System.out.println("Sub print() 메소드 : " + this.c);
		//System.out.println("Sub print() 메소드 : " + super.c);
		// -- 변수 c는 접근하는데 아무런 제약과 제한이 없다.
		//    슈퍼클래스에서 선언된 c
	}

	@Override
	public void write()
	{
		//System.out.println("Super write() 메소드 : " + a + " : " + b + " : " + c);
		// -- 슈퍼클래스에서 선언된 변수 a에는 접근할 수 없다.
		//    -> private 변수이기 때문에
		System.out.println("Super write() 메소드 : " + b + " : " + c);
	}
	
}

// main() 메소드를 포함하고 있는 외부의 다른 클래스(동일 패키지)
public class Test119
{
	public static void main(String[] args)
	{
		// 하위 클래스(SubTest119) 인스턴스 생성
		SubTest119 ob = new SubTest119();

		ob.print();
		// --==>> Sub print() 메소드 : 100 : 20

		ob.write();
		// write() 메소드를 Override 하기 이전 상황
		// --==>> Super write() 메소드 : 5 : 10 : 20

		// write() 메소드를 Override 한 이후 상황
		// --==>> Super write() 메소드 : 100 : 20

		System.out.println("------------------------------------- 구분선");

		System.out.println(ob.b);
		// --==>> 100
		
		// System.out.println(ob.super.b);
		System.out.println(((SuperTest119)ob).b);
		// --==>> 10
		// ※ 슈퍼 부름

		((SuperTest119)ob).write();
		// --==>> Super write() 메소드 : 100 : 20
		// ※ 이미 덮어씌워졌기 때문에 이는 원본으로 복원할 수 없음
		//    즉 메서드를 슈퍼 부름은 불가능하다.

		//    메소드와 변수를 꼭~!! 구분하여 정리할 것~!!! check~!!!

	}
}