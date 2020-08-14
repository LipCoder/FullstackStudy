/*=======================================================
	 ■■■ 배열 ■■■
	 - 배열의 기본적 활용
=========================================================*/

// 사용자로부터 처음 입력받은 인원 수 만큼의 
// 학생 이름과 전화번호를 입력받고
// 입력받은 내용을 전체 출력하는 프로그램을 구현한다.
// 단, 배열을 활용하여 처리할 수 있도록 한다.

// 실행 예)
// 입력 처리할 학생 수 입력(명, 1~10) : 27
// 입력 처리할 학생 수 입력(명, 1~10) : 3
// 이름 전화번호 입력[1](공백 구분) : 주재완 010-1111-1111
// 이름 전화번호 입력[2](공백 구분) : 정의진 010-2222-2222
// 이름 전화번호 입력[3](공백 구분) : 안혜지 010-3333-3333

// -----------------------------------
// 전체 학생 수 : 3명
// -----------------------------------
// 이름		전화번호
// 주재완	010-1111-1111
// 정의진	010-2222-2222
// 안혜지	010-3333-3333
// -----------------------------------
// 계속하려면 아무 키나 누르세요...

import java.util.Scanner;

public class Test084
{
	public static void main(String[] args)
	{
		// Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		// 사용자가 입력하는 학생 수를 담아둘 변수
		int memCount = 0;
		
		do
		{
			System.out.print("입력 처리할 학생 수 입력(명, 1~10) : ");
			memCount = sc.nextInt();
		}
		while (memCount < 1 || memCount > 10);
		
		// 테스트(확인)
		//System.out.println("사용자가 입력한 인원 수 : " + memCount);

		//String name1, name2, name3, ....
		// 비효율적

		// 이름 저장 배열 구성
		String[] names = new String[memCount]; 

		// 전화번호 저장 배열 구성
		String[] tels = new String[memCount];
		//String[] tels = new String[names.length]; <= 동일한 구문
		

		// for(int i = 0; i < names.length; ++i)
		// for(int i = 0; i < tels.length; ++i)
		for(int i = 0; i < memCount; ++i)
		{
			System.out.printf("이름 전화번호 입력[%d](공백 구분) : ", i + 1);
			// 주재완 010-1111-1111
			// 정의진 010-2222-2222
			
			// 이름 -> 전화번호 순서대로 입력 받는다.
			names[i] = sc.next();
			tels[i] = sc.next();
		}

		// 최종 결과(이름, 전화번호) 출력
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.printf("전체 학생 수 : %d명\n", memCount);
		System.out.println("-----------------------------------");
		System.out.println("이름    전화번호");

		for(int i = 0; i < memCount; i++)
		{
			System.out.printf("%4s %13s\n", names[i], tels[i]);
		}

		System.out.println("-----------------------------------");
		// my code
		/*
		Scanner sc = new Scanner(System.in);
		int numOfStudent = 0;
		String[] arrName, arrPhoneNumber;
	
		// 학생 수 입력 (범위 안에 들어올때까지) 
		do
		{
			System.out.print("입력 처리할 학생 수 입력(명, 1~10) : ");
			numOfStudent = sc.nextInt();
		}
		while (numOfStudent < 1 || numOfStudent > 10);
			
		// 학생 수 만큼의 배열 할당
		arrName = new String[numOfStudent];
		arrPhoneNumber = new String[numOfStudent];
		
		// 학생 정보 입력
		for(int i = 0; i < numOfStudent; ++i)
		{
			System.out.printf("이름 전화번호 입력[%d](공백 구분) : ", i + 1);
			arrName[i] = sc.next();
			arrPhoneNumber[i] = sc.next();
		}
		
		// 모든 학생 정보 출력
		System.out.print("\n-----------------------------------\n");
		System.out.printf("전체 학생 수 : %d명", numOfStudent);
		System.out.print("\n-----------------------------------\n");
	
		System.out.println("이름\t 전화번호");
		for(int i = 0; i < numOfStudent; ++i)
		{
			System.out.printf("%s\t %s\n", arrName[i], arrPhoneNumber[i]);
		}
		System.out.print("-----------------------------------\n");
		*/
	}
}

/*
입력 처리할 학생 수 입력(명, 1~10) : 27
입력 처리할 학생 수 입력(명, 1~10) : 3
이름 전화번호 입력[1](공백 구분) : 재완주 010-1111-1111
이름 전화번호 입력[2](공백 구분) : 의진정 010-2222-2222
이름 전화번호 입력[3](공백 구분) : 혜지안 010-3333-3333

-----------------------------------
전체 학생 수 : 3명
-----------------------------------
이름     전화번호
재완주   010-1111-1111
의진정   010-2222-2222
혜지안   010-3333-3333
-----------------------------------
계속하려면 아무 키나 누르십시오 . . .
*/