/*=======================================================
	 ���� �迭 ����
	 - �迭�� �迭(2���� �迭)
=========================================================*/

// �迭�� �迭(������ �迭)�� Ȱ���Ͽ�
// ������ ���� �����͸� ��ҷ� ���ϴ� �迭(5*5)�� �����ϰ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �迭�� �����ϴ� ������ ����ϴ� ������
// ������ �ۼ��� �� �ֵ��� �Ѵ�.

// ���� ��)
/*
  1  2  3  4  5  ->  1 2 3 4 5  ->  i=0 j=0 -> 1���
  5  1  2  3  4  ->  1 2 3 4 5  ->  i=1 j=1 -> 1���
  4  5  1  2  3  ->  1 2 3 4 5  ->  i=2 j=2 -> 1���
  3  4  5  1  2  ->  1 2 3 4 5  ->  i=3 j=3 -> 1���
  2  3  4  5  1  ->  1 2 3 4 5  ->  i=4 j=4 -> 1���
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test090
{
	public static void main(String[] args)
	{
		// teacher's code
		int[][] arr = new int[5][5];

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = i, n = 1; n<=5; n++)
			{
				arr[i][j] = n;	    // 00 -> 1  11 -> 1  22 -> 1
									// 01 -> 2  12 -> 2  23 -> 2
									// 02 -> 3  13 -> 3  24 -> 3
									// 03 -> 4  14 -> 4  20 -> 4
									// 04 -> 5  10 -> 5  21 -> 5
				j++;
				if(j == 5) j = 0;
			}
		}

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}

		// my code
		/*
		int[][] arr = new int[5][5];
		int n = 1;
		
		int[] num = {1, 2, 3, 4, 5};

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = num[j];
			}
			
			int lastIdx = num.length - 1;
			// ������ ���� ������� ���̹Ƿ� �̸� �޾Ƴ��´�.
			int lastNum = num[lastIdx];

			// �迭�� ��ĭ�� �о��ش�.
			for(int j = lastIdx; j > 0 ; --j)
			{
				num[j] = num[j - 1];
			}

			// �޾Ƴ��� ������ ���� ù��° ��ġ�� �����Ѵ�.
			num[0] = lastNum;
		}

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}
		*/
	}
}

/*
  1  2  3  4  5
  5  1  2  3  4
  4  5  1  2  3
  3  4  5  1  2
  2  3  4  5  1
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/