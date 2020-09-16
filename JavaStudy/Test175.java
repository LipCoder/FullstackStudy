/*=======================================================
      ■■■ 컬렉션 프레임워크(Collection Framework) ■■■
=========================================================*/

// Map -> Hashtable, HashMap
// - java.util.Map 인터페이스는
//   키(key)를 값(value)에 매핑(mapping)하며
//   동일한 키를 등록할 수 없고, 유일해야 하며(키 중복불가),
//   각 키는 한 개의 값만을 매핑해야 한다. 
//   즉, 하나의 키 값에 대응하는 하나의 값을 갖는 자료구조이다.

/*
○ Hashtable<K, V> 클래스
 
  - 해시테이블 구조를 객체 모델링한 클래스로
    검색이 용이하기 때문에 사용 빈도 높은 편에 속한다.

  - 해시테이블이란 키(key)와 그에 상응하는 데이터(value)로
    구분된 데이터 구조이다.

  - 데이터를 저장하고, 검색하기 위해서 키(key)로 접근하며
    이 구조에서는 키 값을 부여하면 해당 데이터가 변환된다.

  - 또한, Hashtable 클래스는 key 또는 value 값으로 null을 허용하지 않는다.
*/

import java.util.Hashtable;

public class Test175
{
	
		private static final String[] names
			= {"박민하", "박혜인", "안혜리", "진영은", "김승범", "이진주"};

		private static final String[] tels
			= {"010-3308-8316", "010-9060-5327", "010-9458-3671"
			      ,"010-3690-7828", "010-3441-0260", "010-9013-7469"};
	
	
	public static void main(String[] args)
	{
		// Hashtable 자료구조 인스턴스 생성
		Hashtable<String, String> ht = new Hashtable<String, String>();

		// ht 라는 Hashtable 자료구조에 배열(names, tels)에 담겨있는
		// 데이터를 요소로 담아내기
		// -> put(k, v);
		for(int i = 0; i < names.length; i++) // tels.length
		{
			ht.put(names[i], tels[i]);
		}
		
		//System.out.println(ht);

		// ht 라는 Hashtable 의 값을... key를 이용하여 검색
		// -> get(k)
		String findName1 = "안혜리";
		String str = ht.get(findName1);
		if(str != null)
			System.out.println(findName1 + " 전화번호 : " + str);
		System.out.println();
		//--==>> 안혜리 전화번호 : 010-9458-3671

		// ht 라는 Hashtable 자료구조에... key 가 존재하는지의 여부 확인
		// -> containsKey()
		String findName2 = "윤홍준";
		if(ht.containsKey(findName2))
			System.out.println(findName2 + " 데이터가 존재합니다.");
		else
			System.out.println(findName2 + " 데이터가 존재하지 않습니다.");
		System.out.println();
		//--==>> 윤홍준 데이터가 존재하지 않습니다.


		String findName3 = "이진주";
		if(ht.containsKey(findName3))
			System.out.println(findName3 + " 데이터가 존재합니다.");
		else
			System.out.println(findName3 + " 데이터가 존재하지 않습니다.");
		System.out.println();
		//--==>> 이진주 데이터가 존재합니다.

		// ht 라는 Hashtable 자료구조에... value 가 존재하는지의 여부 확인
		// -> contains()
		String findTel1 = "010-7383-1339"; // 윤상
		if(ht.contains(findTel1))
			System.out.println(findTel1 + " 데이터가 존재합니다.");
		else
			System.out.println(findTel1 + " 데이터가 존재하지 않습니다.");
		System.out.println();
		//--==>> 010-7383-1339 데이터가 존재하지 않습니다.

		String findTel2 = "010-9060-5327"; // 윤상
		if(ht.contains(findTel2))
			System.out.println(findTel2 + " 데이터가 존재합니다.");
		else
			System.out.println(findTel2 + " 데이터가 존재하지 않습니다.");
		System.out.println();
		//--==>> 010-9060-5327 데이터가 존재합니다.


		// ht 라는 Hashtable 자료구조에서
		// [진영은] 데이터 삭제
		// -> remove()
		ht.remove("진영은");
		//-- [remove()] 메소드는 인자값으로 key 를 넘겨받지만
		//   이 때, key 만 삭제되는 것이 아니다.
		//   해당 key 와 연결되어(매핑되어) 있는 value 도 함께 remove() 된다.
		
		//   삭제(remove()) 이후 key 가 존재하는지 확인
		if(ht.containsKey("진영은"))
			System.out.println("영은이가 존재합니다.");
		else
			System.out.println("영은이 어디갔어?!!!!");
		System.out.println();
		//--==>> 영은이 어디갔어?!!!!

		//   삭제(remove()) 이후 value 가 존재하는지 확인
		if(ht.contains("010-3690-7828"))
			System.out.println("010-3690-7828 데이터가 존재합니다.");
		else
			System.out.println("010-3690-7828 데이터가 존재하지 않습니다.");
		System.out.println();
		//--==>> 010-3690-7828 데이터가 존재하지 않습니다.

		
		// null 관련 처리
		//ht.put(null, null);		     //-- key, value 모두 null	-> 런타임 에러
		//ht.put("이예슬", null);		     //-- value 가 null			-> 런타임 에러
		//ht.put(null, "010-3690-7828"); //-- key 가 null			-> 런타임 에러

		// 중복된 key 입력
		ht.put("김승범", "010-1234-1234");

		System.out.println(ht.get("김승범"));
		System.out.println();
		//--==>> 010-1234-1234
		//-- 기본 "010-3441-0260" 에서 "010-1234-1234"로 변경되었음을 확인
		//	 (덮어쓰기 개념)

		// 중복된 value 입력
		ht.put("이준구", "010-9013-7469");
		System.out.println(ht.get("이진주"));
		System.out.println(ht.get("이준구"));
		System.out.println();
		//--==>> "010-9013-7469"
		//		 "010-9013-7469"

		// value는 중복된 값이 되어도
		// 아무런 영향을 끼치지 않음

	}

}