

package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 한글 깨짐 방지 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(Test2.jsp)로 부터 데이터 수신
		// → name, age
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String str = "이름 : " + name + ", 나이 : " + age + "세";
		
		// 포워딩하는 페이지에 값을 넘겨주기 위한 준비(설정)
		request.setAttribute("result", str);
		//-- str 값을 result 라는 이름으로 Test_result.jsp로 넘길 준비
		
		// 포워딩~!!!
		RequestDispatcher rd = request.getRequestDispatcher("/Test2_result.jsp");
		rd.forward(request, response);
		
	}
	
}
