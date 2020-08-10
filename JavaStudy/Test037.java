/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 과제
// 사용자로부터 임의의 정수 5개를 입력받아
// 짝수, 홀수별 합계를 출력하는 프로그램을 구현한다.
// 단, Scanner를 활용하여 공백으로 구분된 데이터를
// 한번에 입력받아 처리할 수 있도록 한다.

// 실행 예)
// 정수 5개(공백구분)를 입력하세요 : 12 3 4 5 6

// >> 짝수의 합은 22 이고, 홀수의 합은 8 입니다.
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.io.IOException;

public class Test037
{
    public static void main(String[] args) throws IOException
    {
		Scanner sc = new Scanner(System.in);

		int a, b, c, d, e;			// 입력받을 변수
		int oddSum = 0, evenSum = 0; // 홀수합, 짝수합

		// Scanner 클래스 nextInt() 메서드를 사용
		// 공백을 구분하여 정수 5개를 입력받아 
		// 다섯 개의 변수에 넣어준다.
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		d = sc.nextInt();
		e = sc.nextInt();
		
		// 각각의 값을 홀수, 짝수인지 판별하고
		// 홀수합, 짝수합에 더해준다.
		if(a % 2 == 0) evenSum += a;
		else oddSum += a;

		if(b % 2 == 0) evenSum += b;
		else oddSum += b;

		if(c % 2 == 0) evenSum += c;
		else oddSum += c;

		if(d % 2 == 0) evenSum += d;
		else oddSum += d;

		if(e % 2 == 0) evenSum += e;
		else oddSum += e;

		System.out.printf("\n>> 짝수의 합은 %d 이고, 홀수의 합은 %d 입니다.\n", evenSum, oddSum);
    }
}