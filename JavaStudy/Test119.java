/*=======================================================
      ���� Ŭ���� ��� ����
	  - ���(Inheritance)
=========================================================*/

/*
�� �޼ҵ� �������̵�(Method Overriding)�� Ư¡

	- �޼ҵ� �̸�, ����Ÿ��, �Ķ���� ���� Ÿ���� ������ ��ġ�ؾ� �Ѵ�.
	- �ݵ�� ��� ���谡 �־�� �Ѵ�.
	- �����ǵ� ���� Ŭ������ �޼ҵ� �������������ڴ�
	  ���� Ŭ������ �޼ҵ� �������������ں��� ������ ũ�ų� ���ƾ� �Ѵ�.
	  ���� ���, ���� Ŭ���� �޼ҵ��� �������������ڰ� [protected]�� ���
	  ���� Ŭ������ �� �޼ҵ带 �������̵�(Overriding)�ϴ� ���
	  �������������ڴ� [protected] �Ǵ� [public] �̾�� �Ѵ�.
	- [static], [final], [private] �޼ҵ�� �������̵�(Overriding)�� �� ����.
	- Exception�� �߰��� �Ұ����ϴ�.
      ��, ���� Ŭ������ �޼ҵ尡 ������ �ִ� ���� ���� ���׿� 
	  ���ο� Exception�� �߰��ϴ� ���� �Ұ����ϴٴ� ���̴�.
*/

// �θ� Ŭ����
class SuperTest119
{
	private int a = 5;
	protected int b = 10;
	public int c = 20;

	public void write()
	{
		System.out.println("Super write() �޼ҵ� : " + a + " : " + b + " : " + c);
	}
}

// �ڽ� Ŭ����
class SubTest119 extends SuperTest119
{
	protected int b = 100;

	public void print()
	{
		//System.out.println("Sub print() �޼ҵ� : " + a + " : " + b + " : " + c);
		// -- ����Ŭ�������� ����� ���� a���� ������ �� ����.
		//	  -> private �����̱� ������...

		System.out.println("Sub print() �޼ҵ� : " + b + " : " + c);

		//System.out.println("Sub print() �޼ҵ� : " + b);
		//System.out.println("Sub print() �޼ҵ� : " + this.b);
		//System.out.println("Sub print() �޼ҵ� : " + super.b);
		// -- ���� b �� ���� ����� ����
		//    �ٸ� b �� ���� �� ����� �̷������.
		//	  ����Ŭ�������� ����� b, ����Ŭ�������� ����� b


		//System.out.println("Sub print() �޼ҵ� : " + c);
		//System.out.println("Sub print() �޼ҵ� : " + this.c);
		//System.out.println("Sub print() �޼ҵ� : " + super.c);
		// -- ���� c�� �����ϴµ� �ƹ��� ����� ������ ����.
		//    ����Ŭ�������� ����� c
	}

	@Override
	public void write()
	{
		//System.out.println("Super write() �޼ҵ� : " + a + " : " + b + " : " + c);
		// -- ����Ŭ�������� ����� ���� a���� ������ �� ����.
		//    -> private �����̱� ������
		System.out.println("Super write() �޼ҵ� : " + b + " : " + c);
	}
	
}

// main() �޼ҵ带 �����ϰ� �ִ� �ܺ��� �ٸ� Ŭ����(���� ��Ű��)
public class Test119
{
	public static void main(String[] args)
	{
		// ���� Ŭ����(SubTest119) �ν��Ͻ� ����
		SubTest119 ob = new SubTest119();

		ob.print();
		// --==>> Sub print() �޼ҵ� : 100 : 20

		ob.write();
		// write() �޼ҵ带 Override �ϱ� ���� ��Ȳ
		// --==>> Super write() �޼ҵ� : 5 : 10 : 20

		// write() �޼ҵ带 Override �� ���� ��Ȳ
		// --==>> Super write() �޼ҵ� : 100 : 20

		System.out.println("------------------------------------- ���м�");

		System.out.println(ob.b);
		// --==>> 100
		
		// System.out.println(ob.super.b);
		System.out.println(((SuperTest119)ob).b);
		// --==>> 10
		// �� ���� �θ�

		((SuperTest119)ob).write();
		// --==>> Super write() �޼ҵ� : 100 : 20
		// �� �̹� ��������� ������ �̴� �������� ������ �� ����
		//    �� �޼��带 ���� �θ��� �Ұ����ϴ�.

		//    �޼ҵ�� ������ ��~!! �����Ͽ� ������ ��~!!! check~!!!

	}
}