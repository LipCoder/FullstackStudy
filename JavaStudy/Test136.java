/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Wrapper Ŭ����
=========================================================*/

public class Test136
{
	public static void main(String[] args)
	{
		boolean bi = true;
		Boolean wrapbi = new Boolean(bi);
		Boolean wBi = bi;		// -- ���� �ڽ�

		int n = 300;
		Integer wrapn = new Integer(n);
		int n2 = wrapn;			// -- ���� ��ڽ�

		float f = 300.3f;
		Float wrapf = new Float(f);

		System.out.println(wrapbi.toString());
		System.out.println(wrapn.toString());
		System.out.println(wrapf.toString());
		// --==>> true
		//	      300
		//        300.3

		System.out.println(wrapbi);
		System.out.println(wrapn);
		System.out.println(wrapf);
		// --==>> true
		//	      300
		//        300.3


		// Integer Ŭ����

		String sn = "12";
		int ni = Integer.parseInt(sn);
		System.out.printf("ni : %3d\n", ni);
		// --==>> ni :  12

		ni = Integer.parseInt("0101", 2);
		System.out.printf("ni : %3d\n", ni);
		// --==>> ni :   5

		ni = Integer.parseInt("12", 8);
		System.out.printf("ni : %3d\n", ni);
		// --==>> ni :  10

		ni = Integer.parseInt("A", 16);
		System.out.printf("ni : %3d\n", ni);
		// --==>> ni :  10

		sn = Integer.toBinaryString(20);
		System.out.printf("sn : %s\n", sn);
		// --==>> sn : 10100

		sn = Integer.toHexString(31);
		System.out.printf("sn : %s\n", sn);
		// --==>> sn : 1f

		sn = Integer.toOctalString(31);
		System.out.printf("sn : %s\n", sn);
		// --==>> sn : 37

		Integer num = new Integer(50);
		System.out.println(num.toString());
		// --==>> 50

		int n3 = 345;
		Integer n4 = Integer.valueOf(n3);
		System.out.println(n4);
		// --==>> 345

		
	}
}