/*=======================================================
	 ■■■ 배열 ■■■
	 - 배열의 기본적 활용
=========================================================*/

// ○ 과제
// 사용자로부터 임의의 정수를 임의의 갯수만큼 입력받아
// 입력받은 수 중에서 가장 큰 수를 출력하는 프로그램을 작성한다.
// 단, 배열을 활용하여 구현할 수 있도록 한다.

// 실행 예)
// 입력할 데이터의 갯수   : 10
// 데이터 입력(공백 구분) : 74 65 92 13 2 86 7 12 25 64
// >> 가장 큰 수 -> 92
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;
public class Test085
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int numCount = 0;

		System.out.print("입력할 데이터의 갯수 : ");
		numCount = sc.nextInt();

		// 입력할 데이터 갯수만큼 배열 할당
		int[] arr = new int[numCount];

		System.out.print("데이터 입력(공백 구분) : ");
		for(int i = 0; i < arr.length; ++i)
		{
			arr[i] = sc.nextInt();
		}
		
		// 최대값을 측정하기 위해 max를 선언한다.
		// 최소값이 얼마인지 알 수 없으므로 정수에서 가장 작은 값을 넣어준다.
		int max = Integer.MIN_VALUE;
		for(int i = 0; i < arr.length; ++i)
		{
			if(max < arr[i]) 
				max = arr[i];
		}

		System.out.println(">> 가장 큰 수 -> " + max);
	}
}