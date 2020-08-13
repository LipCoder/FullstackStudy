/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
	 - 다중 for문(반복문의 중첩) 활용한 
=========================================================*/

// ○	과제
//		다음과 같은 내용이 출력될 수 있도록
//		반복문의 중첩 구문을 작성하여 프로그램을 구현한다.

// 실행 예)
/*

     *
    ***
   *****
  *******
 *********
  *******
   *****
    ***
     *

*/


public class Test065
{
	public static void main(String[] args)
	{	

		int middle = 4;
		int limit = middle * 2;

		for(int i = 0; i <= limit; ++i)
		{
			// 경계선 기준을 정한다.
			int boundary = (i - middle) < 0 ? -(i - middle) : (i - middle);

			// 경계선 왼쪽, 오른쪽 기준을 계산한다.
			int boundaryLeft = middle - (middle - boundary);
			int boundaryRight = middle + (middle - boundary);
			
			for(int j = 0; j <= limit; ++j)
			{
				// 왼쪽 경계선 안쪽(오른쪽)에 있거나
				// 오른쪽 경계선 안쪽(왼쪽)에 있으면 별을 출력하고
				// 그렇지 않은 경우는 공백을 출력한다.
				if(boundaryLeft <= j && j <= boundaryRight) 
					System.out.print("*");
				else
					System.out.print(" ");
			}
			
			System.out.println();
		}
	}
}



















