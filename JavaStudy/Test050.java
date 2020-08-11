/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
=========================================================*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 소수인지 아닌지를 판별하여
// 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력 : 100
// 100 -> 소수 아님
// 계속하려면 아무 키나 누르세요...

// 임의의 정수 입력 : 11
// 11 -> 소수
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test050
{
	public static void main(String[] args) throws IOException
	{	
		// teacher's code
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num;

		System.out.print("임의의 정수 입력 : ");
		num = Integer.parseInt(br.readLine());
		
		int n = 2;
		
		//String flag = "소수다";
		boolean flag = true;

		// 반복문은 적게 돌수록 리소스 소모가 적다 (빠르다)
		while(n < num) // num = 7 -> n = 2 ~ 6 / num = 50 -> n = 2 ~ 49
		{
			if(num % n == 0)
			{
				flag = false;
				break;
			}

			n++;
		}

		// 결과 출력
		if(flag && num != 1)
		{
			System.out.printf("%d -> 소수\n", num);
		}
		else
		{
			System.out.printf("%d -> 소수아니다\n", num);
		}
		

		// my code
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int inputNum;
		// 1은 항상 나눠지므로 2부터 시작
		int compNum = 2, count = 0;

		System.out.print("임의의 정수 입력 : ");
		inputNum = Integer.parseInt(br.readLine());

		while(compNum <= inputNum)
		{
			if(inputNum % compNum == 0) ++count;
			++compNum;
		}
			
		// 자기 자신만 나눠 진다면 count는 한번만 증가할 것이므로 
		if(count == 1) System.out.printf("%d -> 소수\n", inputNum);
		else  System.out.printf("%d -> 소수 아님\n", inputNum);
		*/

	}
}