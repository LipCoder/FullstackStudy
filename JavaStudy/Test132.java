/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Object Ŭ����
=========================================================*/

// �� Test131.java �� ��~!!!

//import java.lang.*;

public class Test132 // extends Object
{
	/*
	...
	public String toString()
	{
	}
	*/


	@Override
	public String toString()
	{
		return "�������� toString()...";
	}

	public static void main(String[] args)
	{
		Test132 ob = new Test132();

		System.out.println(ob.toString());
		// --==>> �������� toString()...

		System.out.println(ob);
		// --==>> �������� toString()...

	}
}