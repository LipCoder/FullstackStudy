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

     *
    ***
   *****
  *******
 *********
  *******
   *****
    ***
     *

*/


public class Test065
{
	public static void main(String[] args)
	{	

		int middle = 4;
		int limit = middle * 2;

		for(int i = 0; i <= limit; ++i)
		{
			// ��輱 ������ ���Ѵ�.
			int boundary = (i - middle) < 0 ? -(i - middle) : (i - middle);

			// ��輱 ����, ������ ������ ����Ѵ�.
			int boundaryLeft = middle - (middle - boundary);
			int boundaryRight = middle + (middle - boundary);
			
			for(int j = 0; j <= limit; ++j)
			{
				// ���� ��輱 ����(������)�� �ְų�
				// ������ ��輱 ����(����)�� ������ ���� ����ϰ�
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



















