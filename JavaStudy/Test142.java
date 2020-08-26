/*=======================================================
      ■■■ 자바의 주요(중요) 클래스 ■■■
	  - String 클래스
=========================================================*/

public class Test142
{
	public static void main(String[] args)
	{
		String s = "seoul korea";
		System.out.println(s);
		// --==>> seoul korea


		// 문자열 추출
		System.out.println(s.substring(6, 9));
		//-- [String객체.substring(s, e)]
		//    String객체 문자열을 대상으로
		//    s 번째에서... e-1 번째까지 추출
		//    (단, 인덱스는 0부터 시작)
		//    seoul   kor  ea
		//    012345  678  9
		//            ---
		// --==>> kor

		System.out.println(s.substring(7));
		// -- [String객체.substring(s)]
		//    String객체 문자열을 대상으로
		//    s 번째에서 끝까지... (즉, 문자열이 가진 길이만큼...)
		//    seoul  k orea
		//    012345 6 789
		//             ----
		// --==>> orea

		// ○ 문자열의 데이터(값) 비교
		System.out.println(s.equals("seoul korea"));
		System.out.println(s.equals("Seoul Korea"));
		// --==>> true
		//        false
		//-- 대소문자 구분

		System.out.println(s.equalsIgnoreCase("Seoul Korea"));
		//--==>> true
		//-- 대소문자 구분 안함

		
		// ○ 찾고자 하는 대상 문자열(s)에 
		//    [kor] 문자열이 존재할까?
		//    존재한다면... 그 위치는 어떻게 될까?

		// "seoul korea"
		System.out.println(s.indexOf("kor"));
		//--==>> 6
		
		System.out.println(s.indexOf("ea"));
		//--==>> 9

		System.out.println(s.indexOf("e"));
		//--==>> 1

		System.out.println(s.indexOf("tt"));
		//--==>> -1
		//-- 찾고자 하는 문자열이 대상 문자열에 존재할 셕우
		//   그 문자열의 인덱스를 반환하지만(0부터 시작)
		//   존재하지 않을 경우 음수를 반환하게 된다. (-1)

		

		// ○ 대상 문자열(s)이 [rea]로 끝나는지의 여부 확인
		//    (true / false)
		System.out.println(s.endsWith("rea"));
		//--==>> true
		System.out.println(s.endsWith("oul"));
		//--==>> false


		// ○ 찾고자 하는 대상 문자열(s)에 
		//    [e] 문자열이 존재할까?
		//    존재한다면 그 위치는 어떻게 될까?
		//    (단, 뒤에서 부터 검사)

		// seoul korea
		System.out.println(s.indexOf("e"));
		//--==>> 1

		System.out.println(s.indexOf("o"));
		//--==>> 2
	
		System.out.println(s.lastIndexOf("e"));
		//--==>> 9

		System.out.println(s.lastIndexOf("o"));
		//--==>> 7


		// ○ 대상 문자열(s) 중
		//    [6] 번째 인덱스 위치의 문자는?
			
		// seoul korea
		System.out.println(s.charAt(6));   
		//--==>> k

		//System.out.println(s.charAt(52));
		// System.out.println(s.charAt(52));
        // Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range: 52
        // 에러 발생(런타임 에러)

		// ○ 대상 문자열(s)과 비교 문자열 [souel corea] 중 
		//    어떤 문자열이 더 큰가?
		//    두 문자열이 다르다면 차이를 확인(사전식 배열)
		
		
		// seoul korea
		System.out.println(s.compareTo("seoul korea"));
		//--==>> 0

		System.out.println(s.compareTo("seoul corea"));
		//--==>> 8
		//    d e f g h i j k
		//  c       ~       k

		
		// ○ 대상 문자열(s) 중
		//    해당 문자열을 찾아서 원하는 형태로 수정
		s = "우리나라 대한민국 대한독립 만세";
		s = s.replaceAll("대한", "자주");		// -- 정규식 사용 가능
		System.out.println(s);
		//--==>> 우리나라 자주민국 자주독립 만세
		
		s = "abcabcabcaaabcd";
		s = s.replace("abc", "T");				// -- 정규식 사용 불가
		System.out.println(s);
		//--==>> TTTaaTd


		s = "abcabcabcaaabcd";
		System.out.println(s.replace("abc", "T"));
		// 정규식 사용이 가능하므로 replace보다 사용빈도가 높음
		System.out.println(s.replaceAll("[abc]", "T"));	
		//--==>> TTTaaTd
		//		 TTTTTTTTTTTTTTd


		// ○ 공백 제거
		s = "          사          랑            ";
		System.out.println("|" + s + "|");
		//--==>> |          사          랑            |

		System.out.println("|" + s.trim() + "|");	
		// trim() -> 마치 손톱깎이와 같다.
		//--==>> |사          랑|
		//--> 양쪽 가장자리 공백 제거

		System.out.println("|" + s.replaceAll(" ", "") + "|");
		//--==>> |사랑|
		// --> 모든 공백 제거


		//String temp = Integer.parseInt("30");
		s = Integer.toString(30);
		System.out.println(s);


		int n = 2345678;
		System.out.printf("%d", n);
		System.out.format("%d", n);
		//--==>> 23456782345678

		System.out.println();

		s = String.format("%d", n);
		System.out.println(s);
		//--==>> 2345678

		System.out.format("%.2f", 3.141592);
		System.out.println();

		s = String.format("%.2f", 3.141592);
		//"3.14";
		System.out.println(s);
		//--==>> 3.14

		String[] strArr = "기본,열정,배려".split(",");
		
		for (String str : strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> 기본 열정 배려

	}
}