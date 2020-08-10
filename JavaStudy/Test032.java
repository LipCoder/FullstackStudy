/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가... 짝수인지, 홀수인지, 영인지
// 결과를 판별하여 출력하는 프로그램을 구현한다.

// 실행 예)
// 임의의 정수 입력 : 4
// 4 -> 짝수
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test032
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;

		System.out.print("임의의 정수 입력 : ");
		n = Integer.parseInt(br.readLine());

		/*
		if(n % 2 == 0)
		{
			System.out.println(n + " -> 짝수");
		}
		else if(n % 2 != 0)
		{
			System.out.println(n + " -> 홀수");
		}
		else if(n == 0)
		{
			System.out.println(n + " -> 영");
		}
		*/

		// else 문이 없으므로 값을 초기화 시켜준다.
		String result = "판별 불가";

		if(n == 0)
		{
			result = "영";
		}
		else if(n % 2 == 0)
		{
			result = "짝수";
		}
		else if(n % 2 != 0)
		{
			result = "홀수";
		}

		System.out.println(n + " -> " + result);

		// my code 
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		
		int num;
		String type;

		System.out.print("임의의 정수 입력 : ");
		num = Integer.parseInt(br.readLine());
	
		if(num == 0)
		{
			type = "영";
		}
		else
		{
			type = (num % 2 == 0) ? "짝수" : "홀수";
		}
		
		System.out.printf("%d -> %s\n", num, type);
		*/
	}
}

// ※ 조건문을 구성할 때에는 항상 조건의 구성 순서에 유의해야 한다.

// ※ 조건문의 구성 과정에서 이외의 영역(else)을
//    업무에 포함된 내용으로 처리하는 것은 바람직하지 않을 경우가 있다.
//    불가능한 경우는 어쩔 수 없더라도
//    가급적이면 업무에 포함되지 않은 내용을
//    이외의 영역(else)에서 처리할 수 있도록 하자.

