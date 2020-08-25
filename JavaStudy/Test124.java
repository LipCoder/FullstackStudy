/*=======================================================
      ���� Ŭ���� ��� ����
	  - �������̽�(Interface)
=========================================================*/
 
// �������̽�
interface Demo
{
	public void write();
	public void print();
}

// Ŭ���� - �������̽��� �����ϴ� �߻� Ŭ����
//class DemoImpl implements Demo
//
abstract class DemoImpl implements Demo
{
	@Override
	public void write()
	{
		System.out.println("write() �޼ҵ� ������ ... ");
	}

	// public void print();
}

// Ŭ����
//class DemoImplSub extends DemoImpl
// �߻� Ŭ������ ��ӹ޴� �߻� Ŭ����
//abstract class DemoImplSub extends DemoImpl
// �߻� Ŭ������ ��ӹ޴� Ŭ����
class DemoImplSub extends DemoImpl
{
	@Override
	public void print()
	{
		System.out.println("print() �޼ҵ� ������ ... " );
	}
}

// Ŭ���� - main() �޼ҵ带 �����ϰ� �ִ� �ܺ��� �ٸ� Ŭ����(���� ��Ű��)
public class Test124
{
	public static void main(String[] args)
	{
		//Demo ob1 = new demo();
		// -- �������̽� -> �ν��Ͻ� ���� �Ұ�
		//DemoImpl ob2 = new DemoImpl();
		// -- �߻�Ŭ���� -> �ν��Ͻ� ���� �Ұ�

		DemoImplSub ob3 = new DemoImplSub();

		ob3.write();
		ob3.print();
	}
}

/*
write() �޼ҵ� ������ ...
print() �޼ҵ� ������ ...
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/