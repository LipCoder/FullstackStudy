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
  A							->
  C  B						<-
  D  E  F					->
  J  I  H  G				<-
  K  L  M  N  O				->
����Ϸ��� �ƹ� Ű�� ��������...
*/


public class Test097
{
	public static void main(String[] args)
	{
		int[][] arr = new int[5][5];
		
		char c = 'A';

		for(int i = 0; i < arr.length; ++i)
		{
			boolean isRight = (i % 2 == 0);
			int lastIdx = arr[i].length - 1;

			int j = (isRight) ? 0 : lastIdx;

			for(; (0 <= j && j <= lastIdx) ;)
			{
				if(j > i) arr[i][j] = ' ';
				else arr[i][j] = c++;

				j = (isRight) ? j + 1 : j - 1;
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