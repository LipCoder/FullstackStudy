// SampleServlet.java

package com.test.spr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SampleServlet extends HttpServlet
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
		// ���� ���� �ڵ�
	
		
	}
}
