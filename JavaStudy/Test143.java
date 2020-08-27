/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - StringBuffer Ŭ����
=========================================================*/

/*
�� StringBuffer Ŭ������
   ���ڿ��� ó���ϴ� Ŭ������ String Ŭ�������� �������� 
   String Ŭ������ *���� ���ڿ� �������� ������ �Ұ���*������
   StringBuffer Ŭ������ ���ڿ��� ����� ��
   *���� ���ڿ��� ���� �ܰ迡�� ������ �� �ִ�*�� ���̴�. (���ο� ���۸޸𸮸� ���� �����Ƿ�)

   ��, StringBuffer ��ü�� �������� ���̸� �����Ƿ�
   ��ü�� �����ϴ� �������� �̸� �� ũ�⳪ ���� �����ϰų�
   ���� ������ ������ ũ�⸦ �ٲ� �� �ִ� ����� �����Ѵ�.

   ����, JDK 1.5 ���ĺ��ʹ� 
   ���ڿ��� ó���ϴ� StringBuilder ��� Ŭ������ �����Ѵ�.
   StringBuilder Ŭ������ ����� StringBuffer Ŭ������ ����������
   ���� ū �������� multi-thread unsafe ��� ���̴�.
   ��, Syncronization�� ���� ������
   StringBuffer ���� ������ ���ü�(����ȭ) ������ ���ٸ�
   StringBuilder �� ����ϴ� ���� ������ ����ų �� �ִ�.
   (�ֳ��ϸ� ����ȭ �۾��� �����ϰ� ���� ������)
*/

public class Test143
{
	public static void main(String[] args)
	{
		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		//--==>> false
		//		 false
		// equals �޼ҵ嵵 false�� ���°��� ������...
		// equals�� String Ŭ����ó�� �������̵� ���� �ʾҴ�.

		System.out.println(sb1);
		System.out.println(sb1.toString());
		//--==>> korea
		//		 korea
		// toString�� �ؽ��ڵ尡 �ƴ� ���ڿ��� ���°��� ������...
		// toString�� �������̵� �Ͽ���.

		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true
		// �̷� ������ String�������� ��ȯ�Ͽ� StringŬ������ �޼ҵ带
		// ����� �� �ִ�.

		StringBuffer sb3 = new StringBuffer();
		// -- StringBuffer �⺻ ������ ȣ��(�ν��Ͻ� ���� ����)
		//    �⺻������ �����Ǵ� ���� ũ��� [16]


		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 16


		////////////////////////////////////////////////////////////////////////


		System.out.println(sb3);
		//--==>> ��

		/*
		String name = "ȫ�浿";
		name += "�̼���";
		name += "������";
		System.out.println(name);
		//--==>> ȫ�浿�̼��Ű�����
		*/

		sb3.append("seoul");	// sb3 += "seoul";
		sb3.append("korea");
		sb3.append("�츮����");
		sb3.append("���ѹα�");

		System.out.println(sb3);
		System.out.println(sb3.toString());
		//--==>> seoulkorea�츮������ѹα�
		//		 seoulkorea�츮������ѹα�

		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 34
		// append�� �ڵ����� �þ���� �ڵ����� �ٿ��ִ� ���� �������� �ʴ´�.


		/////////////////////////////////////////////////////////////////////////


		String temp1 = "java and oracle";
		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp2.toLowerCase());
		//--==>> java and oracle

		//System.out.println(sb3.toUppderCase());
		//System.out.println(sb3.toLowerCase());
		//--==>> ������ ����
		
		
		String temp3 = sb3.toString();
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA�츮������ѹα�


		System.out.println(sb3.toString());
		//--==>> seoulkorea�츮������ѹα�


		// �� ��� ���ڿ�(sb3) �� seoul �տ�
		//    ["�ѱ�"] �̶�� ���ڿ� �߰�
		sb3.insert(0, "�ѱ�");
		System.out.println("seoul �տ� [�ѱ�] �߰� : " + sb3.toString());
		//--==>> seoul �տ� [�ѱ�] �߰� : �ѱ�seoulkorea�츮������ѹα�

		// �� �۾��� �� �ڵ��� �ٸ��� sb3 ��ü�� ����� ���̴�.

		// �� ��� ���ڿ�(sb3) �� korea ���ڿ� �ڿ�
		//    ["���"]�̶�� ���ڿ� �߰�
		//    ��, ��� ���ڿ��� �ε����� ������ ���� Ȯ������ ����...

		// my code
		/*
		String strFind = "korea";
		int pos = sb3.indexOf(strFind) + strFind.length();
		// ã���� �߰�
		if(pos > strFind.length()) 
			sb3.insert(pos , "���");
		System.out.println(strFind + " �ڿ� [���] �߰� : " + sb3.toString());
		*/

		// �׽�Ʈ 1
		System.out.println(sb3.toString());
		//--==>> �ѱ�seoulkorea�츮������ѹα�

		// �׽�Ʈ 2
		/*
		sb3.insert(12, "���");
		System.out.println("korea �ڿ� [���] �߰� : " + sb3.toString());
		//--==>> korea �ڿ� [���] �߰� : �ѱ�seoulkorea����츮������ѹα�
		*/

		// �׽�Ʈ 3
		/*
		System.out.println(sb3.indexOf("korea"));
		//--==>> 7
		*/

		// �׽�Ʈ 4 -> index 7�� ����
		/*
		System.out.println(sb3.insert(sb3.indexOf("korea"), "���"));
		//--==>> �ѱ�seoul���korea�츮������ѹα�
		*/

		// �׽�Ʈ 5 -> index 12�� ���� (index 7 + 5)
		/*
		System.out.println(sb3.insert(sb3.indexOf("korea") + 5, "���"));
		//--==>> �ѱ�seoulkorea����츮������ѹα�
		*/

		//sb3.insert("korea"���ڿ��ε��� + "korea"���ڿ��Ǳ���, "���");
		sb3.insert(sb3.indexOf("korea") + "korea".length(), "���");
		//         --------------------   ----------------
		//                  7                    5

		System.out.println(sb3);
		//--==>> �ѱ�seoulkorea����츮������ѹα�

		// �� ��� ���ڿ�(sb3)����
		//    [�츮����] ���ڿ� ����

		// �ѱ�seoulkorea����츮������ѹα�
		//sb3.delete(14, 18);
		//System.out.println(sb3);
		//--==>> �ѱ�seoulkorea������ѹα�

		String delStr = "�츮����";
		int pos = sb3.indexOf(delStr);
		// ã����� ����
		if(pos != -1) 
			sb3.delete(pos, pos + delStr.length());
		System.out.println(sb3);
		//--==>> �ѱ�seoulkorea������ѹα�

		// �� ��� ���ڿ�(sb3)���� 
		//    [korea] ���� ���� ���ڿ� ����

		delStr = "korea";
		pos = sb3.indexOf(delStr);
		if(pos != -1) 
			sb3.delete(pos, sb3.length());
		System.out.println(sb3);
		//--==>> �ѱ�seoul

		
		/////////////////////////////////////////////////////////////////////////////


		// ���� ũ�� Ȯ��
		System.out.println("���� ũ�� : " + sb3.capacity());
		//--==>> ���� ũ�� : 34
		// ���� ũ��� �پ���� �ʾҴ�.

		// ���ڿ�(sb3)�� ���� Ȯ��
		System.out.println("���� ũ�� : " + sb3.length());
		//--==>> ���ڿ��� ���� : 7
		
		// ���� ũ�� ����
		// -> ���� ���ڿ��� ��Ƶ� �� �ִ� ������ ũ���...
		sb3.trimToSize();


		// ���� ũ�� ���� ���� ������ ũ�� Ȯ��
		System.out.println("���� ũ�� : " + sb3.length());
	}
}