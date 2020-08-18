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
  1  2  3  4  5    00 ->
 10  9  8  7  6    <- 14
 11 12 13 14 15    20 ->
 20 19 18 17 16    <- 34 
 21 22 23 24 25    40 ->
����Ϸ��� �ƹ� Ű�� ��������...
*/


public class Test092
{
	public static void main(String[] args)
	{
		// teacher's code
		
		// 5�� 5�� �迭�� �迭 �غ�
		int[][] arr = new int[5][5];

		// �迭 ��� �ʱ�ȭ
		int n = 1;
		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				if(i % 2 == 0)
					arr[i][j] = n++;
				else 
					arr[i][4 - j] = n++;
			}
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}
		
		/*
		int[][] arr = new int[5][5];
		int n = 1;

		for(int i = 0; i < arr.length; ++i)
		{
			// ���� ������ ���Ѵ�.
			boolean isRight = (i % 2 == 0);
			int lastIndex = arr[i].length - 1;
			
			// ���� ���ؿ� �°� j�� �ʱ�ȭ
			int j = (isRight) ? 0 : lastIndex;
			
			// �ε��� ������ ��������� �ݺ�
			for(; (0 <= j && j <= lastIndex) ;)
			{
				arr[i][j] = n++;
				
				// ���� ���ؿ� �°� j�� ����
				j = (isRight) ? j + 1 : j - 1;
			}
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
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
 10  9  8  7  6
 11 12 13 14 15
 20 19 18 17 16
 21 22 23 24 25
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/