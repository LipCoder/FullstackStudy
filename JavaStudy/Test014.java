/*=======================================================
     ■■■ 자바 기본 프로그래밍 ■■■
	 - 자바의 기본 입출력 : testTwoystem.in.read()
=========================================================*/

// 실행 예)
// 한 문자 입력 : A
// 한 자리 정수 입력 : 7

// >> 입력한 문제 : A
// >> 입력한 정수 : 7
// 계속하려면 아무 키나 누르세요...

// ※ [System.in.read()] 메소드는 한 문자만 가져온다.
//    단, 하나의 문자를 입력받아 입력받은 해당 문자의
//    ASCII Code 값을 반환하게 된다.

// 입력 대기열 버퍼가 비어 있으면 프로그램은 기다린다.
// Enter => \n  +  \r (행을 바꿈과 동시에 캐리지 리턴한다)
import java.io.IOException;

public class Test014
{
	public static void main(String[] args) throws IOException
	{
		char testOne, testTwo;
		
		System.out.print("한 문자 입력 : ");
		testOne = (char)System.in.read();
		
		// -- 매개변수 (=> 갯수) 만큼 건너 뛴다.(버린다)
		System.in.skip(2);

		System.out.print("한 자리 정수 입력 : ");
		testTwo = (char)System.in.read();

		System.out.println();
		System.out.printf(">> 입력한 문자 : %c\n", testOne);
		System.out.printf(">> 입력한 정수 : %c\n", testTwo);
	}
}

/*
한 문자 입력 : A
한 자리 정수 입력 : 7

>> 입력한 문자 : A
>> 입력한 정수 : 7
계속하려면 아무 키나 누르십시오 . . .
*/