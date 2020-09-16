/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - String Ŭ����
=========================================================*/

public class Test142
{
	public static void main(String[] args)
	{
		String s = "seoul korea";
		System.out.println(s);
		// --==>> seoul korea


		// ���ڿ� ����
		System.out.println(s.substring(6, 9));
		//-- [String��ü.substring(s, e)]
		//    String��ü ���ڿ��� �������
		//    s ��°����... e-1 ��°���� ����
		//    (��, �ε����� 0���� ����)
		//    seoul   kor  ea
		//    012345  678  9
		//            ---
		// --==>> kor

		System.out.println(s.substring(7));
		// -- [String��ü.substring(s)]
		//    String��ü ���ڿ��� �������
		//    s ��°���� ������... (��, ���ڿ��� ���� ���̸�ŭ...)
		//    seoul  k orea
		//    012345 6 789
		//             ----
		// --==>> orea

		// �� ���ڿ��� ������(��) ��
		System.out.println(s.equals("seoul korea"));
		System.out.println(s.equals("Seoul Korea"));
		// --==>> true
		//        false
		//-- ��ҹ��� ����

		System.out.println(s.equalsIgnoreCase("Seoul Korea"));
		//--==>> true
		//-- ��ҹ��� ���� ����

		
		// �� ã���� �ϴ� ��� ���ڿ�(s)�� 
		//    [kor] ���ڿ��� �����ұ�?
		//    �����Ѵٸ�... �� ��ġ�� ��� �ɱ�?

		// "seoul korea"
		System.out.println(s.indexOf("kor"));
		//--==>> 6
		
		System.out.println(s.indexOf("ea"));
		//--==>> 9

		System.out.println(s.indexOf("e"));
		//--==>> 1

		System.out.println(s.indexOf("tt"));
		//--==>> -1
		//-- ã���� �ϴ� ���ڿ��� ��� ���ڿ��� ������ �ƿ�
		//   �� ���ڿ��� �ε����� ��ȯ������(0���� ����)
		//   �������� ���� ��� ������ ��ȯ�ϰ� �ȴ�. (-1)

		

		// �� ��� ���ڿ�(s)�� [rea]�� ���������� ���� Ȯ��
		//    (true / false)
		System.out.println(s.endsWith("rea"));
		//--==>> true
		System.out.println(s.endsWith("oul"));
		//--==>> false


		// �� ã���� �ϴ� ��� ���ڿ�(s)�� 
		//    [e] ���ڿ��� �����ұ�?
		//    �����Ѵٸ� �� ��ġ�� ��� �ɱ�?
		//    (��, �ڿ��� ���� �˻�)

		// seoul korea
		System.out.println(s.indexOf("e"));
		//--==>> 1

		System.out.println(s.indexOf("o"));
		//--==>> 2
	
		System.out.println(s.lastIndexOf("e"));
		//--==>> 9

		System.out.println(s.lastIndexOf("o"));
		//--==>> 7


		// �� ��� ���ڿ�(s) ��
		//    [6] ��° �ε��� ��ġ�� ���ڴ�?
			
		// seoul korea
		System.out.println(s.charAt(6));   
		//--==>> k

		//System.out.println(s.charAt(52));
		// System.out.println(s.charAt(52));
        // Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 52
        // ���� �߻�(��Ÿ�� ����)

		// �� ��� ���ڿ�(s)�� �� ���ڿ� [souel corea] �� 
		//    � ���ڿ��� �� ū��?
		//    �� ���ڿ��� �ٸ��ٸ� ���̸� Ȯ��(������ �迭)
		
		
		// seoul korea
		System.out.println(s.compareTo("seoul korea"));
		//--==>> 0

		System.out.println(s.compareTo("seoul corea"));
		//--==>> 8
		//    d e f g h i j k
		//  c       ~       k

		
		// �� ��� ���ڿ�(s) ��
		//    �ش� ���ڿ��� ã�Ƽ� ���ϴ� ���·� ����
		s = "�츮���� ���ѹα� ���ѵ��� ����";
		s = s.replaceAll("����", "����");		// -- ���Խ� ��� ����
		System.out.println(s);
		//--==>> �츮���� ���ֹα� ���ֵ��� ����
		
		s = "abcabcabcaaabcd";
		s = s.replace("abc", "T");				// -- ���Խ� ��� �Ұ�
		System.out.println(s);
		//--==>> TTTaaTd


		s = "abcabcabcaaabcd";
		System.out.println(s.replace("abc", "T"));
		// ���Խ� ����� �����ϹǷ� replace���� ���󵵰� ����
		System.out.println(s.replaceAll("[abc]", "T"));	
		//--==>> TTTaaTd
		//		 TTTTTTTTTTTTTTd


		// �� ���� ����
		s = "          ��          ��            ";
		System.out.println("|" + s + "|");
		//--==>> |          ��          ��            |

		System.out.println("|" + s.trim() + "|");	
		// trim() -> ��ġ ������̿� ����.
		//--==>> |��          ��|
		//--> ���� �����ڸ� ���� ����

		System.out.println("|" + s.replaceAll(" ", "") + "|");
		//--==>> |���|
		// --> ��� ���� ����


		//String temp = Integer.parseInt("30");
		s = Integer.toString(30);
		System.out.println(s);


		int n = 2345678;
		System.out.printf("%d", n);
		System.out.format("%d", n);
		//--==>> 23456782345678

		System.out.println();

		s = String.format("%d", n);
		System.out.println(s);
		//--==>> 2345678

		System.out.format("%.2f", 3.141592);
		System.out.println();

		s = String.format("%.2f", 3.141592);
		//"3.14";
		System.out.println(s);
		//--==>> 3.14

		String[] strArr = "�⺻,����,���".split(",");
		
		for (String str : strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> �⺻ ���� ���

	}
}