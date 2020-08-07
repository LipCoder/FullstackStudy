/*=======================================================
	 ■■■ 연산자(Operator) ■■■
	 - 조건 연산자(-> 삼항 연산자)
=========================================================*/

/*
[ ?  : ]

피연산자  ?  연산자  :   피연산자
--------     ------      ---------
   1항         2항         3항


수식1 : 참(true) 또는 거짓(false)을 반환할 수 있는 수식 형태로 작성.
수식2 : 수식1의 처리 결과가 참(true)일 경우 수행하는 영역
수식3 : 수식1의 처리 결과가 거짓(false)일 경우 수행하는 영역

*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 짝수인지 홀수인지 판별할 수 있는 프로그램을 구현한다.
// 단, 조건연산자(삼항연산자)를 활용하여 작성할 수 있도록 한다.

// 실행 예)
// 임의의 정수 입력 : 5

// ==[판별 결과]==
// 5 -> 홀수
// ===============
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test026
{
    public static void main(String[] args)	throws IOException
    {
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int nNum;

		System.out.print("임의의 정수 입력 : ");
		nNum = Integer.parseInt(br.readLine());
		
		String type;
		type = (nNum % 2 == 1) ? "홀수" : "짝수";
		// 입력받은 정수가 홀수인지 짝수인지 확인하기 위한 연산
		// -> 입력값을 2로 나눈 나머지가 0이면      -> 짝수
		//								 0이 아니면 -> 홀수

		// type = (11 % 2 == 1) ? "홀수" : "짝수";
		// type = (1 == 1) ? "홀수" : "짝수";
		// type = (true) ? "홀수" : "짝수";
		// tyep = "홀수"
		

		System.out.print("\n==[판별 결과]==\n");
		System.out.printf("%d -> %s", nNum, type);
		System.out.print("\n===============\n");
		
    }
}

/*
임의의 정수 입력 : 10

==[판별 결과]==
10 -> 짝수
===============
계속하려면 아무 키나 누르십시오 . . .
*/