/*=======================================================
      ���� ����(sort) �˰��� ����
	  - ���� ����(Bubble Sort)
=========================================================*/

/*
�� ����
   : �����͸� Ư���� ��Ģ(����)�� �°� ������� ����(��������, ��������)

�� ������ ����
   : ������ ó�� ������ ���Ǽ��̳� �������� ���̱� ����
     -> ���� ����... �˻��ϱ� ����

�� ������ ����
   : ���� ����, ���� ����, ���� ����, �� ����, �� ����, �� ����

*/

// ���� ��)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// ����Ϸ��� �ƹ� Ű�� ��������...



public class Test111
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};
		
		int i, j;

		System.out.print("Source Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();

		for(i = 1; i < a.length; i++)		
		{                                               
			for(j = 0; j < a.length - i; j++)
			{
				// �׽�Ʈ(Ȯ��)
				// System.out.print("[" + j + ", " + (j + 1) + "]");

				if(a[j] > a[j + 1]) // �������� ����
				{
					a[j] = a[j] ^ a[j + 1];
					a[j + 1] = a[j + 1] ^ a[j];
					a[j] = a[j] ^ a[j + 1];
				}
			}
		}

		System.out.print("Sorted Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();

		/*
		System.out.print("Source Data : ");
		for(int n : a)
		{
			System.out.print(n + " ");
		}
		System.out.println();
		

		for(int i = 0; i < a.length - 1; ++i)			// �� ���� ������(0    1     2    3)
		{                                               //				    |	 |	   |	|
			for(int j = 0; j < a.length - i - 1; ++j)	// �� ��� ������(1234 234   34   4)
			{
				if(a[j] > a[j + 1])
				{
					int temp = a[j];
					a[j] = a[j + 1];
					a[j + 1] = temp;
				}
			}
		}

		System.out.print("Sorted Data : ");
		for(int n : a)
		{
			System.out.print(n + " ");
		}
		System.out.println();
		*/

		/*

		52 42 12 62 60
		
		42 52 12 62 60
		== --

		42 12 52 62 60
		   == --

		42 12 52 62 60
			  == --

		42 12 52 60 62
			     == --
		---------------------------------

		42 12 52 60 62

		12 42 52 60 62
		== --

		12 42 52 60 62
		   == --

		12 42 52 60 62
		      == --
		---------------------------------

		12 42 52 60 62
		== --
		   == --
		---------------------------------
		12 42 52 60 62
		== --

		*/
	}
}