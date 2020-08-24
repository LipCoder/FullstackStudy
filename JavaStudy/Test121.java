/*=======================================================
      ■■■ 클래스 고급 ■■■
	  - 상속 관계에 있는 클래스들 간의 캐스팅
	  - 업 캐스팅, 다운 캐스팅
=========================================================*/

// super class, 부모 클래스, 상위 클래스
class SuperTest121
{
	public int a = 10, b = 20;

	public void write()
	{
		System.out.println("슈퍼 클래스 write() 메소드...");
	}

	public int hap()
	{
		return a + b;
	}
}

// sub class, 자식 클래스, 하위 클래스
class SubTest121 extends SuperTest121
{
	public int b = 100, c = 200;

	@Override
	public int hap()
	{
		return a + b + c;
	}

	public void print()
	{
		System.out.println("서브 클래스 print() 메소드...");
	}
}

// main() 메소드를 포함하고 있는 외부의 다른 클래스(동일 패키지)
public class Test121
{
	public static void main(String[] args)
	{
		// sub class 기반 인스턴스 생성
		SubTest121 ob1 = new SubTest121();	// -> 부모객체와 자식객체 모두 메모리에 퍼올려져있는것임
		System.out.println("ob1.b : " + ob1.b);
		// --==>> ob1.b : 100

		// ○ 업 캐스팅
		// SuperTest121 ob2;
		SuperTest121 ob2 = ob1;
		// -- [SuperTest121 ob2 = (SuperTest121)ob1;] 과 동일한 구문 
		// 업캐스팅!

		/*
		학생 인경 = new 학생();
		인간 사람 = 인경;			// [인간 사람 = (인간)인경;] 과 동일한 구문

		byte a = 10;
		short b = a;				// [short b = (short)a;] 과 동일한 구문
		*/

		System.out.println("ob2.b : " + ob2.b);
		//--==>> bo2.b : 20
		//-- 변수는 객체별로 따로 할당되므로
		//   변수 b는 ob2의 변수이다.
	}
}