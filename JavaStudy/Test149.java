/*=======================================================
      ■■■ 자바의 주요(중요) 클래스 ■■■
	  - Calendar 클래스
=========================================================*/

// 오늘 날짜를 기준으로
// 입력받는 날짜만큼 후의 연, 월, 일, 요일을
// 확인한여 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 오늘 날짜 : 2020-8-28 금요일
// 몇 일 후의 날짜를 확인하고자 하십니까? : 200

// ========[ 확인 결과 ]========
// 200일 후 : 2021-xx-xx x요일
// =============================
// 계속하려면 아무 키나 누르세요...

// ※ 현재 날짜를 기준으로 날 수를 더하는 연산 메소드
//    [객체.add(Calendar.DATE, 날 수)]

import java.util.Calendar;
import java.util.Scanner;

public class Test149
{
	public static void main(String[] args)
	{
		// Scanner 클래스 기반 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		// Calendar 클래스 기반 인스턴스 생성
		Calendar now = Calendar.getInstance();

		// 주요 변수 선언
		int nalsu;			//-- 사용자로부터 입력받은 날 수
		int y, m, d, w;		//-- 연, 월, 일, 요일
		String[] week = {"일", "월", "화", "수", "목", "금", "토"};

		// 현재의 연, 월, 일, 요일 확인 (가져오기 -> get())
		y = now.get(Calendar.YEAR);
		m = now.get(Calendar.MONTH) + 1; // check~!!!
		d = now.get(Calendar.DATE);
		w = now.get(Calendar.DAY_OF_WEEK);

		// 현재의 연, 월, 일, 요일 확인결과 출력
		System.out.println("오늘 날짜 : " + y + "-" + m + "-" + d
							+ " " + week[w-1] + "요일");

		do
		{
			System.out.print("몇 일 후의 날짜를 확인하고자 하십니까? : ");
			nalsu = sc.nextInt();
		}
		while (nalsu < 1);

		// check~!!!
		now.add(Calendar.DATE, nalsu);


		// 최종 결과 출력
		System.out.println();
		System.out.println("========[ 확인 결과 ]========");
		System.out.printf("%d일 후 : %tF %tA\n", nalsu, now, now);	// %tF -> 날짜 출력 서식, %tA -> 요일 출력 서식 
		System.out.println("=============================");

		/*
		Calendar c = Calendar.getInstance();
		Scanner s = new Scanner(System.in);

		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH);
		int d = c.get(Calendar.DATE);

		char[] wArr = { '\0', '일', '월', '화', '수', '목', '금', '토' };
		int w = c.get(Calendar.DAY_OF_WEEK);

		System.out.printf("오늘 날짜 : %d-%d-%d %c요일\n", y, m + 1, d, wArr[w]);

		int dayAfter;
		System.out.print("몇 일 후의 날짜를 확인하고자 하십니까? : ");
		dayAfter = s.nextInt();

		c.add(Calendar.DATE, dayAfter);

		y = c.get(Calendar.YEAR);
		m = c.get(Calendar.MONTH);
		d = c.get(Calendar.DATE);
	    w = c.get(Calendar.DAY_OF_WEEK);

		System.out.print("\n========[ 확인 결과 ]========\n");
		System.out.printf("%d일 후 : %d-%d-%d %c요일\n", dayAfter, y, m + 1, d, wArr[w]);
		System.out.println("=============================");
		*/
	}
}

/*
오늘 날짜 : 2020-8-28 금요일
몇 일 후의 날짜를 확인하고자 하십니까? : 200

========[ 확인 결과 ]========
200일 후 : 2021-03-16 화요일
=============================
계속하려면 아무 키나 누르십시오 . . .
*/