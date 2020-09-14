/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

// ���� �ڷᱸ�� ��ü ���� �� ���� ��
// ����� ���� Ŭ���� Ȱ�� -> �ڷ���

import java.util.Vector;

public class Test167
{
	public static void main(String[] args)
	{
		// ���� �ڷᱸ�� v ����
		Vector<MyData> v = new Vector<MyData>();

		// ���� �ڷᱸ�� v�� 
		// �ڴٺ� 13�� / �ڹ��� 7�� / ������ 58��
		// ��Ƴ���

		v.add(new MyData("�ڴٺ�", 13));
		v.add(new MyData("�ڹ���", 7));
		v.add(new MyData("������", 58));
	}
}

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