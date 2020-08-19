/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
	 - �������а� ��������������
=========================================================*/

import java.util.Scanner;

class CircleTest2
{
	// ���� ����(Information Hiding)
	// ��� ����, �ν��Ͻ� ����, ���� ����(�� Ŭ���� ��������)
	// [private] �̶�� ���������������� ������
	// Ŭ���� ���ο����� ���� �� ������ �����ϰ� �ϰڴٴ� �ǹ�
	// int �� ���� 0���� �ʱ�ȭ ����
	private int r;
	
	//int r;

	// getter / setter ����
	/*
	int getR()
	{
		return r;
	}

	void setR(int r)
	{
		this.r = r;
	}
	*/

	void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("������ �Է� : ");
		r = sc.nextInt();
	}

	double calArea()
	{
		return r * r * 3.141592;
	}
	
	void write(double a)
	{
		System.out.println("������ : " + r);
		System.out.println("��  �� : " + a);
	}

}

public class Test101
{
	public static void main(String[] args)
	{
		CircleTest2 ob = new CircleTest2();
		
		// -- error: r has private access in CircleTest2
		//ob.r = 10;
		//System.out.println("���� ������ : " + ob.r);

		// getter / setter ���
		//ob.setR(100);
		//System.out.println("���� ������ : " + ob.getR());
		// --==>> ���� ������ : 100

		ob.input();
		// --==>> ������ �Է� : 1000
		// ob.r = 1000;

		double result = ob.calArea();
		ob.write(result);
		/*
		--==>>	������ �Է� : 2000
				������ : 2000
				��  �� : 1.2566368E7
				����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . 
		*/


	}
}