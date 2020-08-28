/*=======================================================
      ���� ����(Exception) ó�� ����
=========================================================*/

// Test155.java ���ϰ� ��~~!!!

// �� throw (���� : �ڿ� s �Ⱥ���)

class Demo
{
	private int value;

	public void setValue(int value) throws Exception
	{
		if(value<=0)
		{	
			// ���� �߻�
			throw new Exception("value �� 0���� �۰ų� ���� �� �����ϴ�.");
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
			System.out.println("main() ���� ��Ƴ� ����");
			System.out.println(e.toString());
		}

	}
}