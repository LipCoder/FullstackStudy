/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - if문, if-else문
=========================================================*/

// 사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
// 다음과 같은 형태로 출력하는 프로그램을 작성한다.
// 이 때, 등급은 평균 점수를 기준으로 처리한다.

// 90점 ~ 100점 : A		80 ~ 89점 : B
// 70점 ~ 79점  : C		60 ~ 69점 : B
// 60점미만     : F

// 입력받는 과정은 BufferedReader를 활용할 수 있도록 하며,
// printf() 메소드를 통해 출력할 수 있도록 구현한다.

// 실행 예)
// 이름 입력 : 안혜지
// 국어 점수 : 90
// 영어 점수 : 80
// 수학 점수 : 70

// >> 당신의 이름은 안혜지 입니다.
// >> 국어 점수는 90,
// >> 영어 점수는 80,
// >> 수학 점수는 70,
// >> 총점은 240, 평균은 80입니다.
// >> 등급은 B 입니다.
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test031
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String name;
		int korScore, engScore, mathScore, totalScore, avrScore;
		char grade;

		// 입력
		System.out.print("이름 입력 : ");
		name = br.readLine();

		System.out.print("국어 점수 : ");
		korScore = Integer.parseInt(br.readLine());

		System.out.print("영어 점수 : ");
		engScore = Integer.parseInt(br.readLine());
	
		System.out.print("수학 점수 : ");
		mathScore = Integer.parseInt(br.readLine());

		// 연산
		totalScore = korScore + engScore + mathScore;
		avrScore = (int)(totalScore / 3.0);

		if(avrScore >= 90) 
		{
			grade = 'A';
		}
		else if(avrScore >= 80)
		{
			grade = 'B';
		}
		else if(avrScore >= 70)
		{
			grade = 'C';
		}
		else if(avrScore >= 60)
		{
			grade = 'D';
		}
		else
		{
			grade = 'F';
		}
		
		// 출력
		System.out.println();
		System.out.printf(">> 당신의 이름은 %s입니다.\n", name);
		System.out.printf(">> 국어 점수는 %d\n", korScore);
		System.out.printf(">> 영어 점수는 %d\n", engScore);
		System.out.printf(">> 수학 점수는 %d\n", mathScore);
		System.out.printf(">> 총점은 %d, 평균은 %d 입니다.\n", totalScore, (avrScore));
		System.out.printf(">> 등급은 %c 입니다.\n", grade);
	}
}

/*

*/