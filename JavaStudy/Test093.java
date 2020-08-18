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
  1  8  9 16 17
  2  7 10 15 18
  3  6 11 14 19
  4  5 12 13 20
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test093
{
	public static void main(String[] args)
	{
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		int[][] arr = new int[4][5];

		int n = 0;

		for(int i = 0; i < 5; i++)		//  i -> 0 1 2 3 4
		{	
			for(int j = 0; j < 4; j++)	//  j -> 0 1 2 3
			{
				n++;
				if(i % 2 == 0)
					arr[j][i] = n;
				else
					arr[3 - j][i] = n;

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
		int[][] arr = new int[4][5];

		int n = 1;

		for(int i = 0; i < arr[0].length; ++i)
		{
			// ���� ������ ���Ѵ�.
			boolean isDown = (i % 2 == 0);
			int lastIndex = arr.length - 1; //
		 	
			// ���� ���ؿ� �°� j�� �ʱ�ȭ
			int j = (isDown) ? 0 : lastIndex;
			
			// �ε��� ������ ��������� �ݺ�
			for(; (0 <= j && j <= lastIndex) ;)
			{
				arr[j][i] = n++;
				
				// ���� ���ؿ� �°� j�� ����
				j = (isDown) ? j + 1 : j - 1;
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
  1  8  9 16 17
  2  7 10 15 18
  3  6 11 14 19
  4  5 12 13 20
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/