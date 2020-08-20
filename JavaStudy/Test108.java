/*=======================================================
 ■■■ 만년달력 ■■■
=========================================================*/

// 실행 예)
// 『연도』를 입력하세요 : 2021
// 『월』을 입력하세요   : 1

/*
	   [ 2021년 1월 ]

  일  월  화  수  목  금  토
============================
                       1   2
   3   4   5   6   7   8   9
  10  11  12  13  14  15  16
  17  18  19  20  21  22  23
  24  25  26  27  28  29  30
  31
============================
계속하려면 아무 키나 누르세요...
*/

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

//선생님 풀이
public class Test108
{
	public static void main(String[] args) throws IOException
	{
     BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

      //배열 선언 및 초기화
      // -- 각 달이 담고있는 마지막 날짜(매 월의 최대 날짜)
      int[] days = {31,28,31,30,31,30,31,31,30,31,30,31};

      //테스트(확인)
      //System.out.println(days.length);

      //주요 변수 선언
      int nalsu=0, y=0,m=0,w=0;         //--날 수,년,월,요일

      do
      {
         System.out.print("『년도』을 입력하세요 : ");
         y = Integer.parseInt(br.readLine());
         System.out.print("『월』을 입력하세요   : ");
         m = Integer.parseInt(br.readLine());
      }
      while (m<1 || m>12);
      // -- 입력받은 월이 1보다 작거나 12보다 클 경우... 다시 입력받을 수 있도록 처리
      //-----------------여기까지 수행하면 유효한 년, 월을 입력한 상태!!

      //입력받은 년도에 해당하는 2월의 마지막 날 계산
      if(y%4==0 && y%100!=0 || y%400==0)      //--윤년이라면...
         days[1]=29;
      //--else구문은
      //   현재 days 배열의 1번째 요소(2월)가 28로 구성되어 있는
      //  상태이기 때문에 생략 가능한 구문이 된다.

      //1년 1월 1일 ~ 입력받은 년도 이전년도의 12월 31일까지의
      //날 수 계산
      nalsu = (y-1)*365 + (y-1)/4 - (y-1)/100 + (y-1)/400;

      //입력받은 년도(해당년도)의 1월1일 ~ 입력한 월의 이전 월까지의
      //날 수 누적 연산
      for(int i=0;i<(m-1);i++)
      {
         nalsu += days[i];
      }

      //----------여기까지 수행하면 입력년 입력월의 하루 전 날 수 까지 누적

      //입력받은 월의 1일을 날 수 누적 연산
      nalsu += 1;         //++nalsu;

      //-----------------여기까지 수행하면 모든 날 수에 대한 종합 완료!!

      //요일 산출
      //: 입력받은 월의 1일이 무슨 요일인지 확인하기 위한 연산
      //   이 연산을 수행해야 달력에서 1일을 어느 위치부터 그리기 시작해야 하는지
      //  알 수 있게 되는 상황.
      w = nalsu % 7;      //0:

      //테스트(확인)
      //System.out.println(w);

      //---------------여기까지 수행하면 해당 년 해당 월 1일이
      //             무슨 요일인지 확인 완료~!

      //출력(달력 그리기)
      System.out.println();
      System.out.printf("\t[ %d년 %d월 ]\n",y,m);
      System.out.println("  일  월  화  수  목  금  토");
      System.out.println("=============================");

      //특정 요일부터 1일이 출발할 수 있도록 공백 발생(지정)
      for(int i=1;i<=w;i++)
      {
         System.out.print("    ");      //공백 4칸 발생
      }

      //테스트(확인)
      //System.out.printf("%4d",1);
	  for(int i = 1; i <= days[m-1]; i++)
	  {
		  System.out.printf("%4d", i);	// 1 2 3 4 5 ...
		  w++;							// 7 8 9 10  ...

		  if(w%7 == 0)
		  {
			  System.out.println(); // 개행
		  }
	  }

	  // 달의 마지막 날짜가 출력 형식을 모두 채웠을 경우
	  // 이미 일요일 개행이 이루어졌기 때문에
	  // 이 경우에는 추가 개행을 하지 않도록 처리
	  if(w % 7 != 0)
		  System.out.println();

	  System.out.println("=============================");
   }
}

/*
class MyCalendar
{
	private final int[] months = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	private int y, m;

	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("『연도』를 입력하세요 : ");
			y = sc.nextInt();
		}
		while (y < 0);
		
		do
		{
			System.out.print("『월』를 입력하세요   : ");
			m = sc.nextInt();
		}
		while (m < 1 || m > 13);
	}
	
	// 출력 (달력 그리기)
	public void print()
	{
		System.out.println();
		System.out.printf("\t[ %d년 %d월 ]\n\n", y, m);
		System.out.println("  일  월  화  수  목  금  토");
		System.out.println("============================");
		
		printDays();
		
		System.out.println("============================");
	}
	
	private void printDays()
	{
		
		int start = calcWeekStart();
		int limit = getMonth(m);
		
		// 날짜용    시작 체크용
		int day = 1, check = 0;

		for(int i = 0; i < 6; ++i)
		{
			for(int j = 0; j < 7; ++j)
			{
				// 해당 월의 마지막 일수까지 출력하면 개행후 함수 종료
				if(day > limit) 
				{
					System.out.println();
					return;
				}
	
				// 날짜 시작 전에는 공백 출력
				if(check < start)
					System.out.printf("%4c", 0);
				else
					System.out.printf("%4d", day++);

				++check;
			}
			System.out.println();
		}
	}

	private int calcWeekStart()
	{
		int stackDays = 0;

		int yearGap = y - 1;
		stackDays = (yearGap * 365) + (yearGap / 400) - (yearGap / 100) + (yearGap / 4);

		for(int i = 1; i < m; ++i)
			stackDays += getMonth(i);

		stackDays += 1;

		return stackDays % 7;
	}

	private boolean isLeapYear(int year)
	{
		return (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
	}
	
	private int getMonth(int month)
	{
		if(isLeapYear(y)) 
			months[2] = 29;

		return months[month];
	}
}

public class Test108
{
	public static void main(String[] args)
	{
		MyCalendar mc = new MyCalendar();
		
		mc.input();
		mc.print();
	}
}
*/
