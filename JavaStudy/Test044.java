/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
=========================================================*/

// 1 ���� 100 ������ ���� �߿���
// ¦������ ���� ����Ͽ� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, ���ǹ��� ������� �ʵ��� �ϸ�,
// while �ݺ����� Ȱ���Ͽ� �ذ��� �� �ֵ��� �Ѵ�.

// ���� ��)
// 1 ���� 100������ �� �� ¦���� �� : xxx
// ����Ϸ��� �ƹ� Ű�� ��������...

public class Test044
{
	public static void main(String[] args)
	{
		int num = 0, sum = 0;
		while((num += 2) <= 100 && (sum += num) > 0);
		System.out.println("1 ���� 100������ �� �� ¦���� �� : " + sum);
	}
}

/*
1 ���� 100������ �� �� ¦���� �� : 2550
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/