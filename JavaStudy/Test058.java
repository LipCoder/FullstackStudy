
// 실행 예)
/*
[2단]
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
...
2 * 9 = 18

[3단]
3 * 1 = 3
3 * 2 = 6
3 * 3 = 8
...
3 * 9 = 27

...

[9단]
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
...
9 * 9 = 81
계속하려면 아무 키나 누르세요...
*/

public class Test058
{
	public static void main(String[] args)
	{
		int i, j;

		// 웅~ 웅~
		for(i = 2;i <= 9; ++i)		// 단 처리(outer)				// -> 2 3 4 5 6 7 8 9
		{
			//System.out.print("웅");
			System.out.printf("====[%d단]====\n", i);		
			// 쑝~ 쑝~
			for(j = 1; j <= 9; ++j)	// 곱해지는 수 처리(inner)		// -> 1 2 3 4 5 6 7 8 9
			{
				//System.out.print("쑝");
				System.out.printf("%d * %d = %2d\n", i, j, (i * j));
			}
			System.out.println();
		}

		/*
		for(int i = 2; i <= 9; ++i)
		{
			System.out.printf("[%d단]\n", i);
			for(int j = 1; j <= 9; ++j)
			{
				System.out.printf("%d * %d = %d\n", i, j, i * j);
			}
			System.out.println();
		}
		*/
	}
}