/*=======================================================
      ■■■ 정렬(sort) 알고리즘 ■■■
	  - 삽입 정렬(Insert Sort)
=========================================================*/

// 실행 예)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// 계속하려면 아무 키나 누르세요...

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
			for(int j = i; j > 0 ; --j)
			{
				// 만약 왼쪽이 오른쪽보다 크다면 덮어쓴다.
				if(a[j - 1] > a[j]) a[j] = a[j - 1];
				// 만약 오른쪽이 왼쪽보다 크다면 냅둔다.

				if(a[j - 1] < t)
				{
					a[j] = t;
					break;
				}

				if(j - 1 == 0)
				{
					a[j - 1] = t;
				}
			}
			for(int n : a)
				System.out.print(n + " ");
			System.out.println();
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