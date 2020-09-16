/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

// ���� �ڷᱸ�� ��ü ���� �� ���� ��
// ����� ���� Ŭ���� Ȱ�� -> �ڷ���

import java.util.Vector;

// ����� ���� Ŭ���� ���� -> �ڷ���ó�� Ȱ��
class MyData
{
	// �ֿ� �Ӽ� ���� -> �ֿ� ���� ����(��� ����)
	private String name;	//-- �̸�
	private int age;		//-- ����

	//getXxx() -> getter
	//setXxx() -> setter
	
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	// ������(�Ű����� 2���� ������) -> ����� ���� ������
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}

	// ������(�Ű������� ���� ������) -> ����� ���� ������
	public MyData()
	{
		name = "";
		age = 0;
	}
}

public class Test167
{
	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� v ����
		Vector<MyData> v = new Vector<MyData>();

		// ���� �ڷᱸ�� v�� 
		// �ڴٺ� 13�� / �ڹ��� 7�� / ������ 58��
		// ��Ƴ���
		
		// teachers code
		// 1
		/*
		MyData st1 = new MyData();
		st1.setName("�ڴٺ�");
		st1.setAge(13);
		v.add(st1);

		MyData st2 = new MyData();
		st2.setName("�ڹ���");
		st2.setAge(7);
		v.add(st2);

		MyData st3 = new MyData();
		st3.setName("������");
		st3.setAge(58);
		v.add(st3);
		*/

		//2
		/*
		MyData st1 = new MyData("�ڴٺ�", 13);
		v.add(st1);
		MyData st2 = new MyData("�ڹ���", 7);
		v.add(st2);
		MyData st3 = new MyData("������", 58);
		v.add(st3);
		*/

		//3
		v.add(new MyData("�ڴٺ�", 13));
		v.add(new MyData("�ڹ���", 7));
		v.add(new MyData("������", 58));

		// ���� �ڷᱸ�� v�� ��� ����(���) ��ü ����ϱ�
		// ���� ��)
		// �̸� : �ڴٺ�, ���� : 13��
		// �̸� : �ڹ���, ���� : 7��
		// �̸� : ������, ���� : 58��

		// 1
		for(MyData data : v)
		{
			String name = data.getName();
			int age = data.getAge();
			System.out.printf("�̸� : %s, ���� : %3d��\n", name, age);
		}
		System.out.println();
		//--==>> �̸� : �ڴٺ�, ���� :  13��
		//		 �̸� : �ڹ���, ���� :   7��
		//		 �̸� : ������, ���� :  58��

		// 2
		for(int i = 0; i < v.size(); ++i)
		{
			// v.get() or v.elementAt()
			String name = v.get(i).getName();
			int age = v.get(i).getAge();
			System.out.printf("�̸� : %s, ���� : %d��\n", name, age);
		}
		System.out.println();
		//--==>> �̸� : �ڴٺ�, ���� : 13��
		//		 �̸� : �ڹ���, ���� : 7��
		//		 �̸� : ������, ���� : 58��

		// 3
		for(Object temp : v)
		{
			System.out.printf("�̸� : %s, ���� : %d��\n",
				((MyData)temp).getName(), ((MyData)temp).getAge());
		}
		System.out.println();
		//--==>> �̸� : �ڴٺ�, ���� : 13��
		//		 �̸� : �ڹ���, ���� : 7��
		//		 �̸� : ������, ���� : 58��
	}
}
