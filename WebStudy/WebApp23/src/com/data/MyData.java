// MyData.java
// - ����� ���� ������Ÿ�� Ȱ��

package com.data;

public class MyData
{
	// �ֿ� �Ӽ� ����
	private String name;
	private int age;
	
	// default ������ ������ ����� ���� ������
	public MyData()
	{
		
	}
	
	// �Ű����� 2���� ����� ���� ������
	public MyData(String name, int age)
	{
		this.name = name;
		this.age = age;
	}
	
	// getter / setter ����
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
	
	
}
