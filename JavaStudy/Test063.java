/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
	 - ���� for��(�ݺ����� ��ø) Ȱ���� 
=========================================================*/

// ��	����
//		������ ���� ������ ��µ� �� �ֵ���
//		�ݺ����� ��ø ������ �ۼ��Ͽ� ���α׷��� �����Ѵ�.

// ���� ��)
/*

 *********
  *******
   *****
    ***
     *
*/

public class Test063
{
	public static void main(String[] args)
	{
		int middle = 4;
		int limit = middle * 2;

		for(int i = 0; i < 5; ++i)
		{
			for(int j = 0; j <= limit; ++j)
			{
				// ��輱 ����, ������ ������ ����Ѵ�.
				int boundaryLeft = middle - (middle - i);
				int boundaryRight = middle + (middle - i);

				// ��輱 ���ʿ� �ִٸ� ���� ����ϰ�
				// �׷��� ���� ���� ������ ����Ѵ�.
				if(boundaryLeft <= j && j <= boundaryRight) 
					System.out.print("*");
				else
					System.out.print(" ");
			}
			System.out.println();
		}
	}
}