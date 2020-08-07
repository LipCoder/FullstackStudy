/*=======================================================
	 ■■■ 연산자(Operator) ■■■
	 - 비트 단위 연산자
=========================================================*/

public class Test021
{
	public static void main(String[] args)
	{
		int a = 10, b = -10;

		System.out.printf("~a : %d%n", ~a);
		System.out.printf("~b : %d%n", ~b);
	}
}	

/*
a = 10 -> 0000 1010

			 ↓ ~a

		  1111 0101  -> -11 -> check -> ok
		+ 0000 1011  ->  11
	   ----------------------
	    1 0000 0000  -> 0

b = -10 -> 0000 1010 -> 10
			  ↓   
		   1111 0101
		   	  ↓
		   1111 0101
		 +         1
		 -------------
		   1111 0110 -> -10
			  ↓
		   0000 1001 -> 9 (1 + 8)


*/

/*
~a : -11
~b : 9
계속하려면 아무 키나 누르십시오 . . .
*/