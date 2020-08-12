/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
	 - 다중 for문(반복문의 중첩) 활용
=========================================================*/

// 1부터 100까지 수 중 소수만 출력하는 프로그램을 구현한다.
// 단, for문의 중첩 구문을 활용하여 작성할 수 있도록 하며
// 5개가 출력될 때 마다 개행 처리할 수 있도록 한다.

// 실행 예)
// ====[1부터 100사이의 소수]====
//    2    3    5    7    11
//   13  ...
// 계속하려면 아무 키나 누르세요...

public class Test059
{
	public static void main(String[] args)
	{
		int divisor;
		int count = 0;

		System.out.println("====[1부터 100사이의 소수]====");
		for(int number = 2; number <= 100; number++)
		{
			for(divisor = 2; number % divisor != 0; divisor++);

			if(divisor == number)
			{
				System.out.printf("%5d", number);
				
				// 확인 
				// System.out.printf("number : %d, divisor : %d\n", number, divisor);

				if(++count % 5 == 0)
					System.out.println();
			}
		}
	

		// my code
		/*
		int newLineCount = 0;
		System.out.println("====[1부터 100사이의 소수]====");
		
		

		for(int i = 1; i <= 100; ++i)
		{
			for(int j = 2; j <= i; ++j)
			{
				if(i % j == 0) 
				{
					// 자기 자신하고만 나눠지는 경우 소수
					if(i == j)
					{
						System.out.printf("%4d", i);
						++newLineCount;
					}
					else break;
				}
			}	

			if(newLineCount >= 5)
			{
				System.out.println();
				newLineCount = 0;
			}
		}
		*/
		

		/*
		for(int i = 1; i <= 100; ++i)
		{
			boolean isPrime = false;
			if(i == 1 || i % 2 == 0 || i % 3 == 0 || i % 5 == 0 || i % 7 == 0)
			{
				if(i == 2 || i == 3 || i == 5 || i == 7)
				{
					isPrime = true;
				}
			}
			else
			{
				isPrime = true;
			}
			
			if(isPrime)
			{
				System.out.printf("%4d", i);
			}
		}
		*/
	}
}

/*
====[1부터 100사이의 소수]====
    2    3    5    7   11
   13   17   19   23   29
   31   37   41   43   47
   53   59   61   67   71
   73   79   83   89   97
계속하려면 아무 키나 누르십시오 . . .
*/












