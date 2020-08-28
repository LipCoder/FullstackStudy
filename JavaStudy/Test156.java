/*=======================================================
      ■■■ 예외(Exception) 처리 ■■■
=========================================================*/

// Test155.java 파일과 비교~~!!!

// ※ throw (주의 : 뒤에 s 안붙음)

class Demo
{
	private int value;

	public void setValue(int value) throws Exception
	{
		if(value<=0)
		{	
			// 예외 발생
			throw new Exception("value 는 0보다 작거나 같을 수 없습니다.");
		}

		this.value = value;
	}

	public int getValue()
	{
		return value;
	}
}

public class Test156
{
	public static void main(String[] args) //throws Exception
	{
		Demo ob = new Demo();
		
		try
		{
			ob.setValue(-3);
			int result = ob.getValue();
			System.out.println(result);
		}
		catch (Exception e)
		{
			System.out.println("main() 에서 잡아낸 예외");
			System.out.println(e.toString());
		}

	}
}