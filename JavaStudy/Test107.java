
/*=======================================================
 ���� �޼ҵ� �ߺ�����(Method Overloading) ����
 - Method Overloadiing�� ������ ���¿� �Ұ����� ����
=========================================================*/


public class Test107
{
	public static void main(String[] args)
	{
		print('A');

		double result = print(10.0);
		print(10.0);
	}
	
	public static void print() {};
	public static void print(int i) {}
	// public static void print(int j) {}					// (X)
	public static void print(char c) {}						// �ڵ� �� ��ȯ ��Ģ check~!!!
	public static void print(int i, int j){}
	public static void print(double d) {}					// �ڵ� �� ��ȯ ��Ģ check~!!!
	//public static double print(double d) {return 3.14;}	// (X)
	//public static void print(double d) {return 3.14;}		// ���� �Ұ�
	//public static void print(double e) {}					// (X)

































}