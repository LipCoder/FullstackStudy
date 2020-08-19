/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
	 - 클래스 설계
	 - 배열 활용
	 - 정보은닉과 접근제어지시자
=========================================================*/

// 사용자로부터 년, 월, 일을 입력받아
// 해당 날짜의 요일을 출력하는 프로그램을 구현한다.
// 단, 달력 클래스(Calendar)는 사용하지 않는다.
// 또한, 클래스의 개념을 활용하여 작성할 수 있도록 한다. (WeekDay 설계)
// 그리고, 배열의 개념도 적용시켜 작성할 수 있도록 한다.
// 접근제어지시자의 개념도 확인하여 작성할 수 있도록 한다.
// 최종적으로 WeekDay 클래스의 설계를 통해
// Test102 클래스의 main() 메소드가 정상적으로 프로그램 실행될 수 있도록 한다.

// 실행 예)
// 년 월 일 입력[공백 구분] : 2020 8 19

// 2020년 8월 19일 -> 수요일
// 계속하려면 아무 키나 누르세요...


// 1년 1월 1일 -> 월요일
// 윤년 -> 366, 평년 -> 365
// 윤달 -> 29, 평달 -> 28

import java.util.Scanner;


class WeekDay
{
	// 주요 변수 선언
	private int y, m, d;		// --사용자가 입력한 년, 월, 일을 담아낼 변수

	// 메소드 정의 -> 입력받기
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("년 월 일 입력[공백 구분] : ");
		y = sc.nextInt();
		m = sc.nextInt();
		d = sc.nextInt();
	}

	// 메소드 정의 -> 요일 산출하기
	public String week()
	{
		// 각 월의 마지막 날짜(각 월의 최대값)를 배열 형태로 구성
		int[] months = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		// 테스트 
		//System.out.println(months.length);
		// --==>> 12

		// 요일 이름에 대한 배열 구성
		String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};

		// 날 수를 종합할 변수
		int nalsu = 0;

		// 윤년에 따른 2월의 날 수 계산
		// 입력 년도가 윤년이라면... 2월의 마지막 날짜를 29일로 설정
		// 입력 년도가 평년이라면... 2월의 마지막 날짜를 28일로 설정
		if(y % 4 == 0 && y % 100 != 0 || y % 400 == 0)	// -- 윤년이라면...
		{
			// 2월의 마지막 날짜를 29일로 설정
			months[1] = 29;

		}
		else											// -- 평년이라면...
		{
			// 2월의 마지막 날짜를 28일로 설정
			months[1] = 28;
		}

		// 1. 1년 1월 1일 ~ 입력받는 년도의 이전 년도 12월 13까지의 날 수 계산
		//					-------------
		//                       y
		//                  -------------------------
		//							y - 1

		// 입력이전년도*365 + 입력이전년도/4 - 입력이전년도/100 + 입력이전년도/400
		nalsu = (y - 1) * 365 + (y - 1) / 4 - (y - 1) / 100 + (y - 1) / 400;

		// 테스트(확인)
		//System.out.println("날 수 : " + nalsu);
		// --==>> 날 수 : 737424 (2020 8 19 입력 기준)
		// 1. 1. 1 ~ 2019. 12. 31의 총 날 수 

		// 2. 입력받은 월의 이전 월 까지의 날 수 계산 후
		//    이 계산 결과를 1번 결과에 누적하는(더하는) 연산
		for(int i = 0; i < (m-1); i++)
		{
			nalsu += months[i];
		}
		// 737424 + 31 + 29 + 31 + 30 + 31 + 30 + 31

		// 테스트(확인)
		//System.out.println("날 수 : " + nalsu);
		// --==>> 날 수 : 737637 (2020 8 19 입력 기준)
		// 1. 1. 1 ~ 2020. 7. 31의 총 날 수 

		// 3. 입력받은 일의 날짜만큼 날 수 계산 후
		//    2번 결과에 누적하는(더하는) 연산
		nalsu += d;

		// 테스트(확인)
		//System.out.println("날 수 : " + nalsu);
		// --==>> 날 수 : 737656 (2020 8 19 입력 기준)
		// 1. 1. 1 ~ 2020. 8. 19의 총 날 수 

		// --------------------- 여기까지 수행하면 날 수 연산 끝~!!

		// 무슨 요일인지 확인하기 위한 연산
		int w = nalsu % 7;		// 전체날수 % 7 == 0 -> 일요일
								// 전체날수 % 7 == 1 -> 월요일
								// 전체날수 % 7 == 2 -> 화요일
								// ..

		// 테스트(확인)
		//System.out.println("요일 : " + w);
		// --==>> 요일 : 3 (2020 8 19 입력 기준) -> 수요일

		return weekNames[w];
		// 0 -> "일"
		// 0 -> "월"
		// ..
	}

	// 메소드 정의 -> 결과 출력하기
	public void print(String day)
	{
		System.out.printf("%d년 %d월 %d일 -> %s요일\n", y, m, d, day);
	}
}

public class Test102
{
	public static void main(String[] args)
	{
		// WeekDay 기반 인스턴스 생성
		WeekDay wd = new WeekDay();

		// 입력 메소드 호출
		wd.input();

		// 요일 산출 메소드 호출 및 결과 확인
		String result = wd.week();

		// 출력 메소드 호출
		wd.print(result);
	}

}
/*
년 월 일 입력[공백 구분] : 2020 8 19
2020년 8월 19일 -> 수요일
계속하려면 아무 키나 누르십시오 . . .
*/

// my code
/*
class WeekDay 
{
	// 윤년, 평년 일수
	private final int NORMAL_YEAR_DAYS = 365;
	private final int LEAP_YEAR_DAYS = NORMAL_YEAR_DAYS + 1;

	// 각 월별 일수
	// 배열은 0번째 부터 시작하므로 
	// 가독성을 위해 0번째 자리를 공백으로 생각한다.
	private final int NONE = 0;
	private final int[] monthDays = {NONE, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 요일
	private final char[] weekArr = {'일', '월', '화', '수', '목', '금', '토'};
	
	private int year, month, day;

	// 값을 넣는다.
	private boolean input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("년 월 일 입력[공백 구분] : ");
		year = sc.nextInt();
		month = sc.nextInt();
		day = sc.nextInt();

		// 잘못된 입력 check
		if(year < 0) return false;
		if(month < 1 || month > 12) return false;
		if(day < 1 || day > dayCountOfMonth(month)) return false;

		return true;
	}

	// 요일을 계산한다.
	private char calculateWeek()
	{
		// 1년 1월 1일부터 구하는 year month day까지의
		// 일수를 담기 위한 변수
		int passingDays = 0;

		// year까지 몇일이 흘렀는지 계산
		for(int i = 1; i < year; ++i)
		{
			if(isLeapYear(i))
				passingDays += LEAP_YEAR_DAYS;
			else
				passingDays += NORMAL_YEAR_DAYS;
		}
		
		// month까지 몇일이 흘렀는지 계산
		for(int i = 1; i < month; ++i)
		{
			passingDays += dayCountOfMonth(i);
		}
		
		// day까지 몇일이 흘렀는지 계산
		passingDays += day;

		// 알맞은 요일을 출력한다.
		return weekArr[passingDays % weekArr.length];
	}
	
	// 윤년인지 판별한다.
	private boolean isLeapYear(int year)
	{
		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	}

	// month가 몇일이 있는지 계산한다.
	private int dayCountOfMonth(int month)
	{
		// 2월은 윤년 여부에 따라 일수가 다르므로 따로 계산
		if(month == 2)
			return (isLeapYear(year)) ? monthDays[month] + 1 : monthDays[month];
		else
			return monthDays[month];
	}
	
	// 출력
	private void print(char week)
	{
		System.out.printf("%d년 %d월 %d일 -> %c요일\n", year, month, day, week);
	}

	public void logic()
	{
		if(!input())
		{
			System.out.println("잘못 입력하였습니다!");
			return;
		}
		char week = calculateWeek();
		print(week);
	}
}

public class Test102
{
	public static void main(String[] args)
	{
		WeekDay w = new WeekDay();
		w.logic();
	}
}
*/