/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
	 - ������(Constructor)�� ����
=========================================================*/

class NumberTest2
{
	int num;

	/*
	NumberTest2()
	{
	}
	*/

	// ����� ���� ������ -> int�� �Ű������� ���� ������
	NumberTest2(int n)
	{
		num = n;
		System.out.println("������ ȣ�� �� �Ű����� ���� : " + n);
	}

	int getNum()
	{
		return num;
	}
}

public class Test077
{
	public static void main(String[] args)
	{
		// NumberTest2 �ν��Ͻ� ����
		//NumberTest2 nt2 = new NumberTest2();
		// --==>> ���� �߻� (������ ����)
		// -- NumberTest2 Ŭ��������
		//    ����� ���� �����ڰ� �����ϰ� �ִ� ��Ȳ�̱� ������
		//    �������� �����ϴ� ��������
		//    [default ������]�� �ڵ����� ���Ե��� ������
		//	  ����� ���� �����ڴ� �Ű������� ���� ���·� �����߱� ������
		//	  ���� ���� �Ű����� ���� ������ ȣ�� �� ������ �߻��� �� �ۿ� ����.

		NumberTest2 ob1 = new NumberTest2(10);
		// --==>> ������ ȣ�� �� �Ű����� ���� : 10

		System.out.println("�޼ҵ� ��ȯ �� : " + ob1.getNum());
		// --==>> �޼ҵ� ��ȯ �� : 10

		NumberTest2 ob2 = new NumberTest2(3925);
		System.out.println("�޼ҵ� ��ȯ �� : " + ob2.getNum());
		// --==>> �޼ҵ� ��ȯ �� : 3925
	}
}