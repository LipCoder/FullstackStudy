/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
=========================================================*/

// ���� ���̿� �ѷ� ���ϱ�
// ���� ���̿� �ѷ��� ���� �� �ִ� Ŭ������ �����Ѵ�.
// (Ŭ������ : CircleTest)
//  -> CircleTest.java

// ���� ���� = ������ * ������ * 3.141592
// ���� �ѷ� = ������ * 2 * 3.141592

// ���� ��)
// ������ �Է� : xx

// �������� xx�� ����
// ���� : xxx.xx
// �ѷ� : xxx.xx
// ����Ϸ��� �ƹ� Ű�� ��������...

/* java.io. --> package��� �θ��� */
import java.io.IOException;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		CircleTest c = new CircleTest();
		
		c.input();		
		// input �޼��� ������ IOException�� throw �ǹǷ� �̸� main���� �޾Ƽ� throw����� �Ѵ�.
		// �ֳ��ϸ� main �޼��尡 input �޼��带 ǰ�� �ֱ� �����̴�.

		double a  = c.calcArea();
		double r = c.calcRound();

		c.print(a, r);
	}
}
