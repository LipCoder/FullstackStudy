package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
{
	/* 전송을 위한(객체 직렬화를 위한) ID 
	 * (객체 인스턴스 => 쪼갬 => 송신 => 스트림 => 수신 => 다시조립 => 객체 인스턴스)
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
