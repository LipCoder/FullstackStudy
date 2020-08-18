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
  1  2  3  4  5  i=0  n=1
  2  3  4  5  6  i=1  n=2
  3  4  5  6  7  i=2  n=3
  4  5  6  7  8  i=3  n=4
  5  6  7  8  9  i=4  n=5
계속하려면 아무 키나 누르세요...
*/

public class Test089
{
	public static void main(String[] args)
	{
		// 배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[5][5];
		int n;

		for(int i = 0; i < arr.length; i++)
		{
			n = i + 1;
			for(int j = 0; j < arr[i].length; j++)
			{
				arr[i][j] = n;
				n++;
			}
		}

		// 전체 요소 출력
		for(int i = 0; i < arr.length; i++)
		{
			for(int j = 0; j < arr[i].length; j++)
				System.out.printf("%3d", arr[i][j]);
			
			System.out.println();
		}

		/*
		int[][] arr = new int[5][5];

		for(int i = 0 ; i < arr.length; ++i)
		{
			int n = i + 1;
			for(int j = 0; j < arr[i].length; ++j)
			{
				arr[i][j] = n++;
			}
		}

		for(int i = 0 ; i < arr.length; ++i)
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
  2  3  4  5  6
  3  4  5  6  7
  4  5  6  7  8
  5  6  7  8  9
계속하려면 아무 키나 누르십시오 . . .
*/