/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
	 - ������(Constructor)
=========================================================*/

public class Test080
{
	int n;
	int m;

	// ������(Constructor)
	Test080()
	{
		n = 100;
		m = 200;
		System.out.println("������ ����...");
	}

	// �ʱ�ȭ ��(Initialized Block)
	{
		n = 20;
		m = 40;
		System.out.println("�ʱ�ȭ �� ����...");
	}

	Test080(int n, int m)
	{
		this.n = n;
		this.m = m;
		System.out.println("�Ű����� �ִ� ������ ����...");
	}

	void write()
	{
		System.out.println("n : " + n + ", m : " + m);
	}
	
	
	public static void main(String[] args)
	{
		Test080 ob = new Test080();
		ob .write();
		/*
		�ʱ�ȭ �� ����...
		������ ����...
		n : 100, m : 200
		����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
		*/

		Test080 ob2 = new Test080(1234, 4567);
		ob2.write();
		/*
		�ʱ�ȭ �� ����...
		�Ű����� �ִ� ������ ����...
		n : 1234, m : 4567
		����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
		*/
	}
}