/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
	 - ���� for��(�ݺ����� ��ø) Ȱ��
=========================================================*/

// ���� ��)
/*
[2��]
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
...
2 * 9 = 18

[3��]
3 * 1 = 3
3 * 2 = 6
3 * 3 = 8
...
3 * 9 = 27

...

[9��]
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
...
9 * 9 = 81
����Ϸ��� �ƹ� Ű�� ��������...
*/

public class Test058
{
	public static void main(String[] args)
	{
		int i, j;

		// ��~ ��~
		for(i = 2;i <= 9; ++i)		// �� ó��(outer)				// -> 2 3 4 5 6 7 8 9
		{
			//System.out.print("��");
			System.out.printf("====[%d��]====\n", i);		
			// ��~ ��~
			for(j = 1; j <= 9; ++j)	// �������� �� ó��(inner)		// -> 1 2 3 4 5 6 7 8 9
			{
				//System.out.print("��");
				System.out.printf("%d * %d = %2d\n", i, j, (i * j));
			}
			System.out.println();
		}

		/*
		for(int i = 2; i <= 9; ++i)
		{
			System.out.printf("[%d��]\n", i);
			for(int j = 1; j <= 9; ++j)
			{
				System.out.printf("%d * %d = %d\n", i, j, i * j);
			}
			System.out.println();
		}
		*/
	}
}