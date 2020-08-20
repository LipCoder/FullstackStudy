/*=======================================================
 ■■■ 클래스와 인스턴스 ■■■
 - 클래스와 인스턴스 활용
=========================================================*/

// 1 ~ 3 사이의 난수를 발생시켜서
// 가위, 바위, 보 게임 프로그램을 구현한다.
// 단, 클래스의 개념을 활용하여 처리할 수 있도록 한다.
// 또한, 배열을 활용하여 처리할 수 있도록 한다.
// 최종적으로 Rps 클래스를 완성할 수 있도록 한다.

// ※ 기준 데이터 -> 1:가위, 2:바위, 3:보

// 실행 예)
// 1:가위 2:바위 3:보 중 입력(1~3) : 4
// 1:가위 2:바위 3:보 중 입력(1~3) : -2
// 1:가위 2:바위 3:보 중 입력(1~3) : 2

// - 유저    : 바위
// - 컴퓨터  : 보

// >> 승부 최종 결과 : 컴퓨터가 이겼습니다~!!!
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
import java.util.Random;

class RpsGame
{
	// 주요 속성 구성(변수 선언)
	private int user;
	private int com;

	// 주요 기능 구성(메소드 정의)
	// - 사용자의 선택 내용을 입력받는 기능의 메소드
	public void input()
	{
		runCom();

		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("1:가위, 2:바위, 3:보 중 입력(1~3) : ");
			user = sc.nextInt();
		}
		while (user < 1 || user > 3);
	}
	
	// 주요 기능 구성(메소드 정의)
	// - 컴퓨터의 선택 내용을 입력받는 기능의 메소드
	private void runCom()
	{
		Random rd = new Random();
		com = rd.nextInt(3) + 1;	// -- [+1] : 0 1 2 -> 1 2 3
	}

	// 주요 기능 구성(메소드 정의)
	// - 중간 결과 출력(서로의 선택 내용 확인)
	public void middleCalc()
	{
		String[] str = {"가위", "바위", "보"};

		System.out.println();
		System.out.println(" - 유저   : " + str[user - 1]);
		System.out.println(" - 컴퓨터 : " + str[com - 1]);
		// -- [1] : str[1] str[2] str[3] -> str[0] str[1] str[2]
	}

	// 주요 기능 구성(메소드 정의)
	// - 승부에 대한 연산
	public String resultCalc()
	{
		String result = "무승부 상황입니다~!!!";

		// (유저 == "가위 && 컴 == "보") || (유저 == "바위 && 컴 == "가위") || (유저 == "보 && 컴 == "바위")
		if((user ==  1 && com == 3) || (user == 2 && com == 1) || (user == 3 && com == 2) )	// 당신이 승리한 상황
		{
			result = "당신이 승리했습니다~!!!";
		}
		// (유저 == "가위 && 컴 == "바위") || (유저 == "바위 && 컴 == "보") || (유저 == "보 && 컴 == "가위")
		else if((user == 1 && com == 2) || (user == 2 && com == 3) || (user == 3 && com == 1))	// 컴퓨터가 승리한 상황
		{
			result = "컴퓨터가 승리했습니다~!!!";
		}

		return result;
	}

	// 주요 기능 구성(메소드 정의)
	// - 최종 결과 출력
	public void print(String str)
	{
		System.out.printf("\n>> 승부 최종 결과 : %s\n", str);	//
	}
}

// main() 메소드를 포함하고 있는 외부의 다른 클래스
public class Test105
{
	public static void main(String[] args)
	{
		RpsGame ob = new RpsGame();

		ob.input();
		ob.middleCalc();
		String result = ob.resultCalc();
		ob.print(result);
		//System.out.println(result);
		
	}
}

/*
class RpsGame
{
	private final String[] STATE = {"none", "가위", "바위", "보"};
 	private int user, computer;
	
	// 입력
	public void input()
	{
		inputUser();
		inputComputer();
	}
	// 유저 입력
	private void inputUser()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("1:가위 2:바위 3:보 중 입력(1~3) : ");
			user = sc.nextInt();
		}
		while (user < 1 || user > 3);
	}
	// 컴퓨터 입력
	private void inputComputer()
	{
		Random r = new Random();
		computer = r.nextInt(3) + 1;
	}


	// 출력
	public void print()
	{
		System.out.println();
		System.out.println(" - 유저   : " + STATE[user]);
		System.out.println(" - 컴퓨터 : " + STATE[computer]);
		System.out.println();

		String judge = judgeWin(user, computer);
		System.out.println(">> 승부 최종 결과 : " +  judge);
	}

	// 누가 이겼는지 판별
	private String judgeWin(int user, int computer)
	{
		String result = "가 이겼습니다~!!!";
		int gap = user - computer;
	
		switch(gap)
		{
			case -2: 
				result = "유저" + result; 
				break;
			case -1: 
				result = "컴퓨터" + result; 
				break;
			case 1: 
				result = "유저" + result; 
				break;
			case 2:  
				result = "컴퓨터" + result; 
				break;
			default : 
				result = "비겼습니다~!!!";
		}

		return result;
	}
}

public class Test105
{
	public static void main(String[] args)
	{
		RpsGame rg = new RpsGame();

		rg.input();
		rg.print();
	}
}
*/