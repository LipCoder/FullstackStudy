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
  1  8  9 16 17
  2  7 10 15 18
  3  6 11 14 19
  4  5 12 13 20
계속하려면 아무 키나 누르세요...
*/

public class Test093
{
	public static void main(String[] args)
	{
		// 배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[4][5];

		int n = 0;

		for(int i = 0; i < 5; i++)		//  i -> 0 1 2 3 4
		{	
			for(int j = 0; j < 4; j++)	//  j -> 0 1 2 3
			{
				n++;
				if(i % 2 == 0)
					arr[j][i] = n;
				else
					arr[3 - j][i] = n;

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
		int[][] arr = new int[4][5];

		int n = 1;

		for(int i = 0; i < arr[0].length; ++i)
		{
			// 방향 기준을 정한다.
			boolean isDown = (i % 2 == 0);
			int lastIndex = arr.length - 1; //
		 	
			// 방향 기준에 맞게 j값 초기화
			int j = (isDown) ? 0 : lastIndex;
			
			// 인덱스 범위를 벗어날때까지 반복
			for(; (0 <= j && j <= lastIndex) ;)
			{
				arr[j][i] = n++;
				
				// 방향 기준에 맞게 j값 갱신
				j = (isDown) ? j + 1 : j - 1;
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
  1  8  9 16 17
  2  7 10 15 18
  3  6 11 14 19
  4  5 12 13 20
계속하려면 아무 키나 누르십시오 . . .
*/