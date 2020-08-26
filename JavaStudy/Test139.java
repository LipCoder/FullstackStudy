/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Wrapper Ŭ����
=========================================================*/

public class Test139
{
	public static void main(String[] args)
	{
		byte b = 3;
		int i = 256;

		Byte b2 = new Byte(b);
		Integer i2 = new Integer(i);

		System.out.println("b2 : " + b2);
		System.out.println("i2 : " + i2);

		// �̿� ���� ȣ���� �����ϵ��� print() �޼ҵ� ����~!!!
		// -> API Document ����
		print(b2);
		print(i2);

		
		// Byte Ŭ������ byteValue() �޼ҵ� ȣ��
		byte b3 = b2.byteValue();

		// Integer Ŭ������ intValue() �޼ҵ� ȣ��
		int i3 = i2.intValue();


		// check~!!!
		int i4 = b2.byteValue();
		byte b4 = i2.byteValue();
		//byte b5 = i2.intValue();	//--==>> ���� �߻�
	
	}
	
	/*
	static void print(Object obj)
	{
		//System.out.println(obj.toString());
		System.out.println(obj);
	}
	*/

	// [java.lang.Number] Ŭ����(�߻� Ŭ����)��
	// ��� Wrapper Ŭ������ �θ� Ŭ����
	// (���� Ŭ����, ���� Ŭ����)�̴�.
	// b2, i2 �ڷ����� Number n �� �Ѿ���鼭
	// �� ĳ������ �Ͼ�� �ȴ�.
	static void print(Number n) // <- 3 (Auto-Boxing)
	{
		System.out.println(n);
	}
}