/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
=========================================================*/

// 사용자로부터 임의의 정수를 입력받아
// 1 부터 입력받은 수 까지의 합을 연산하여
// 결과값을 출력하는 프로그램을 구현한다.

// 단, 클래스와 인스턴스의 개념을 활용하여 처리할 수 있도록 한다.
// 또한, 입력 처리 과정에서 BufferedReader 를 사용하며,
// 입력 데이터가 1 보다 작거나 1000 보다 큰 경우
// 다시 입력받을 수 있는 처리를 포함하여 프로그램을 구현할 수 있도록 한다.

// 실행 예)
// 임의의 정수 입력(1~1000) : 1022
// 임의의 정수 입력(1~1000) : -23
// 임의의 정수 입력(1~1000) : 100
// >> 1 ~ 100 까지의 합 : 5050
// 계속하려면 아무 키나 누르세요

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
class Hap
{
	// 주요 변수 선언(속성 구성)
	// -- 사용자의 입력값을 담아둘 변수
	int su;

	// 주요 메서드 정의(기능 정의)
	// -- 입력 기능을 수행할 메서드
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		do
		{
			System.out.print("임의의 정수 입력(1~1000) : ");
			su = Integer.parseInt(br.readLine());
		}
		while (su < 1 || su > 1000);
	}

	// 주요 메서드 정의(기능 정의)
	// -- 연산 처리 기능을 수행할 메서드
	int calculate()
	{
		int result = 0;

		for(int i = 1; i <= su; i++)
			result += i;

		return result;
	}

	// 주요 메서드 정의(기능 정의)
	// -- 결과 출력 기능을 수행할 메서드
	void print(int sum)
	{
		System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", su, sum);
	}
}

public class Test074
{
	public static void main(String[] args) throws IOException
	{
		// Hap 클래스를 기반으로 한 인스턴스 생성
		Hap ob = new Hap();

		// 생성한 인스턴스를 통해서 입력 메소드 호출
		ob.input();
		
		// 생성한 인스턴스를 통해 연산 메소드 호출
		int sum = ob.calculate();

		// 생성한 인스턴스를 통해 출력 메소드 호출
		ob.print(sum);
	}
}
*/

// my code

class Hap
{
	final int LIMIT = 1000;
	int inputNum, sumNum;

	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.printf("임의의 정수 입력(1~%d) : ", LIMIT);
		inputNum = Integer.parseInt(br.readLine());
	}

	boolean isInLimit()
	{
		return (1 <= inputNum && inputNum <= LIMIT);
	}

	void calcSum()
	{
		sumNum = 0;
		for(int i = 1; i <= inputNum; ++i)
		{
			sumNum += i;
		}
	}
	
	void printSum()
	{
		System.out.printf(">> 1 ~ %d 까지의 합 : %d\n", inputNum, sumNum);
	}

	void logic() throws IOException
	{
		while(true)
		{
			input();

			if(isInLimit())
			{
				calcSum();
				printSum();
				break;
			}
		}
	}
}

public class Test074
{
	public static void main(String[] args) throws IOException
	{
		Hap h = new Hap();
		h.logic();
	}
}

/*
임의의 정수 입력(1~1000) : -100
임의의 정수 입력(1~1000) : 101010
임의의 정수 입력(1~1000) : 1000
>> 1 ~ 1000 까지의 합 : 500500
계속하려면 아무 키나 누르십시오 . . .
*/
