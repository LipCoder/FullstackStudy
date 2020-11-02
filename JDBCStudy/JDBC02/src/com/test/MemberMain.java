/* =======================================
 *    MemberMain.java
 *    - main() 메소드를 포함하고 있는 클래스
 * =======================================*/

/*
 ○ TBL_MEMBER 테이블을 활용하여
    이름과 전화번호를 여러 건 입력받고
    결과를 전체 출력하는 기능을 가진 프로그램을 구현한다.
    단, 데이터베이스 연동이 이루어져야 하고
    MemberTDO, MemberDAT 클래스를 활용해야 한다.
    
실행 예)

이름 전화번호 입력(1) : 김보경 010-1111-1111
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(2) : 이예슬 010-2222-2222
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(3) : 안혜리 010-3333-3333
>> 회원 정보 입력 완료~!!!
이름 전화번호 입력(4) : .

---------------------------------------------
전체 회원 수 : 3명
---------------------------------------------
번호    이름    전화번호
  1    김보경  010-1111-1111
  2    이예슬  010-2222-2222
  3    안혜리  010-3333-3333
---------------------------------------------
 */

package com.test;

import java.sql.SQLException;

public class MemberMain
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		// for test
		/*
		 * MemberDAO dao = new MemberDAO();
		 * 
		 * for(MemberDTO d : dao.lists()) { System.out.println(d.getSid() + " " +
		 * d.getName() + " " + d.getTel()); }
		 */
	}
}






















