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

 *********
  *******
   *****
    ***
     *
*/

public class Test063
{
	public static void main(String[] args)
	{
		int middle = 4;
		int limit = middle * 2;

		for(int i = 0; i < 5; ++i)
		{
			for(int j = 0; j <= limit; ++j)
			{
				// 경계선 왼쪽, 오른쪽 기준을 계산한다.
				int boundaryLeft = middle - (middle - i);
				int boundaryRight = middle + (middle - i);

				// 경계선 안쪽에 있다면 별을 출력하고
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