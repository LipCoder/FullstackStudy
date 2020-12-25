// SampleController.java
// - 사용자 정의 컨트롤러 클래스


package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class ReceiveController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 수신(Send.jsp 로 부터...)
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		
		// 수신한 데이터 처리(추가 연산이나 가공)
		userName += "님, 환영합니다.";
		
		mav.addObject("userName", userName);
		mav.setViewName("/WEB-INF/views/Receive.jsp");
		
		return mav;
	}
}
