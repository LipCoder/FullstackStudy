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
 E J O T Y
 D I N S X
 C H M R W
 B G L Q V
 A F K P U
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test094
{
	public static void main(String[] args)
	{
		int[][] arr = new int[5][5];
		char c = 'A';

		for(int i = 0; i < arr[0].length; ++i)
		{
			for(int j = 0; j < arr.length; ++j)
			{
				arr[(arr.length - 1) - j][i] = c++;
			}
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%c ", arr[i][j]);
			}
			System.out.println();
		}
	}
}

