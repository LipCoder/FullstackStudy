/*=======================================================
	 ■■■ 배열 ■■■
	 - 배열의 배열(2차원 배열)
=========================================================*/

// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열(5*5)을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 배열을 구성하는 구문과 출력하는 구문은
// 별도로 작성할 수 있도록 한다.

// 실행 예)
/*
  1  2  3  4  5  ->  1 2 3 4 5  ->  i=0 j=0 -> 1출발
  5  1  2  3  4  ->  1 2 3 4 5  ->  i=1 j=1 -> 1출발
  4  5  1  2  3  ->  1 2 3 4 5  ->  i=2 j=2 -> 1출발
  3  4  5  1  2  ->  1 2 3 4 5  ->  i=3 j=3 -> 1출발
  2  3  4  5  1  ->  1 2 3 4 5  ->  i=4 j=4 -> 1출발
계속하려면 아무 키나 누르세요...
*/

public class Test090
{
	public static void main(String[] args)
	{
		// teacher's code
		int[][] arr = new int[5][5];

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = i, n = 1; n<=5; n++)
			{
				arr[i][j] = n;	    // 00 -> 1  11 -> 1  22 -> 1
									// 01 -> 2  12 -> 2  23 -> 2
									// 02 -> 3  13 -> 3  24 -> 3
									// 03 -> 4  14 -> 4  20 -> 4
									// 04 -> 5  10 -> 5  21 -> 5
				j++;
				if(j == 5) j = 0;
			}
		}

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}

		// my code
		/*
		int[][] arr = new int[5][5];
		int n = 1;
		
		int[] num = {1, 2, 3, 4, 5};

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = num[j];
			}
			
			int lastIdx = num.length - 1;
			// 마지막 값은 덮어씌워질 것이므로 미리 받아놓는다.
			int lastNum = num[lastIdx];

			// 배열을 한칸씩 밀어준다.
			for(int j = lastIdx; j > 0 ; --j)
			{
				num[j] = num[j - 1];
			}

			// 받아놓은 마지막 값을 첫번째 위치에 대입한다.
			num[0] = lastNum;
		}

		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
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
  5  1  2  3  4
  4  5  1  2  3
  3  4  5  1  2
  2  3  4  5  1
계속하려면 아무 키나 누르십시오 . . .
*/