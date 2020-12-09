// HelloReceive02.java

package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// ����� ��û�� GET ����� ��� Servlet Container �� ���� �ڵ����� ȣ��Ǵ� �޼ҵ�
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	// ����� ��û�� POST ����� ��� Servlet Container �� ���� �ڵ����� ȣ��Ǵ� �޼ҵ�
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}
	
	// GET ����̵� POST ����̵� ��� ó���� �� �ִ� ����� ���� �޼ҵ�
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		// ���� ���� �ڵ�
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String result = "name : " + name + " , age : "  + age;
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/HelloReceive02.jsp");
		dispatcher.forward(request, response);
	}
}
