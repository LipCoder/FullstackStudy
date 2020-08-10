/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 조건문(분기문)
	 - switch 문 실습
=========================================================*/

/*
○ 다중 선택문이라 하며, switch 문 다음의 수식 값에 따라
   실행 순서를 여러 방향으로 분기할 때 사용하는 문장이다.

○ 형식 및 구조
   switch(수식)
   {
	   case 상수1 : 문장1; [break;]
	   case 상수2 : 문장2; [break;]
	   			  .
				  .
	   [default : 문장 n+1; [break;]]
   }

   switch 문의 [수식]과 case의 [상수]는
   byte, short, int, long 형이어야 한다.

   case 문 뒤에 [break;]가 없는 형태인 경우
   다음 case 문장을 계속해서(이어서) 수행하게 도니다. (-> 기본 모델)



*/
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
public class Test039
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String name;
		int kor, eng, math, avg;
		char grade;

		System.out.print("이름 입력 : ");
		name = br.readLine();
		System.out.print("국어점수 입력 : ");
		kor = Integer.parseInt(br.readLine());
		System.out.print("영어점수 입력 : ");
		eng = Integer.parseInt(br.readLine());
		System.out.print("수학점수 입력 : ");
		math = Integer.parseInt(br.readLine());

		avg = (kor + eng + math) / 3;
		grade = 'F';

		/*
		if(avg >= 90)
			grade = 'A';
		else if(avg >= 80)
			grade = 'B';
		else if(avg >= 70)
			grade = 'C';
		else if(avg >= 60)
			grade = 'D';
		else
			grade = 'F';
		*/

		switch((avg / 10) * 10)
		{
			case 100: 
			case 90: grade = 'A'; break;
			case 80: grade = 'B'; break;
			case 70: grade = 'C'; break;
			case 60: grade = 'D'; break;
			// default: grade = 'F'; // 초기화를 이미 했으므로 생략 가능
		}
		
		System.out.println();
		System.out.printf("당신의 이름은 %s 입니다.\n", name);
		System.out.printf("총점은 %d, 평균은 %d 입니다.\n", (kor + eng + math), avg);
		System.out.printf("등급은 %c 입니다.\n", grade);
	}
}