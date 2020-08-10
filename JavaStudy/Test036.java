/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 사용자로부터 임의의 정수 세 개를 입력받아
// 작은 수에서 큰 수 순으로 출력하는 프로그램을 구현한다.

// 실행 예)
// 첫 번째 정수 입력 : 112
// 두 번째 정수 입력 : 8
// 세 번쨰 정수 입력 : 21

// >> 정렬 결과 : 8 21 112
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test036
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b, c;		// 사용자가 입력하는 임의의 정수를 담아둘 변수
		int tmp;

		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력 : ");
		c = Integer.parseInt(br.readLine());


		if(a > b) // 첫 번째 정수(a)가 두 번째 정수(b)보다 크다면...
		{
			// a와 b의 자리를 바꾼다.
			a = a ^ b;
			b = b ^ a;
			a = a ^ b;
		}

		if(a > c)	// 첫 번째 정수(a)가 세 번째 정수(c)보다 크다면...
		{
			// a와 c의 자리를 바꾼다.
			a = a ^ c;
			c = c ^ a;
			a = a ^ c;
		}

		if(b > c)	// 두 번째 정수(b)가 세 번째 정수(c)보다 크다면...
		{
			// b와 c의 자리를 바꾼다.
			b = b ^ c;
			c = c ^ b;
			b = b ^ c;
		}

		// 최종 결과 출력 -> a, b, c 순서대로 출력
		System.out.printf("정렬 결과 : %d %d %d\n", a, b, c);

		// my code
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b, c;
		int first, second, third;

		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());

		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("세 번째 정수 입력 : ");
		c = Integer.parseInt(br.readLine());

		// 1 
		third = (a > b) ? (a > c ? a : c) : (b > c ? b : c);	// 최대값
		first = (a < b) ? (a < c ? a : c) : (b < c ? b : c);	// 최소값
		second = (a < b) ? (a > c ? a : (b < c ? b : c)) : (b > c ? b : (a < c ? a : c));
		
		// 2
		if(a < b)
		{
			if(b < c)	
			{
				first = a; second = b; third = c;			
			}	
			else
			{
				if(a < c)	// 아직 a, c는 비교하지 않았으므로
				{
					first = a; second = c; third = b;
				}
				else
				{
					first = c; second = a; third = b;
				}
			}
		}
		else // if(a > b)
		{
			if(a < c)
			{
				first = b; second = a; third = c;			
			}	
			else
			{
				if(b < c)  // 아직 b, c는 비교하지 않았으므로
				{
					first = b; second = c; third = a;
				}
				else
				{
					first = c; second = b; third = a;
				}
			}
		}
		

		System.out.printf("정렬 결과 : %d %d %d\n", first, second, third);
		*/
	}
}

/*
첫 번째 정수 입력 : 5
두 번째 정수 입력 : 2
세 번째 정수 입력 : 3
정렬 결과 : 2 3 5
계속하려면 아무 키나 누르십시오 . . .

첫 번째 정수 입력 : 55
두 번째 정수 입력 : 55
세 번째 정수 입력 : 11
정렬 결과 : 11 55 55
계속하려면 아무 키나 누르십시오 . . .

*/