package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02 extends HttpServlet
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
		
		// �� ��ü ���� �� ��� ����(View)
		MVCTest02Model model = new MVCTest02Model();
		String view = model.actionCount(request, response);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}