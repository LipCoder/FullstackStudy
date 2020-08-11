/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
=========================================================*/

// ○ 과제
// 사용자로부터 원하는 단(구구단)을 입력받아
// 이에 해당하는 구구단을 출력하는 프로그램을 구현한다.
// 단, 1 ~ 9단 사이의 수를 입력받은 상황이 아니라면
// 프로그램을 종료해 버릴 수 있도록 처리한다.

// 실행 예)
// 원하는 단(구구단) 입력 : 7
// 7 * 1 = 7
// 7 * 2 = 14
// ...
// 7 * 9 = 63
// 계속하려면 아무 키나 누르세요...

// 원하는 단(구구단) 입력 : 11
// 1부터 9까지의 정수만 입력이 가능합니다.
// 계속하려면 아무 키나 누르세요...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test053
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int num;
		int count = 1;

		System.out.print("원하는 단(구구단) 입력 : ");
		num = Integer.parseInt(br.readLine());
		
		// 1 ~ 9가 아닌 경우 구구단을 출력하지 않는다.
		if(num < 1 || num > 9)
		{
			System.out.println("1부터 9까지의 정수만 입력이 가능합니다.");
			return;
		}

		while(count <= num)
		{
			System.out.printf("%d * %d = %d\n", num, count, (num * count));
			++count;
		}
	}
}