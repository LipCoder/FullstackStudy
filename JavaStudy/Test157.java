/*=======================================================
      ���� ����(Exception) ó�� ����
=========================================================*/

// ���� �ٽ� ������

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
			System.out.println("�� printStackTrace...........");
			e.printStackTrace();
		}
	}

	public int getData(int data) throws Exception
	{
		if(data < 0)
			throw new Exception("data �� 0 ���� �۽��ϴ�.");
			// 1. ���� �߻�

		return data + 10;
	}
								// ��Ƴ� ���� �ٽ� ������ ���� �����ϵ��� ó��
	public int getValue(int value) throws Exception
	{
		int a = 0;
		
		try
		{
			a = getData(-1);	// 2. ���� �߻�
		}
		catch (Exception e)		// 3. ���� ��Ƴ���
		{
			// 4. ��Ƴ� ���ܿ� ���� ó��
			System.out.println("�� printStackTrace...........");
			e.printStackTrace();

			// 5. ��Ƴ� ���� �ٽ� ������ check~!!!
			throw e;
			//-- �ּ� ó�� ��(��, ��Ƴ� ���ܸ� �ٽ� ������ ���� ���)
			//   getValue() �޼ҵ带 ȣ���ϰ� �ִ� main() �޼ҵ���
			//   ���� ó�� ������ ������� �ʰ� �ȴ�.
		}

		return a;
	}
}

/*
�� printStackTrace...........
java.lang.Exception: data �� 0 ���� �۽��ϴ�.
        at Test157.getData(Test157.java:28)
        at Test157.getValue(Test157.java:40)
        at Test157.main(Test157.java:15)
�� printStackTrace...........
java.lang.Exception: data �� 0 ���� �۽��ϴ�.
        at Test157.getData(Test157.java:28)
        at Test157.getValue(Test157.java:40)
        at Test157.main(Test157.java:15)
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/