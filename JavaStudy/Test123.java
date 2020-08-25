/*=======================================================
      ���� Ŭ���� ��� ����
	  - �������̽�(Interface)
=========================================================*/
 
 // �������̽�
interface ADemo
{
	public void write();
	//public abstract void write();
}

// �������̽�
interface BDemo
{
	public void print();
	//public abstract void print();
}

// �� �������̽��� 2�� �̻��� ����(implements)�� �� �ִ�.
//	   -> Ŭ������ ���� ����� ���� �ʴ� �κ��� ����(����)�ϴ� ����

// Ŭ����
//class DemoImpl 
//class DemoImpl extends ADemo, BDemo
// �߻� Ŭ���� - �� �������̽��� ������ �߻� Ŭ����
//abstract class DemoImpl implements ADemo, BDemo
class DemoImpl implements ADemo, BDemo
{
	/*
	public void write();
	public void print();
	*/

	// JDK 1.5(5.0)������ �������̽� �޼ҵ带
	// �������̵�(Overriding)�� ��
	// [@Override] ������̼�(annotation)�� ����� �� ����.
	// JDK 1.6(6.0) ���ĺ��� ���� ������ �����̴�.
	// ��, ��ӹ��� Ŭ������ �޼ҵ带 �������̵�(Overriding)�� ������
	// JDK 1.5(5.0)������ [@Override] ������̼�(annotation) ����� �����ϴ�.
	@Override
	public void write()
	{
		System.out.println("ADemo �������̽� �޼ҵ� write() ... ");
	}

	@Override
	public void print()
	{
		System.out.println("BDemo �������̽� �޼ҵ� print() ... ");
	}
}

// Ŭ���� - main() �޼ҵ带 �����ϴ� �ܺ��� �ٸ� Ŭ����(���� ��Ű��)
public class Test123
{
	public static void main(String[] args)
	{
		//ADemo ob = new ADemo();	//-- �������̽� -> �ν��Ͻ� ���� �Ұ�
		//BDemo ob = new BDemo();	//-- �������̽� -> �ν��Ͻ� ���� �Ұ�

		// ADemo, BDemo �������̽��� ����(implements)�� Ŭ����
		// (-> DemoImpl)
		// ����� �ν��Ͻ� ����
		DemoImpl ob1 = new DemoImpl();

		ob1.write();
		ob1.print();
		//--==>> ADemo �������̽� �޼ҵ� write() ...
		//	     BDemo �������̽� �޼ҵ� print() ...

		ADemo ob2 = new DemoImpl();			//-- �� ĳ����
		BDemo ob3 = new DemoImpl();			//-- �� ĳ����

		//ob2.print();	// --==>> ���� �߻�
		//ob3.write();	// --==>> ���� �߻�

		ob3.print();
		ob2.write();
		//	--==>>	BDemo �������̽� �޼ҵ� print() ...
		//			ADemo �������̽� �޼ҵ� write() ...

		((BDemo)ob2).print();
		((ADemo)ob3).write();
		// --	DemoImpl Ŭ������ �� �������̽��� ��� �����߱� ������ �����ϴ�.
		//		���� DemoImpl Ŭ������ �̵� �� �� �������̽��� �����ߴٸ�
		//		�� ������ ��Ÿ�� ���� �߻��ϴ� �����̴�.
		// --==>> BDemo �������̽� �޼ҵ� print() ...
		//        ADemo �������̽� �޼ҵ� write() ...
		
		// �� �ٿ� ĳ����
		((DemoImpl)ob3).write();
		// --==>> ADemo �������̽� �޼ҵ� write() ...
	}
}