/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - break
=========================================================*/

// 다음과 같은 처리가 이루어지는 프로그램을 구현한다.
// 단, 입력받는 정수는 1 ~ 100 범위 안에서만
// 가능하도록 처리한다.

// 실행 예)

// 임의의 정수 입력 : -10

// 임의의 정수 입력 : 0

// 임의의 정수 입력 : 2020

// 임의의 정수 입력 : 10
// >> 1 ~ 10 까지의 합 : 55
// 계속하시겠습니까?(Y/N) : Y

// 임의의 정수 입력 : 100
// >> 1 ~ 100 까지의 합 : 5050
// 계속하시겠습니까?(Y/N) : N
// 계속하시려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test066
{
	public static void main(String[] args) throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n, s, i;
		// -- n : 외부로부터 사용자의 입력값을 담아둘 변수
		//    s : 누적합 연산 결과를 담아둘 변수
		//    i : 1부터 1씩 사용자의 입력값까지 증가할 변수

		char ch;
		// -- 프로세스를 계속 진행할지의 여부를 담아둘 변수
		//    (Y / y / N / n)
		
		while(true)
		{
			do
			{
				System.out.print("\n임의의 정수 입력 : ");
				n = Integer.parseInt(br.readLine());
			}
			while (n < 1 || n > 100);
	
			s = 0;

			for(i = 1; i <= n; i++)
				s += i;

			System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", n, s);

			System.out.print("계속하시겠습니까?(Y/N) : ");
			ch = (char)System.in.read();

			if(ch != 'Y' && ch != 'y')
			{
				// 반복문(while)을 빠져나갈 수 있는 코드 작성 필요
				// -- 위와 같은 의사표현을 했다면
				//    그동안 수행했던 반복문을 멈추고 빠져나가야 한다.
				break;
				// -- 멈춘다. ( + 그리고 빠져나간다.) check~!!!
			}
		} // while_end

		

		// my code
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int num;
		char isExit;
		
		while(true)
		{
			System.out.print("\n임의의 정수 입력 : ");
			num = Integer.parseInt(br.readLine());
			
			boolean isDone = false;
			
			if(1 <= num && num <= 100) 
			{
				int sum = 0;
				for(int i = 1; i <= num; ++i) sum += i;

				System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", num, sum);
				isDone = true;
			}
		
			if(isDone)
			{
				while(true)
				{
					System.out.print("계속하시겠습니까?(Y/N) : ");
					isExit = (char)System.in.read();
				
					// 첫번째로 입력받은 문자를 제외한 나머지를 버퍼에서 지워줌
					br.readLine();	
					//System.in.skip(2);

					if(isExit == 'Y' || isExit == 'y') break;
					else if(isExit == 'N' || isExit == 'n') return;
					else System.out.println("잘못된 입력!!!");
				}
			}
		}
		*/
	} // main()_end
} // calss_end
