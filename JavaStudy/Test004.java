/*=============================================
     ■■■ 자바 기본 프로그래밍 ■■■
	 - 변수와 자료형
	 - 키워드와 식별자
=============================================*/

public class Test004
{
	public static void main(String[] args)
	{
		double height = 172.8;
		int age = 25;
		char degree = 'A';
	
		// 문자열을 담아낼 수 있는 클래스
		String name = "강정우";
		name = "권소윤";
		// -- 스코프 영역 안에서 변수명은 식별자!!!

		//String #name = "김승범";
		// --	변수명에서 사용할 수 있는 특수문자는 [$], [_] 뿐이다.
		//		하지만 이 마저도 함부로 사용하는 것은 고려를 해야 한다.
	
		//int tel = 01011112222;		//앞에 0이 들어가는 데이터가 필요한 경우에는 
		String tel = "01011112222";		//문자열로 선언한다.
		String _tel = "010-1111-2222";	

		String 주소 = "경기도 고양시";  
		// -- 한글 변수는 문법적으로는 가능하지만 실무에서는 절대 쓰면 안된다.

		// 결과 출력
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("tel : " + tel);
		System.out.println("_tel : " + _tel);
		System.out.println("주소 : " + 주소);

	}
}

/*
name : 권소윤
age : 25
tel : 01011112222
_tel : 010-1111-2222
주소 : 경기도 고양시
계속하려면 아무 키나 누르십시오 . . .
*/