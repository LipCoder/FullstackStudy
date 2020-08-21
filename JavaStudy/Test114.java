/*=======================================================
      ■■■ 정렬(sort) 알고리즘 ■■■
=========================================================*/

// 사용자로부터 여러 학생의 성적 데이터를 입력받아
// 점수가 높은 순으로 등수를 부여하여 결과를 출력하는 프로그램을 구현한다.
// 단, 배열과 정렬 알고리즘을 활용하여 작성할 수 있도록 한다.

// 실행 예)
// 인원 수 입력 : 5
// 이름 점수 입력(1) : 조인경 90
// 이름 점수 입력(2) : 박다빈 80
// 이름 점수 입력(3) : 허수민 85
// 이름 점수 입력(4) : 박해진 75
// 이름 점수 입력(5) : 강정우 95
/*
---------------
1등 강정우 95
2등 조인경 90
3등 허수민 85
4등 박다빈 80
5등 박해진 75
---------------
계속하려면 아무 키나 누르세요...
*/

import java.util.Scanner;

class Info
{
	String name;
	int score;
	int rank;
}

class Program
{
	private Info[] arr;

	private void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("인원 수 입력 : ");
		int count = sc.nextInt();

		arr = new Info[count];
	
		for(int i = 0 ; i < arr.length; ++i)
		{
		    arr[i] = new Info();
			
			System.out.printf("이름 점수 입력(%d) : ", i + 1);
			arr[i].name = sc.next();
			arr[i].score = sc.nextInt();
		}
	}

	private void sort()
	{
		boolean flag;
		int pass = 0;

		do
		{
			flag = false;
			++pass;

			for(int i = 0; i < arr.length - pass; ++i)
			{
				if(arr[i].score < arr[i + 1].score)
				{
					Info temp = arr[i];
					arr[i] = arr[i + 1];
					arr[i + 1] = temp;

					flag = true;
				}
			}
		}
		while (flag);
	}

	private void setRank()
	{
		int rank = 1;
		for(Info inst : arr)
		{
			inst.rank = rank++;
		}
	}

	private void print()
	{
		System.out.println();
		System.out.println("---------------");

		for(Info inst : arr)
		{
			System.out.printf("%d등 %s %d\n", inst.rank, inst.name, inst.score);
		}

		System.out.println("---------------");
	}

	public void logic()
	{
		input();
		sort();
		setRank();
		print();
	}
}

public class Test114
{
	public static void main(String[] args)
	{
		Program p = new Program();
		p.logic();
	}
}