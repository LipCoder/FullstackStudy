/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
	 - 생성자(Constructor)
=========================================================*/

public class Test080
{
	int n;
	int m;

	// 생성자(Constructor)
	Test080()
	{
		n = 100;
		m = 200;
		System.out.println("생성자 실행...");
	}

	// 초기화 블럭(Initialized Block)
	{
		n = 20;
		m = 40;
		System.out.println("초기화 블럭 실행...");
	}

	Test080(int n, int m)
	{
		this.n = n;
		this.m = m;
		System.out.println("매개변수 있는 생성자 실행...");
	}

	void write()
	{
		System.out.println("n : " + n + ", m : " + m);
	}
	
	
	public static void main(String[] args)
	{
		Test080 ob = new Test080();
		ob .write();
		/*
		초기화 블럭 실행...
		생성자 실행...
		n : 100, m : 200
		계속하려면 아무 키나 누르십시오 . . .
		*/

		Test080 ob2 = new Test080(1234, 4567);
		ob2.write();
		/*
		초기화 블럭 실행...
		매개변수 있는 생성자 실행...
		n : 1234, m : 4567
		계속하려면 아무 키나 누르십시오 . . .
		*/
	}
}