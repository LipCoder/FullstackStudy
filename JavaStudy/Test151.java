/*=======================================================
      ■■■ 자바의 주요(중요) 클래스 ■■■
	  - Random 클래스
=========================================================*/

/*
○ java.util.Random 클래스는
   여러 형태의 난수를 발생시켜 제공하는 클래스이다.
   Math  클래스를 정적 메소드인 random() 메소드도
   난수를 제공하는 메소드지만
   0.0 ~ 1.0 사이의 실수 형태만 발생하게 되므로
   필요한 여러 형태의 난수를 만들어내기 위해서는
   추가적인 연산들을 수행해야 한다.
   그래서 자바는 여러 형태의 난수를 발생시켜주는
   전용 클래스인 Random 클래스를 별도로 제공하고 있다.

*/

// 로또 번호 생성기(난수 발생 프로그램)

// 프로그램이 실행되면 기본적으로 로또를
// 5게임 수행하는 프로그램을 구현한다.

// 실행 예)
// 3 5 12 24 31 41
// 1 2 8 23 35 38
// 4 9 11 13 22 30
// 5 10 13 15 27 40
// 22 31 32 33 40 45
// 계속하려면 아무 키나 누르세요...

// 중복 없음
// 오름차순

import java.util.Random;
import java.util.Arrays;

class Lotto
{
	// 배열 변수 선언 및 메모리 할당
	// -> 로또 번호를 담아둘 배열방 6칸
	private int[] num = new int[6];

	// private으로 선언된 num 값을 얻어내기 위한 메소ㅡ
	// -> getter
	public int[] getNum()
	{
		return num;
	}
	
	// 6개의 난수를 발생시키기 위한 메소드
	public void start()
	{
		Random rd = new Random();
		int n;
		int cnt = 0;

		jump:

		while(cnt < 6)
		{
			n = rd.nextInt(45) + 1;		// 1 ~ 45 중 한 개 발생

			for(int i = 0; i < cnt; i++)
			{
				if(num[i] == n)
				{
					continue jump;
				}
			}

			num[cnt++] = n;
		}
		// {10, 7, 11, 20}

		// 정렬 메소드 호출
		sorting();
	}
	
	// 정렬 메소드 
	private void sorting()
	{
		// Arrays 클래스의 정적 메소드 sort() 호출하며
		// 멤버인 num 을 매개변수로 넘겨주기
		Arrays.sort(num);
	}

}

public class Test151
{
	public static void main(String[] args)
	{
		// Lotto 클래스 기반 인스턴스 생성
		Lotto lotto = new Lotto();

		// 기본 5게임
		for(int i = 1; i <= 5; i++)
		{
			lotto.start();

			// 결과 출력
			for(int n : lotto.getNum())
			{
				System.out.printf("%4d", n);
			}
			System.out.println();
		}
	}
}


/*
public class Test151
{
	
	public static void sort(int[] arr)
	{
		for(int i = 0; i < arr.length - 1; ++i)
		{
			for(int j = 0; j < arr.length - i - 1; ++j)
			{
				if(arr[j] > arr[j + 1])
				{
					int temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
	}

	public static void Initialize(boolean[] check)
	{
		for(int i = 0; i < check.length; ++i)
			check[i] = true;
	}

	public static void main(String[] args)
	{
		Random r = new Random();
		int testCase = 5;
		
		boolean[] check = new boolean[45 + 1];
		int[] numArr = new int[6];

		for(int i = 0; i < testCase; ++i)
		{
			Initialize(check);

			// add
			for(int j = 0; j < numArr.length; ++j)
			{
				int randomNum = r.nextInt(45) + 1;
				if(!check[randomNum]) 
				{
					--j;
					continue;
				}

				numArr[j] = randomNum;
				check[randomNum] = false;				
			}

			// sort
			sort(numArr);
		
			// print
			for(int num : numArr)
				System.out.print(num + " ");
			System.out.println();
		}
	}
}
*/

