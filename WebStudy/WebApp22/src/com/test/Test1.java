

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		//String name = "진영은";
		//String age = "13";
		
		// ○ 『web.xml』에 『<init-param>』 추가 후~!!! ------------------------------------------  
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화 할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		ServletConfig config = getServletConfig();
		//ServletContext context = getServletContext();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		// ------------------------------------------------『web.xml』에 『<init-param>』 추가 후~!!! 
	
		// ○ 『web.xml』에 『<context-param>』 추가 후~!!! ------------------------------------------  
		
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		// ------------------------------------------------『web.xml』에 『<context-param>』 추가 후~!!! 
		
		pw.println("<html>");
		pw.println("<body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "세" + "</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		
	}
}
