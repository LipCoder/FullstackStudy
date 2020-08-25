/*=======================================================
      ■■■ 클래스 고급 ■■■
	  - 인터페이스(Interface)
=========================================================*/
 
 // ○ 실습 문제
 // 성적 처리 프로그램을 구현한다.
 // 단, 인터페이스를 활용할 수 있도록 한다.

 // 실행 예)
 // 인원 수 입력(1~10) : 2
 // 1번째 학생의 학번 이름 입력(공백 구분) : 2012170 안혜지
 // 국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
 // 2번째 학생의 학번 이름 입력(공백 구분) : 2012112 윤홍준
 // 국어 영어 수학 점수 입력   (공백 구분) : 85 70 65
 
 // 2012170 안혜지    90  100   85    275   91 
 //	                  수   수   우  
 // 2012112 윤홍준    85   70   65    220   73
 //                   우   미   양 
 // 계속하려면 아무 키나 누르세요...

import java.util.Scanner;

// 속성만 존재하는 클래스   -> 자료형 활용
class Record
{
	String hak, name;		//-- 학번, 이름
	int kor, eng, mat;		//-- 국어, 영어, 수학 점수
	int tot, avg;			//-- 총점, 평균(편의상 정수 처리)
}

// 인터페이스
interface Sungjuk
{
	public void set();		//-- 인원 수 구성
	public void input();	//-- 상세 데이터 입력
	public void print();	//-- 결과 출력
}

// 문제 해결 과정에서 설계해야 할 클래스
class SungjukImpl implements Sungjuk
{
	private Record[] arr;
	
	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		int count;

		do
		{
			System.out.print("인원 수 입력(1~10) : ");
			count = sc.nextInt();
		}
		while (count < 1 || count > 10);
				
		arr = new Record[count];

		for(int i = 0; i < arr.length; ++i) 
			arr[i] = new Record();

	}
	
	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		int count = 1;
		
		for(Record info : arr)
		{
			System.out.print((count++) + "번째 학생의 학번 이름 입력(공백 구분) : ");
			info.hak = sc.next();
			info.name = sc.next();

			System.out.print("국어 영어 수학 점수 입력   (공백 구분) : ");
			info.kor = sc.nextInt();
			info.eng = sc.nextInt();
			info.mat = sc.nextInt();

			info.tot = info.kor + info.eng + info.mat;
			info.avg = info.tot / 3;
		}
	}
	
	@Override
	public void print()
	{
		System.out.println();
		for(Record info : arr)
		{
			String grade = makeGradeInfo(info);

			System.out.printf("%s %s  %4d %4d %4d  %5d %5d\n", 
						info.hak, info.name, info.kor, info.eng, info.mat, info.tot, info.avg);
			System.out.println(grade);
		}
	}

	private String makeGradeInfo(Record info)
	{
		String result = "";

		// (학번 + 공백 + 이름 * 2 + 공백) 만큼 먼저 띄워줌  
		int spaceSize = info.hak.length() + 1 + (info.name.length() * 2) + 1;
		for(int i = 0; i < spaceSize; ++i)
			result += ' ';
		
		int[] score = {info.kor, info.eng, info.mat};
			
		for(int s : score)
		{
			if(s >= 90)		 result += "   수";
			else if(s >= 80) result += "   우";
			else if(s >= 70) result += "   미";
			else if(s >= 60) result += "   양";
			else			 result += "   가";
		}

		return result;
	}
}

public class Test126
{
	public static void main(String[] args)
	{
		Sungjuk ob;

		// 문제 해결 과정에서 작성해야 할 ob 구성
		ob = new SungjukImpl();

		ob.set();
		ob.input();
		ob.print();
	}
}

/*
인원 수 입력(1~10) : 2
1번째 학생의 학번 이름 입력(공백 구분) : 2012170 안혜지
국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
2번째 학생의 학번 이름 입력(공백 구분) : 2012112 윤홍준
국어 영어 수학 점수 입력   (공백 구분) : 85 70 65

2012170 안혜지    90  100   85    275    91
                  수   수   우
2012112 윤홍준    85   70   65    220    73
                  우   미   양
계속하려면 아무 키나 누르십시오 . . .
*/