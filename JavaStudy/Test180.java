/*=======================================================
      ���� �ڹ��� �⺻ �����(I/O) ����
=========================================================*/

// ��� ���ۿ� flush()

public class Test180
{
	public static void main(String[] args)
	{
		// System.out : �ڹ� �⺻ ��� ��Ʈ��

		System.out.write(65); //-- 'A'
		System.out.write(66); //-- 'B'
		

		// �ѱ��� �����ڵ�� 2����Ʈ �̹Ƿ�
		// �̷��� 1����Ʈ�� �ΰ��� �����Ͽ� ���
		System.out.write(180); // 
		System.out.write(235); //-- 180 + 235 -> '��'

		// ��� ���۰� �� ä������ ������
		// ����� ������(�ڷ�)�� ��� ����̽�(��ġ) ������ �ʱ� ������
		// flush() �޼ҵ带 ���� ���� �� ä������ ���� 
		// ��� ������ ������ ��� ��ġ�� �о�� ���� �� �ֵ���
		// ó���ؾ� �Ѵ�.
		System.out.flush();
		//-- ���� ���������� �����ϰ� �Ǹ� ������ ��µ��� ����
	}
}