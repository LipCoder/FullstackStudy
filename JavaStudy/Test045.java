/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
=========================================================*/

// 1부터 100까지의 정수 중에서
// 짝수들의 합과 홀수들의 합을 따로 구분하여 계산한다.
// 그리고 그 결과값을 출력하는 프로그램을 구현한다.
// 단, 반복문은 while 문을 사용할 수 있도록 하며,
// 조건 구문은 if 조건문을 사용하여 작성할 수 있도록 한다.

// 실행 예)
// 1 부터 100 까지의 정수 중
// 짝수의 합 : 2550
// 홀수의 합 : 2500
// 계속하려면 아무 키나 누르세요

public class Test045
{
	public static void main(String[] args)
	{
		// teacher's code
		int n = 1;
		int even = 0;
		int odd = 0;

		while(n <= 100)
		{
			if(n % 2 == 0) 
			{
				even += n;
			}
			else if(n % 2 != 0)
			{
				odd += n;
			}
			else
			{
				System.out.println("판별 불가 데이터");
				return; // --메소드 종료 -> main() 메소드 종료 -> 프로그램 종료
			}
			++n;
		}
		
		System.out.println("1 부터 100 까지의 정수 중");
		System.out.println("짝수의 합 : " + even);
		System.out.println("홀수의 합 : " + odd);

		// my code
		/*
		int i = 0, sumEven = 0, sumOdd = 0;
		while(++i <= 100)
		{
			if(i % 2 == 0) sumEven += i;
			else sumOdd += i;
			
			// int tmp = (i % 2 == 0) ? (sumEven += i) : (sumOdd += i);
		}

		System.out.println("짝수의 합 : " + sumEven);
		System.out.println("홀수의 합 : " + sumOdd);
		*/
	}
}

/*
짝수의 합 : 2550
홀수의 합 : 2500
계속하려면 아무 키나 누르십시오 . . .
*/