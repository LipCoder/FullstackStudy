/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - ���ڿ� ���� Ŭ����
	  - ĳ���� ��(CharacterSet)
=========================================================*/

/*
�� ĳ���� ��(Character Set)

	�� �����ڵ�(unicode)
	   
	   ���� ǥ������ ������ 2����Ʈ���� ���� ������ ���� ���ں�ȣü��
	   (UCS: Universal Code System)�� ���Ѵ�.
	   ������ǻ��, IBM, ����ũ�μ���Ʈ ���� ���ҽþ����� ������
	   �����ڵ�(Unicode)�� 1990�⿡ ù ������ ��ǥ�Ͽ���,
	   ISO/IEC JTC1 ���� 1995�� 9�� ����ǥ������ �����Ͽ���.
	   ���� ��Ī�� ISO/IEC 10646-1(Universal Multiple-Octet Coded Caracter Set)�̴�.

	   �������� ��ȯ�� ��Ȱ�ϰ� �ϱ� ���� ���� 1���� �ο��Ǵ� ����
	   16��Ʈ�� �����Ͽ���.
	   �ڵ��� 1���� �� ����� 7��Ʈ, �񿵾�� 8��Ʈ,
	   �ѱ��̳� �Ϻ���� 16��Ʈ�� ���� ������ �Ǵµ�
	   �̵��� ��� 16��Ʈ�� ������ ���̴�.


   �� UTF-8 �� UTF-16
	
	  UTF-8 �� UTF-16 �� ���̸� �� ����� ���ϸ�
	  ���ڸ� ǥ���� ���� ������ �ٸ��ٴ� ���̴�.
	  UTF-8 �� 8��Ʈ ������ ��Ƽ����Ʈ���� ���ڸ� ǥ���ϰ�
	  UTF-16 �� 16��Ʈ ������ ��Ƽ����Ʈ���� ���ڸ� ǥ���Ѵ�.

	  - UTF-8(8Bit UCS Transformation Format)
	    ������ �⺻������ ����ϴ� �ڵ�.
		UCS-2�� ���ǵǴ� ���� ������ �̿��Ͽ� ����� ���ڿ���
		����Ʈ ���� ��ȯ�ϴ� ����� 1�� 1���ڸ� 1~6����Ʈ ������
		��Ƽ����Ʈ�� ��ȯ�Ѵ�.

      - UTF-16(16Bit UCS Transformation Format)
	    �ڹ��� �⺻ �ڵ�.
		�ڹٿ����� ���� �ϳ��� �����ϸ� ����Ʈ ����
		�������̵�, �ѱ۹����̵� 2����Ʈ�� �����ϰ� �ȴ�.
		UCS-2�� ���ǵǴ� ���� ������ �̿��Ͽ� ����� ���ڿ��� 
		UCS-4�� �Ϻ� ���ڸ� ä���ֱ� ���� ���ڵ� ���.
		UTF-8�� ������ �� �ִ�.
		UCS-2�� �̿��� �� �ִ� ���ڼ��� ���� �ø� �� �ִ�.


  �� �ڹٴܿ����� UTF-16�� ����ϰ� �������� UTF-8�� ����ϱ� ������
     ��쿡 ���� ��ȯ�ؾ� �ϴ� ��Ȳ�� �߻��� �� �ִ�.


�� ���� �ڵ��� ����

	�� KSC5601
	   �ѱ� �ϼ��� ǥ��(�ѱ� 2350�� ǥ��)
	   �ѱ�����ǥ�� ����ó���о�(C)�� 5601�� ǥ�ؾ�

	�� KCS5636
	   �����ڿ� ���� ǥ��.
	   �ѱ�����ǥ�� ����ó���о�(C)�� 5636�� ǥ�ؾ�
	   ���� ASCII Code ���� ��������(\)�� ��(��) ǥ�÷� ��ü
	   
	�� EUC-KR(MS949) - ANSI
	   Bell-Laboratories ���� ���н� �󿡼� ������ �̿��� ���ڸ� �����ϱ� ����
	   ������ Ȯ�� �����ڵ�(Extend UNIX Code) �� *�ѱ� ���ڵ� ���*.
	   ������ KSC5636���� ó���ϰ�, �ѱ��� KSC5601�� ó���ȴ�.
	   ��, EUC-KR(MS949) = KSC5636 + KSC5601

	�� UTF-8
	   ������ ���ڴ� 1����Ʈ, �ѱ��� 3����Ʈ�� ǥ��.
	   (������ ���� ���, UTF-8 �������� JSP �� �ۼ��� ������
	    ���Ϸ� UTF-8 �������� �����ؾ� �Ѵ�.)

	�� UTF-16
	   �ڹ� �⺻ ���� �ڵ�.
	   ������ ���ڴ� 1����Ʈ, �ѱ��� 2����Ʈ�� ǥ��.

	�� ISO-8859-1
	   ������ ��� ǥ�⿡ �ʿ��� US-ASCII �� ����
	   94���� ������ ������ ����

*/

import java.io.UnsupportedEncodingException;

public class Test146
{
	public static void main(String[] args) //throws UnsupportedEncodingException
	{
		byte[] buf;
		String name = new String("��ȫ��");

		System.out.println("����Ʈ ĳ���ͼ� : " + System.getProperty("file.encoding"));
		//--==>> ����Ʈ ĳ���ͼ� : MS949


		// [String��ü.getBytes()]
		// : ����Ʈ ĳ���ͼ����� ����Ʈ �迭�� ��ȯ�ϴ� �޼ҵ�
		buf = name.getBytes();

		System.out.println("Length : " + buf.length);
		// --==>> Legnth : 6

		for(byte b : buf)
			System.out.println("[" + b + "]");
		System.out.println();
		//--==>> [-64]
		//		 [-64]
		//		 [-79]
		//		 [-56]
		//		 [-85]
		//		 [-63]
		//		 [-40]


		// �̷��� ���� ����ó���� �س����� 
		// main ���� throws UnsupportedEncodingException�� 
		// ������ �ʿ䰡 ����.
		try
		{
			// "utf-8"�� ����Ʈ �迭�� ��ȯ�ϴ� �޼ҵ� ȣ��
			buf = name.getBytes("utf-8");

			System.out.println("Length : " + buf.length);
			//--==>> Length : 9

			for(byte b : buf)
				System.out.println("[" + b + "]");
			System.out.println();
			// --==>> [-20]
			//        [-100]
			//        [-92]
			//        [-19]
			//        [-103]
			//        [-115]
			//        [-20]
			//        [-92]
			//        [-128]

			//new String("��¹�");

			//new String(����Ʈ�迭, ���ڵ����);

			//new String(buf, "utf-8");

			// utf-8 ���·� ����� ����Ʈ �迭
			// String ��ü�� �Ķ���Ͱ� [utf-8]�� �ο��Ͽ� ����
			// -> utf-8 ������� buf ����Ʈ �迭�� �����Ͽ�
			//    ���ڿ� ��ü ������ �� �̸� ���
			System.out.println("Value1 : " + new String(buf, "utf-8"));
			//--==>> Value1 : ��ȫ��

			
			System.out.println();

			// utf-8 ���·� ����� ����Ʈ �迭 (->buf)��
			// String ��ü�� �Ķ���Ͱ� ����(->����Ʈ ĳ���� ��)�� �ο��Ͽ� ����
			System.out.println("Value2 : " + new String(buf));
			//								 ---------------
			//								 new String(buf, MS949);
			//												 -----
			//												 �ý����� ������� default character set

			System.out.println();
			String convert = new String(name.getBytes("euc-kr"), "utf-8");

			System.out.println("Value3 : " + convert);
			//--==>> Value3 : ?????

			buf = convert.getBytes();
			System.out.println("Length : " + buf.length);
			//--==>> Length : 5

			buf = convert.getBytes("utf-8");
			System.out.println("Length : " + buf.length);
			//--==>> Length : 14

			/*
			�� check~!!!

			   euc-kr �� utf-8�� ��ȯ�ϰڴٴ� �ǵ���
			   ���� ���� �ڵ��� �ع�����...
			   (-> [new String(name.getBytes("euc-kr"), "utf-8")])
			   �̷��� ��ȯ���� ���� ����Ʈ �迭�� ������
			   euc-kr �̵�... utf-8 �̵�...
			   ��� ����Ʈ �迭�� �о����
			   �����ִ� ���� Ȯ���� �� �ִ�.

			   �̹� ������ ������ String ��ü�� ����Ʈ �迭�� 
			   � ������ε� ������ �Ұ����ϴ�.

			*/

		}
		catch (UnsupportedEncodingException e)
		{
			System.out.println(e.toString());
		}

	}
}