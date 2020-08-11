/*=======================================================
	 ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
	 - 반복문 실습
=========================================================*/

// 실행 예)
// 1 부터 100까지의 수 중 정수의 합 : xxx
// 1 부터 100까지의 수 중 짝수의 합 : xxx
// 1 부터 100까지의 수 중 홀수의 합 : xxx
// 계속하려면 아무 키나 누르세요...

public class Test046
{
	public static void main(String[] args)
	{
		int num = 0, sum, odd, even;
		sum = odd = even = 0;

		while(++num <= 100)
		{
			sum += num;
			int tmp = (num % 2 == 0) ? (even += num) : (odd += num);	
		}

		System.out.println("1 부터 100까지의 수 중 정수의 합 : " + sum);
		System.out.println("1 부터 100까지의 수 중 짝수의 합 : " + even);
		System.out.println("1 부터 100까지의 수 중 홀수의 합 : " + odd);
	}
}