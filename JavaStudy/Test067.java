/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - continue
=========================================================*/

// continue 구문을 활용하여
// 다음과 같이 출력될 수 있도록 프로그램을 구현한다.

// 실행 예)
/*
1 : 1
3 : 4
5 : 9

  :
  
99 : 2500
*/

public class Test067
{
	public static void main(String[] args)
	{
		int num = 0, sum = 0;
		while(++num <= 100)
		{
			if(num % 2 == 0) continue;
			System.out.printf("%2d : %4d\n", num, sum += num);
		}
	}
}