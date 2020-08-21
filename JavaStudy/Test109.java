/*=======================================================
      ■■■ 주민등록번호 유효성 검사 ■■■
=========================================================*/

/*
○	주민등록번호 검증 공식
	
	1. 마지막 자리를 제외한 앞자리 수를 규칙에 맞게 곱한다.
		
		123456-1234567 (주민번호)
		****** ******* ------------------- 각 자릿수에 곱하기
		234567 892345  (각 자리에 곱해질 수)

	2. 규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한다.

	ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
		* * * * * *   * * * * * *
		2 3 4 5 6 7   8 9 2 3 4 5
	---------------------------------------
	-> 14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15

	   == 217

	3. 더해진 결과값을 11로 나누어 『나머지』를 취한다

			19
	   -------------
	11 |   217
	       11
       -------------
	       107
		    99
	   -------------
	         8 -> 나머지

	4. 11에서 나머지(8)을 뺀 결과값을 구한다.

		11 - 8 -> 3

		※ 3의 처리 과정에서 나머지가 0인 경우 -> 11 - 0 -> 11 -> 1
									  1인 경우 -> 11 - 1 -> 10 -> 0
		   이를 다시 10으로 나누어 나머지를 취한다.

	5. 4의 연산 결과가 주민번호를 구성하는 마지막 숫자와
	   일치하는지의 여부를 확인한다.

	   일치   -> 유효한 주민번호
	   불일치 -> 잘못된 주민번호


*/

// 실행 예)
// 주민번호 입력(xxxxxx-xxxxxxx) : 123456-12345678 -> 입력 갯수 초과
// >> 입력 오류
// 계속하려면 아무 키나 누르세요...

// 주민번호 입력(xxxxxx-xxxxxxx) : 123456-123456   -> 입력 갯수 미달
// >> 입력 오류
// 계속하려면 아무 키나 누르세요...

// 주민번호 입력(xxxxxx-xxxxxxx) : 750615-1252085  -> 유효한 주민번호
// >> 정확한 주민번호
// 계속하려면 아무 키나 누르세요...

// 주민번호 입력(xxxxxx-xxxxxxx) : 750615-1252084  -> 유효하지 않은 주민번호
// >> 잘못된 주민번호
// 계속하려면 아무 키나 누르세요...


// 추가 팁~!!!

// 배열.length		  -> 배열의 길이(배열방의 갯수) 반환
// 문자열.length()	  -> 문자열의 길이 반환
// 문자열.substring() -> 문자열 추출

import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Identifier
{
	private String first, last;
	// 주민번호 확인정보
	private final int[] firstIdentifyInfo = {2, 3, 4, 5, 6, 7};
	private final int[] lastIdentifyInfo = {8, 9, 2, 3, 4, 5};

	private boolean input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("주민번호 입력(xxxxxx-xxxxxxx) : ");
		String temp = sc.next();

		// 만약 입력받은 길이가 주민번호 길이와 같으면 
		// 제대로 입력된 것
		if(temp.length() == 14) 
		{
			// 앞 뒤 번호를 쪼갠다.
			first = temp.substring(0, 7);
			last = temp.substring(7);

			return true;
		}

		System.out.println(">> 입력 오류");
		return false;
	}
	// 코드업 100제 -> 백준알고리즘(알고리즘 유형별 문제 모음) -> 프로그래머스(기업코딩테스트 문제)

	// 올바른지 여부 확인
	private boolean isReal()
	{
		int sum = 0;

		for(int i = 0; i < 6; ++i)
		{
			sum += toNum(first.charAt(i)) * firstIdentifyInfo[i];
			sum += toNum(last.charAt(i)) * lastIdentifyInfo[i];
		}

		int rest = sum % 11;
		int lastNum = toNum(last.charAt(6));
		int checkNum = (11 - rest) % 10;

		// 구한 최종값이 주민번호 맨 뒷자리 숫자와 같다면
		// 올바른 주민번호
		return (lastNum == checkNum);
	}
	
	// 확인결과 출력
	private void print(boolean check)
	{
		if(check) 
			System.out.println(">> 정확한 주민번호");
		else
			System.out.println(">> 잘못된 주민번호");
	}
	
	// 숫자형태 문자를 정수형으로 바꿔준다.
	private int toNum(char c)
	{
		return (c - '0');
	}
	
	public void logic()
	{
		if(!input()) 
			return;

		boolean check = isReal();
		print(check);
	}
}

public class Test109
{
	public static void main(String[] args) throws IOException
	{
		//Identifier id = new Identifier();
		//id.logic();

		/*
		String tmp = "study-hard";
		System.out.println(tmp.length());

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(3, 5));	// 3 ~ 4번째까지
		// --==>> DE
		// ABCDEFGHIJKLMNOPQRSTUVWXYZ
		// 0123456789...
		//    DE

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(13, 17)); // 13 ~ 16번째까지

		//int[] arr = {1, 2, 3};
		//System.out.println(arr[5]);
		//--==>> 에러 발생 -> ArrayIndexOUtOfBoundsException

		//tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		//System.out.println(tmp.substring(13, 57)); // 13 ~ 56번째까지
		//--==>> 에러 발생 -> StringIndexOUtOfBoundsException

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(15)); // 15 ~ 끝까지
		*/

		// teacher's code 

		// BufferedReader
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// 입력받는 주민번호(문자열 형태)
		String str;

		// 주민번호 각 자릿수에 곱하게 될 수 -> 배열 형태로 구성
		//		     2  3  4  5  6  7     8  9  2  3  4  5
		int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		//                            --- check~!!!

		// 곱셈 연산 후 누적합 (각 곱셈 결과를 더해 나가라...)
		int tot = 0;

		System.out.print("주민번호 입력(xxxxxx-xxxxxxx) : ");
		//str = Integer.parseInt(br.readLine());
		str = br.readLine();

		if(str.length() != 14)
		{
			System.out.println(">> 입력 오류~!!!");
			return; // -- 메소드 종료 -> main() 메소드 종료 -> 프로그램 종료
		}

		// 테스트 (확인)
		//System.out.println(">> 자릿수 적합~!!!");
		
		for(int i = 0; i < 13; i++)
		{	
			if(i == 6) continue;
							// 주민번호 특정 자릿수 추출
			tot += chk[i] * Integer.parseInt(str.substring(i, (i + 1)));
		}
		
		// -----------여기까지 수행하면 1과 2를 모두 끝낸 상황이며
		//			  규칙에 맞게 곱셈 연산을 수행한 결과를 모두 더한 값은
		//            변수 tot에 담겨있는 상황이 된다.

		// 3, 4 관련 연산 수행
		int su = 11 - tot % 11;

		// 최종 결과 출력 이전에... 추가 연산 필요~!!!
		// su에 대한 연산 결과가 두 자리로 나올 경우
		// 주민번호 마지막 자리의 숫자와 비교할 수 없는 상황
		su = su % 10;

		// 테스트(확인)
		//System.out.println(su);

		if(su == Integer.parseInt(str.substring(13)))
			System.out.println(">> 정확한 주민번호~!!!");
		else
			System.out.println(">> 잘못된 주민번호~!!!");
	}
}

