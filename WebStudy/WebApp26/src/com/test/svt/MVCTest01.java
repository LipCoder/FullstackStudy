package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
{
	/* ������ ����(��ü ����ȭ�� ����) ID 
	 * (��ü �ν��Ͻ� => �ɰ� => �۽� => ��Ʈ�� => ���� => �ٽ����� => ��ü �ν��Ͻ�)
	 * */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		StringBuffer message = new StringBuffer();
		message.append("<table>");
		
		for (int i = 1; i <= 100; i++)
		{
			message.append("<tr>" + "<th>" + i + "</th>" + "</tr>");
		}
		
		message.append("</table>");
		
		request.setAttribute("message", message.toString());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
		dispatcher.forward(request, response);
	}
}
