/*=======================================================
      ■■■ 정렬(sort) 알고리즘 ■■■
	  - 선택 정렬(Selection Sort)
=========================================================*/

/*
○ 정렬
   : 데이터를 특정한 규칙(기준)에 맞게 순서대로 나열(오름차순, 내림차순)

○ 정렬의 목적
   : 데이터 처리 과정의 편의성이나 가독성을 높이기 위함
     -> 보기 좋게... 검색하기 위함

○ 정렬의 종류
   : 선택 정렬, 버블 정렬, 삽입 정렬, 힙 정렬, 퀵 정렬, 쉘 정렬

*/

// 실행 예)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// 계속하려면 아무 키나 누르세요...

public class Test110
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};
		
		System.out.print("Source Data : ");

		/*
		-- for each 문

		for(요소의데이터타입 변수명 : 자료구조)
		{
			변수명....
		}
		*/


		for(int n : a)
		{
			System.out.print(n + " ");
		}
		System.out.println();
		

		for(int i = 0; i < a.length - 1; ++i)			// 비교 기준 데이터(0    1     2    3)
		{                                               //				    |	 |	   |	|
			for(int j = i + 1; j < a.length; ++j)		// 비교 대상 데이터(1234 234   34   4
			{
				if(a[i] > a[j])
				{
					int temp = a[i];
					a[i] = a[j];
					a[j] = temp;
				}
			}
		}

		System.out.print("Sorted Data : ");

		for(int n : a)
		{
			System.out.print(n + " ");
		}
		System.out.println();

		/*
		42 52 12 62 60
		== --

		12 52 42 62 60
		==    --

		12 52 42 62 60
		==       --
		
		12 52 42 62 60
		==          --
		-----------------------------1회전

		12 42 52 62 60
		   == --

		12 42 52 62 60
		   ==    --

		12 42 52 62 60
		   ==       --
		-----------------------------2회전

		12 42 52 62 60
		      == --

		12 42 52 62 60
		      ==    --
		-----------------------------3회전		

		12 42 52 60 62
		         == --
		-----------------------------4회전

		*/
	}
}