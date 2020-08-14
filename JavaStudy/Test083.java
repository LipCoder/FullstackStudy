/*=======================================================
	 ■■■ 배열 ■■■
	 - 배열의 기본적 활용
=========================================================*/

// [char] 자료형의 배열을 만들어
// 그 배열의 각 방에 알파벳 대문자를 채우고 
// 채워진 그 배열의 전체 요소를 출력하는 프로그램을 구현한다.
// 단, 채우는 구문과 출력하는 구문은 따로 분리하여 처리한다.

public class Test083
{
	public static void main(String[] args)
	{
		// 방법 1
		/*
		char[] c = new char[26];
		c[0] = 'A';
		//...
		c[25] = 'Z';
		*/

		// 방법 2
		/*
		char[] c = {'A', 'B' , ..., 'Z'};
		*/

		// 방법 3
		char[] arr3 = new char[26];
		for(int i = 0, ch = 65; i < arr3.length; i++, ch++)
			arr3[i] = (char)ch;


		// 배열 요소 전체 출력
		for(int i = 0; i < arr3.length; ++i)
		{
			System.out.printf("%c ", arr3[i]);
		}
		System.out.println();

		// my code
		/*
		char[] c = new char[('Z' - 'A') + 1];

		for(int i = 0; i < c.length; ++i)
		{
			c[i] = (char)('A' + i);
		}

		for(int i = 0; i < c.length; ++i)
		{
			System.out.printf("%c ", c[i]);
		}
		System.out.println();
		*/
	}
}

/*
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
계속하려면 아무 키나 누르십시오 . . .
*/