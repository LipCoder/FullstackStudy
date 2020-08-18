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
  1  2  3  4  5    00 ->
 10  9  8  7  6    <- 14
 11 12 13 14 15    20 ->
 20 19 18 17 16    <- 34 
 21 22 23 24 25    40 ->
계속하려면 아무 키나 누르세요...
*/


public class Test092
{
	public static void main(String[] args)
	{
		// teacher's code
		
		// 5행 5열 배열의 배열 준비
		int[][] arr = new int[5][5];

		// 배열 요소 초기화
		int n = 1;
		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
			{
				if(i % 2 == 0)
					arr[i][j] = n++;
				else 
					arr[i][4 - j] = n++;
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
		int[][] arr = new int[5][5];
		int n = 1;

		for(int i = 0; i < arr.length; ++i)
		{
			// 방향 기준을 정한다.
			boolean isRight = (i % 2 == 0);
			int lastIndex = arr[i].length - 1;
			
			// 방향 기준에 맞게 j값 초기화
			int j = (isRight) ? 0 : lastIndex;
			
			// 인덱스 범위를 벗어날때까지 반복
			for(; (0 <= j && j <= lastIndex) ;)
			{
				arr[i][j] = n++;
				
				// 방향 기준에 맞게 j값 갱신
				j = (isRight) ? j + 1 : j - 1;
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
  1  2  3  4  5
 10  9  8  7  6
 11 12 13 14 15
 20 19 18 17 16
 21 22 23 24 25
계속하려면 아무 키나 누르십시오 . . .
*/