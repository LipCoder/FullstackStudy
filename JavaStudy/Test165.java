/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

import java.util.Vector;
import java.util.Collections;
public class Test165
{
	// ���� ���ڿ� �迭 ���� �� �ʱ�ȭ
	private static final String[] colors
		= {"����", "���", "�ʷ�", "�Ķ�", "����", "����"};

	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� ����
		Vector<String> v = new Vector<String>();

		// ���� �ڷᱸ�� v �� colors �����͸� ��ҷ� �߰�
		for(String color : colors)
			v.add(color);

		System.out.println("ù ��° ��� : " + v.firstElement());
		System.out.println("�� ��° ��� : " + v.get(1));
		System.out.println("������  ��� : " + v.lastElement());
		System.out.println("�����  ���� : " + v.size());
		//--==>> ù ��° ��� : ����
		//		 �� ��° ��� : ���
		//		 ������  ��� : ����
		//		 �����  ���� : 6

		// �� ù ��° ��Ҹ� "�Ͼ�"���� ��.��. -> set()
		v.set(0, "�Ͼ�");

		System.out.println("ù ��° ��� : " + v.firstElement());
		//--==>> ù ��° ��� : �Ͼ�
		System.out.println("�� ��° ��� : " + v.get(1));
		//--==>> �� ��° ��� : ���
		System.out.println("�����  ���� : " + v.size());
		//--==>> �����  ���� : 6

		// �� ù ��° ��ҿ� "��Ȳ" ��.��.    -> add(), insertElementAt()
		v.add(0, "��Ȳ");
		//v.insertElementAt("��Ȳ", 0);

		System.out.println("ù ��° ��� : " + v.firstElement());
		// ù ��° ��� : ��Ȳ
		System.out.println("�� ��° ��� : " + v.get(1));
		// �� ��° ��� : �Ͼ�
		System.out.println("�����  ���� : " + v.size());
		//--==>> �����  ���� : 7 

		// �� ��ü ���
		System.out.print("��ü ��� : ");
		for(Object o : v)
		{
			if(o instanceof String)
				System.out.print(o + " ");
		}
		System.out.println();
		//--==>> ��ü ��� : ��Ȳ �Ͼ� ��� �ʷ� �Ķ� ���� ����


		// �� �������� ����
		Collections.sort(v);
		
		// �� ��ü ���
		System.out.print("�������� ���� �� ��ü ��� : ");
		for(String s : v)
			System.out.print(s + " ");
		System.out.println();
		//--==>> �������� ���� �� ��ü ��� : ��� ���� ���� ��Ȳ �ʷ� �Ķ� �Ͼ�
		
		// �� �˻�
		// Collections.binarySearch()
		// �˻� ��� ����
		// ��, �������� ������ ����Ǿ� �ִ� �ڷῡ ���ؼ��� ����� �����ϴ�. check
		// �˻� ����� �������� ���� ��� ������ ��ȯ�Ѵ�.

		int idxBlue = Collections.binarySearch(v, "�Ķ�");
		System.out.printf("�Ķ� : %d��° �ε����� ��ġ�ϰ� �ִ�.\n", idxBlue);
		System.out.println();
		//--==>> �Ķ� : 5��° �ε����� ��ġ�ϰ� �ִ�.
		
		int idxNavi = Collections.binarySearch(v, "����");
		System.out.printf("���� : %d��° �ε����� ��ġ�ϰ� �ִ�.\n", idxBlue);
		System.out.println();
		//--==>> ���� : -1��° �ε����� ��ġ�ϰ� �ִ�.
		//		 -> �˻� ��� ����

		// �� �������� ����
		Collections.sort(v, Collections.reverseOrder());

		// �� ��ü ���
		System.out.print("�������� ���� �� ��ü ��� : ");
		for(String s : v)
			System.out.print(s + " ");
		System.out.println();
		//--==>> �������� ���� �� ��ü ��� : �Ͼ� �Ķ� �ʷ� ��Ȳ ���� ���� ���

		// �� �������� ���� �� �˻�
		idxBlue = Collections.binarySearch(v, "�Ķ�");
		System.out.printf("�Ķ� : %d��° �ε����� ��ġ�ϰ� �ִ�.\n", idxBlue);
		System.out.println();
		//--==>>�Ķ� : -8��° �ε����� ��ġ�ϰ� �ִ�.
		// �������� ���� �� �˻��ϸ�? �̻��ϴ�??

		idxBlue = Collections.binarySearch(v, "�Ķ�",  Collections.reverseOrder());
		System.out.printf("�Ķ� : %d��° �ε����� ��ġ�ϰ� �ִ�.\n", idxBlue);
		System.out.println();
		//--==>> �Ķ� : 1��° �ε����� ��ġ�ϰ� �ִ�.
		// -> ���� ������ ����
		//    �Ͼ� �Ķ� �ʷ� ��Ȳ ���� ���� ���
	}
}