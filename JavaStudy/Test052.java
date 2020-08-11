/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
=========================================================*/

// ○ 과제
// 사용자로부터 임의의 정수를 입력받아
// 1부터 입력받은 그 수 까지의 
// 전체 합과, 짝수의 합과, 홀수의 합을 
// 각각 결과값으로 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력 : 270
// 1 ~ 270 까지 정수의 합 : xxxxx
// 1 ~ 270 까지 짝수의 합 : xxxx
// 1 ~ 270 까지 홀수의 합 : xxxx
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int inputNum, num, even, odd, sum;
		even = odd = num = sum = 0;
		
		System.out.print("임의의 정수 입력 : ");
		inputNum = Integer.parseInt(br.readLine());
		
		// 1 ~ inputNum 까지의 정수, 짝수, 홀수의 합을 구한다.
		while(num <= inputNum)
		{
			sum += num;
			if(num % 2 == 0) 
				even += num;
			else 
				odd += num;
			++num;
		}

		System.out.printf("1 ~ %d 까지 정수의 합 : %d\n", inputNum, sum);
		System.out.printf("1 ~ %d 까지 짝수의 합 : %d\n", inputNum, even);
		System.out.printf("1 ~ %d 까지 홀수의 합 : %d\n", inputNum, odd);
	}
}