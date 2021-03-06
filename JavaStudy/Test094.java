/*=======================================================
	 ■■■ 배열 ■■■
	 - 배열의 배열(2차원 배열)
=========================================================*/

// ○ 과제
// 배열의 배열(다차원 배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열(5*5)을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 배열을 구성하는 구문과 출력하는 구문은
// 별도로 작성할 수 있도록 한다.

// 실행 예)
/*
 E J O T Y
 D I N S X
 C H M R W
 B G L Q V
 A F K P U
계속하려면 아무 키나 누르세요...
*/

public class Test094
{
	public static void main(String[] args)
	{
		int[][] arr = new int[5][5];
		char c = 'A';

		for(int i = 0; i < arr[0].length; ++i)
		{
			for(int j = 0; j < arr.length; ++j)
			{
				arr[(arr.length - 1) - j][i] = c++;
			}
		}

		for(int i = 0; i < arr.length; ++i)
		{
			for(int j = 0; j < arr[i].length; ++j)
			{
				System.out.printf("%c ", arr[i][j]);
			}
			System.out.println();
		}
	}
}

