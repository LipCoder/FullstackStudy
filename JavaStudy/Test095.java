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
  1   2   3   4  10
  5   6   7   8  26
  9  10  11  12  42
 13  14  15  16  58
 26  32  36  40 136
����Ϸ��� �ƹ� Ű�� ��������...
*/


public class Test095
{
	public static void main(String[] args)
	{
		int[][] arr = new int[5][5];

		int n = 0;

		for(int i = 0; i < 4; i++)		// i -> 0 1 2 3
		{ 
			for(int j = 0; j < 4; j++)	// j -> 0 1 2 3
			{
				n++;					// n -> 1 2 3 4 5 6 7 ...
				arr[i][j] = n;

				arr[i][4] += arr[i][j];
				arr[4][j] += arr[i][j];
				arr[4][4] += arr[i][j];
			}
		}
		
		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%4d", arr[i][j]);
			}
			System.out.println();
		}


		// my code
		/*
		int[][] arr = new int[5][5];
		
		int lastIdx_X = arr[0].length - 1;
		int lastIdx_Y = arr.length - 1;

		int n = 1;

		// ���� ���� �̸� ��� ���س���
		for(int i = 0; i < lastIdx_Y; ++i)
		{
			int sumX = 0;

			for(int j = 0; j < lastIdx_X; ++j)
			{
				arr[i][j] = n++;
				sumX += arr[i][j];
			}
			arr[i][lastIdx_X] = sumX;
		}
		
		// ���� ����
		for(int i = 0; i < arr[0].length; ++i)
		{
			int sumY = 0;

			for(int j = 0; j < lastIdx_Y; ++j)
			{
				sumY += arr[j][i];
			}
			arr[lastIdx_Y][i] = sumY;
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%4d", arr[i][j]);
			}
			System.out.println();
		}
		*/
	}
}

/*
   1   2   3   4  10
   5   6   7   8  26
   9  10  11  12  42
  13  14  15  16  58
  28  32  36  40 136
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/