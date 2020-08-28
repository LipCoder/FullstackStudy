/*=======================================================
      ���� ����(Exception) ó�� ����
=========================================================*/

// �ٸ� ���� �ٽ� ������

public class Test158
{
	public int getValue(int value) throws Exception				// �� ���� ������
	{															//	  (�Ķ� ��ź)
		int a = 0;

		try
		{
			a = getData(-2);									// �� ���� �߻�
																//    (���� ��ź)
		}
		catch (Exception e)										// �� ���� ��Ƴ���
		{														//	  (���� ��ź)
			// �� ���� ó��(���� ��ź)
			System.out.println("printStackTrace........");
			e.printStackTrace();

			throw new Exception("value �� �����Դϴ�.");		// �� ���ο� ���� �߻�
																//	  (�Ķ� ��ź)
		}

		a = getData(-2);

		return a;
	}

	public int getData(int data) throws Exception				// �� ���� ������
	{															//	  (���� ��ź)
		if(data < 0)
			throw new Exception("data �� 0 ���� �۽��ϴ�.");	// �� ���� �߻�
																//    (���� ��ź)
		return data + 10;
	}

	public static void main(String[] args)
	{
		Test158 ob = new Test158();

		try
		{
			int a = ob.getValue(-2);							// �� ���� �߻�
			System.out.println("a : " + a);						//    (�Ķ� ��ź)
		}
		catch (Exception e)										// �� ���� ��Ƴ���
		{														//	  (�Ķ� ��ź)
			System.out.println("printStackTrace........");
			e.printStackTrace();
		}
		
	}
}