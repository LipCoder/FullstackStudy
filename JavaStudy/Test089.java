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
  1  2  3  4  5  i=0  n=1
  2  3  4  5  6  i=1  n=2
  3  4  5  6  7  i=2  n=3
  4  5  6  7  8  i=3  n=4
  5  6  7  8  9  i=4  n=5
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test089
{
	public static void main(String[] args)
	{
		// �迭�� �迭 ���� �� �޸� �Ҵ�
		int[][] arr = new int[5][5];
		int n;

		for(int i = 0; i < arr.length; i++)
		{
			n = i + 1;
			for(int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = n;
				n++;
			}
		}

		// ��ü ��� ���
		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
				System.out.printf("%3d", arr[i][j]);
			
			System.out.println();
		}

		/*
		int[][] arr = new int[5][5];

		for(int i = 0 ; i < arr.length; ++i)
		{
			int n = i + 1;
			for(int j = 0; j < arr[i].length; ++j)
			{
				arr[i][j] = n++;
			}
		}

		for(int i = 0 ; i < arr.length; ++i)
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
  2  3  4  5  6
  3  4  5  6  7
  4  5  6  7  8
  5  6  7  8  9
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/