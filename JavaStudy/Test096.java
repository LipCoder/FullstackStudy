/*=======================================================
	 ���� �迭 ����
	 - �迭�� �迭(2���� �迭)
=========================================================*/

// �� ����
// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭(5*5)�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �迭�� �����ϴ� ������ ����ϴ� ������
// ������ �ۼ��� �� �ֵ��� �Ѵ�.

// ���� ��)
/*
  A
  B  C
  D  E  F
  G  H  I  J
  K  L  M  N  O
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test096
{
	public static void main(String[] args)
	{
		int[][] arr = new int[5][5];
		
		char c = 'A';

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				if(j > i) arr[i][j] = ' ';
				else arr[i][j] = c++;
			}
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%3c", arr[i][j]);
			}
			System.out.println();
		}
	}
}