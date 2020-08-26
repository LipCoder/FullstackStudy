/*=======================================================
      ¡á¡á¡á ÀÚ¹ÙÀÇ ÁÖ¿ä(Áß¿ä) Å¬·¡½º ¡á¡á¡á
	  - Wrapper Å¬·¡½º
=========================================================*/

import java.math.BigInteger;

public class Test137
{
	public static void main(String[] args)
	{
		//int a1 = 123456789123456789;
		//long b1 = 123456789123456789123456789L;
		//System.out.println(b1);

		BigInteger a = new BigInteger("123456789123456789");
		BigInteger b = new BigInteger("123456789123456789");

		//BigInteger c = a + b;
		//System.out.println(c);

		// ´õÇÏ±â
		BigInteger c = a.add(b);
		System.out.println("µ¡¼À °á°ú : " + c);
		// --==>> µ¡¼À °á°ú : 246913578246913578
		
		// »©±â
		BigInteger d = a.subtract(b);
		System.out.println("»¬¼À °á°ú : " + d);
		// --==>> »¬¼À °á°ú : 0

		// °öÇÏ±â
		BigInteger e = a.multiply(b);
		System.out.println("°ö¼À °á°ú : " + e);
		// --==>> °ö¼À °á°ú : 15241578780673678515622620750190521

		// ³ª´©±â
		BigInteger f = a.divide(b);
		System.out.println("³ª´°¼À °á°ú : " + f);
		// --==>> ³ª´°¼À °á°ú : 1

		
		// Áö¼ö½Â
		BigInteger g = new BigInteger("2");
		System.out.println("2ÀÇ 3½Â : " + g.pow(3));
		// --==>> 2ÀÇ 3½Â : 8
	}
}