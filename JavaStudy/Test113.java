/*=======================================================
      ■■■ 정렬(sort) 알고리즘 ■■■
	  - 향상된 버블 정렬(Bubble Sort)
=========================================================*/

/*
※ 앞에서 확인해 본 Selection Sort(Test110) 나 Bubble Sort(Test111)의 성능은 같다.
   (-> 반복의 횟수로 추정)
   하지만, 향상된 Bubble Sort는 대상 데이터의 구조에 따라
   일반 Bubble Sort 나 Selection Sort 보다 성능이 좋게 나타날 수 있다.

원본 데이터 : 61 15 20 22 30
              15 20 22 30 61 - 1회전 (스왑 발생 -> true)	-> 다음 회전 진행 O
			  15 20 22 30 61 - 2회전 (스왑 발생 -> false)	-> 다음 회전 진행 X 

=> 1회전 수행... 2회전 수행... 을 해보았더니...
   2회전에서 스왑(자리바꿈)이 전혀 일어나지 않았기 때문에
   불필요한 추가 연산(더 이상의 회전)은 무의미한 것으로 판단하여
   수행하지 않는다.
*/

// 실행 예)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// 계속하려면 아무 키나 누르세요...


public class Test113
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};

		System.out.print("Source Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();

		boolean flag;
		int pass = 0;

		// 향상된 Bubble Sort 구현
		do
		{
			flag = false;	// -- 자리바꿈이 발생할 경우 true로 설정
			pass++;

			for(int i = 0; i < a.length - pass; i++) // 0 1 2 3 / 0 1 2 / 0 1 / 0
			{
				//System.out.println("쑝");

				if(a[i] > a[i + 1]) // 01 12 23 34
									// 01 12 23
									// 01 12
									// 01
				{
					// 자리 바꾸기
					a[i] = a[i] ^ a[i + 1];
					a[i + 1] = a[i + 1] ^ a[i];
					a[i] = a[i] ^ a[i + 1];

					flag = true;
					// -- 단 한 번이라도 스왑이 발생하게 되면
					//    flag 변수를 true로 변경하여
					//    다음 회전을 추가로 진행할 수 있도록 처리
				}
			
			
			}						
		
			

		}
		while (flag);
		// -- flag 변수가 false 라는 것은
		//    회전이 구분적으로 발생하는 동안 스왑이 일어나지 않은 경우로
		//    더 이상의 반복문 수행은 무의미한 것으로 판단 가능~!!!

		/*
		for(int i = 1; i < a.length; ++i)
		{
			boolean isEnd = true;

			for(int j = 0; j < a.length - i; ++j)
			{
				if(a[j] > a[j + 1])
				{
					int temp  = a[j + 1];
					a[j + 1] = a[j];
					a[j] = temp;

					isEnd = false;
				}
			}

			if(isEnd) break;
		}
		*/

		System.out.print("Sorted Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();
	}
}

// 실행 결과
/*
Source Data : 52 42 12 62 60
Sorted Data : 12 42 52 60 62
계속하려면 아무 키나 누르십시오 . . .
*/