// MemberInsertController.java
// - 사용자 정의 컨트롤러 클래스
// - 회원 데이터 추가 액션 처리 클래스.
// - Connection 객체에 대한 의존성 주입을 위한 준비.
//   → setter injection
//      ① 인터페이스 형태의 자료형
//      ② setter 구성(setter 메소드 정의)

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

//※ 『implements Controller』 또는 『extends AbstractController』
//--   서블릿에서 『HttpServlet』을 상속받은 서블릿 객체 역할

public class MemberInsertController implements Controller
{
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	// ※ Controller 인터페이스의 메서드 재정의(Overriding)

	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 수신 (MemberList.jsp 로 부터...)
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			member.setName(name);
			member.setTelephone(telephone);
			
			dao.add(member);
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		// mav.setViewName("redirect:memberlistl 
		mav.setViewName("redirect:memberlist.action");
		
		return mav;
	}
}
