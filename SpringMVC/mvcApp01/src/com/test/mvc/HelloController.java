// HelloController.java
// - 사용자 정의 컨트롤러 클래스


package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 이 제공하는 『Controller』인터페이스를 구현함으로써
//    사용자 정의 컨트롤러 클래스를 구성한다.

public class HelloController implements Controller
{

	// 예전에 했던 get, post, process와 같은 개념...
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		String message = "Hello, Spring MVC World~!!!";
		
		mav.addObject("message", message);
		mav.setViewName("/WEB-INF/views/Hello.jsp");
		
		
		return mav;
	}

}
