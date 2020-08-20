/*=======================================================
 ■■■ 클래스와 인스턴스 ■■■
 - 클래스와 인스턴스 활용
=========================================================*/

// 학생별로 국어점수, 영어점수, 수학점수를 입력받아
// 총점, 평균을 계산하는 프로그램을 구현한다.
// 단, 클래스의 개념을 활용하여 작성할 수 있도록 한다.
// 또한, 이 과정에서 배열을 적극적으로 활용할 수 있도록 한다.

// 프로그램을 구성하는 클래스
// 1. Record 클래스
//	  -> 속성만 존재하는 클래스로 설계할 것~!!!
//
// 2. Sungjuk 클래스
//    -> 인원 수를 입력받아, 입력받은 인원 수 만큼
//		 이름, 국어점수, 영어점수, 수학점수를 입력받고
//       총점과 평균을 산출하는 클래스로 설계할 것~!!!
//		  * 속성 : 인원수, Record 형태의 배열
//		  * 기능 : 인원수 입력, 상세 데이터 입력, 총점 및 평균 연산, 결과 출력
//
// 3. Test104 클래스
//	  -> main() 메소드가 존재하는 외부 클래스로 설계할 것~!!!

// 실행 예)
// 인원 수 입력(1~100) : 102
// 인원 수 입력(1~100) : -10
// 인원 수 입력(1~100) : 3

// 1번째 학생의 이름 입력 : 윤홍준
// 국어 점수 : 90
// 영어 점수 : 80
// 수학 점수 : 70

// 2번째 학생의 이름 입력 : 김승범
// 국어 점수 : 82
// 영어 점수 : 72
// 수학 점수 : 62

// 3번째 학생의 이름 입력 : 이예슬
// 국어 점수 : 98
// 영어 점수 : 88
// 수학 점수 : 78

// 윤홍준  90  80  70  240  xx.xx  2
// 김승범  82  72  62  xxx  xx.xx  3
// 이예슬  98  88  78  xxx  xx.xx  1

// 계속하려면 아무 키나 누르세요...

public class Test104
{
	public static void main(String[] args)
	{
		Sungjuk ob = new Sungjuk();

		ob.set();
		ob.input();
		ob.print();
	}
}

// my code
/*
import java.util.Scanner;

class Record
{
	String name;
	int kor, eng, math, total, rank;
	double avg;
}

class Sungjuk
{
	private Scanner sc = new Scanner(System.in);
	private int count;
	private Record[] students;

	// 인원수 입력
	public void input()
	{
		do
		{
			System.out.print("인원 수 입력(1~100) : ");
			count = sc.nextInt();
		}
		while (count < 1 || count > 100);
		
		// 레코드를 담는 배열 메모리 할당
		// 각 레코드 배열 원소의 인스턴스 생성
		students = new Record[count];
		for(int i = 0; i < count; ++i)
		{
			students[i] = new Record();
		}
	}

	// 상세정보 입력
	public void inputDetail()
	{
		for(int i = 0; i < count; ++i)
		{
			System.out.println();
			System.out.printf("%d번째 학생의 이름 입력 : ", i + 1);
			students[i].name = sc.next();

			System.out.print("국어 점수 : ");
			students[i].kor = sc.nextInt();

			System.out.print("영어 점수 : ");
			students[i].eng = sc.nextInt();

			System.out.print("수학 점수 : ");
			students[i].math = sc.nextInt();
		}
	}
	
	// 총점 및 평균 연산
	public void calcScore()
	{
		for(int i = 0; i < count; ++i)
		{
			students[i].total = students[i].kor + students[i].eng + students[i].math;
			students[i].avg = students[i].total / 3.0;
		}
	}

	// 등수 연산
	public void calcRank()
	{
		for(int i = 0; i < count; ++i)
		{
			// 각 학생 등수를 1등으로 주고
			// 다른 학생 점수보다 떨어진다면 등수를 떨어뜨린다.
			students[i].rank = 1;
			for(int j = 0; j < count; ++j)
			{
				// 같은 학생은 비교하지 않고 넘어간다.
				if(i == j) continue;	
				
				if(students[i].total < students[j].total) 
					++students[i].rank;
			}
		}
	}
	
	// 출력
	public void print()
	{
		System.out.println();
		for(int i = 0; i < count; ++i)
		{
			Record r = students[i];
			System.out.printf("%s  %d  %d  %d  %d  %.2f  %d\n",
							  r.name, r.kor, r.eng, r.math, r.total, r.avg, r.rank);
		}
	}
}

public class Test104
{
	public static void main(String[] args)
	{
		Sungjuk sj = new Sungjuk();

		sj.input();
		sj.inputDetail();
		sj.calcScore();
		sj.calcRank();
		sj.print();
	}
}
*/