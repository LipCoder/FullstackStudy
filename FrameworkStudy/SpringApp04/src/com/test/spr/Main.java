// Main.java
// - main() 메소드를 포함하는 테스트 클래스

package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		//IDAO dao = new OracleDAO();
		//IDAO dao1 = new MssqlDAO();
		
		//MemberList member = new MemberList();
		//member.setDao(dao1);
		
		//member.print();
		
		// ※ 객체 생성 과정을 스프링(스프링 컨테이너, IoC 컨테이너)이 담당하게 되므로
		//    인스턴스 생성 구문을 모두 삭제한다.
		
		// 스프링 환경 설정 파일로 구성한 『applicationContext.xml』로 부터
		// MemberList 객체를 얻어올 수 있도록 처리한다.
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		MemberList memberList = context.getBean("memberList", MemberList.class);
		memberList.print();
	
	}
}
