// MemberListController.java
// - 사용자 정의 컨트롤러 클래스
// - 회원들의 리스트 출력 액션.
// - DAO 객체에 대한 의존성 주입을 위한 준비
//   → setter injection
//      ① 인터페이스 형태의 자료형
//      ② setter 구성


package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

public class MemberListController implements Controller
{
	// 인터페이스 자료형
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	// ※ Controller 인터페이스의 메소드 재정의(Overriding)
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		int count = 0;
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try
		{
			count = dao.count();
			memberList = dao.list();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("/WEB-INF/views/MemberList.jsp");
		mav.addObject("count", count);
		mav.addObject("memberList", memberList);
		
		
		return mav;
	}
}
