/*=======================================================
      ���� ����(sort) �˰��� ����
	  - ���� ����(Insert Sort)
=========================================================*/

// ���� ��)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// ����Ϸ��� �ƹ� Ű�� ��������...

public class Test112
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};

		System.out.print("Source Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();

		
		for(int i = 1; i < a.length; ++i)		
		{
			int t = a[i];
			int j = i - 1;

			while((j >= 0) && (t < a[j]))
			{
				a[j + 1] = a[j]; 
				--j;
			}
			a[j + 1] = t;
		}
		

		System.out.print("Sorted Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();


		/*
		52 42 12 62 60

		52 42 12 62 60			t 42
		-- ==
		42 52 12 62 60			t 42

		--------------------------------------

		42 52 52 62 60			t 12
		   -- ==
		42 42 52 62 60			t 12
		--    ==
		12 42 52 62 60			t 12

		--------------------------------------

		12 42 52 62 60			t 62
			  -- ==
		12 42 52 62 60			t 62

		--------------------------------------
		
		12 42 52 62 60			t 60
		         -- ==
		12 42 52 60 62			t 60

		*/
	}
}