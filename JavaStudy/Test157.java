/*=======================================================
      ■■■ 예외(Exception) 처리 ■■■
=========================================================*/

// 예외 다시 던지기

public class Test157
{
	public static void main(String[] args)
	{
		Test157 ob = new Test157();

		try
		{	
			int a = ob.getValue(-2);
			System.out.println("a : " + a);
		}
		catch (Exception e)
		{
			System.out.println("ⓑ printStackTrace...........");
			e.printStackTrace();
		}
	}

	public int getData(int data) throws Exception
	{
		if(data < 0)
			throw new Exception("data 가 0 보다 작습니다.");
			// 1. 예외 발생

		return data + 10;
	}
								// 잡아낸 예외 다시 던지는 것이 가능하도록 처리
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			a = getData(-1);	// 2. 예외 발생
		}
		catch (Exception e)		// 3. 예외 잡아내기
		{
			// 4. 잡아낸 예외에 대한 처리
			System.out.println("ⓐ printStackTrace...........");
			e.printStackTrace();

			// 5. 잡아낸 예외 다시 던지기 check~!!!
			throw e;
			//-- 주석 처리 시(즉, 잡아낸 예외를 다시 던지지 않을 경우)
			//   getValue() 메소드를 호출하고 있는 main() 메소드의
			//   예외 처리 구문은 수행되지 않게 된다.
		}

		return a;
	}
}

/*
ⓐ printStackTrace...........
java.lang.Exception: data 가 0 보다 작습니다.
        at Test157.getData(Test157.java:28)
        at Test157.getValue(Test157.java:40)
        at Test157.main(Test157.java:15)
ⓑ printStackTrace...........
java.lang.Exception: data 가 0 보다 작습니다.
        at Test157.getData(Test157.java:28)
        at Test157.getValue(Test157.java:40)
        at Test157.main(Test157.java:15)
계속하려면 아무 키나 누르십시오 . . .
*/