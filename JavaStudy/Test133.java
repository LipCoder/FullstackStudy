/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Object Ŭ����
=========================================================*/

// import java.lang.*;

class Test // extends Object
{
	/*
	public boolean equals(Object obj)
	{
	}
	*/

	private int a = 10;

	public void write()
	{
		System.out.println("a : " + a);
	}
}

public class Test133
{
	public static void main(String[] args)
	{
		Test ob1 = new Test();
		Test ob2 = new Test();

		System.out.println("10 == 9 : " + (10 == 9));
		// --==>> 10 == 9 : false

		int a = 10;
		int b = 10;
		System.out.println("a == b : " + (a == b));
		// --==>> a == b : true

		System.out.println("ob1 == ob2 : " + (ob1 == ob2));
		// --==>> ob1 == ob2 : false
		// -- ��ü(Object)���� ���ϴ� �������� ����ϴ� [==] �����ڴ�
		//    ũ�⸦ ���ϴ� ���� �ƴ϶� ��ü�� �ּҰ��� ��.

		// [equals]
		System.out.println("ob1.equals(ob2) : " + ob1.equals(ob2));
		// --==>> ob1.equals(ob2) : false
		// -- [==]  �����ڿ� Object Ŭ������ [equals()] �޼ҵ��
		//    ������ �������� ��ü�� �ּҰ��� ��.
		
		System.out.println();
		System.out.println("----------------------------------------");
		System.out.println();

		System.out.println("ob1            : " + ob1);
		System.out.println("ob1.toString() : " + ob1.toString());
		// --==>> ob1            : Test@15db9742
		//		  ob1.toString() : Test@15db9742

		// [Ŭ������@16�����ؽ��ڵ�]

		// �� �ؽ��ڵ�(hashcode)
		//     : �ڹ� ���������� ��ü�� �����ϱ� ���� ����ϴ� ��.
		//       �޸��� �ּҰ����� �����ϸ� ����� �ȵȴ�.

		// check~!!!
		// �� ��ü�� ������ hashcode(�ؽ��ڵ�)�� ������
		//    hashcode(�ؽ��ڵ�)�� ���ٰ� ���� ��ü�� �ƴϴ�.
		

	}
}