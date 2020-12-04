// SampleServlet.java

package com.test.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCBegin extends HttpServlet
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

		String message = "�ȳ��ϼ���, MVC �����Դϴ�.";
		
		// View ������ �����ϴ� JSP �������� ������ ����
		request.setAttribute("message", message);
		
		// check~!!! ��
		// �����(���� �帧)�� JSP ������(View)�� �����ؾ� �Ѵ�.
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCBegin.jsp");
		dispatcher.forward(request, response);
		//-- ��javax.servlet.RequestDispatcher�� Ŭ������
		//   ���� Ŭ���̾�Ʈ�� ��û�� �ٸ� ���� / JSP �������� �����ϰų�
		//   �ٸ� ���� / JSP �������� ����� ���� ��ġ�� ���Խ�Ű����
		//   �� �� ���ȴ�.
		
		// �� ��RequestDispatcher�� ��ü��
		//    �̿� ���� ����� �����ϱ� ����
		//    ��forward()�� �޼ҵ�� ��include()�� �޼ҵ带 �����ϰ� ������
		//    �� �� �޼ҵ�� JSP�� ��<jsp:forward>�� �׼��±�
		//    ��<jsp:include>�� �׼� �±׿� ������ ����� �����Ѵ�.
		//    ���� ���� ���� ��û�� ��MVCBegin.jsp���� �������� �ϴ� ����̴�.
		
		// ==> �� �⺻ ��2(MVC) ������
		//     �ٷ� �� ��RequestDispatcher.forward()�� �޼ҵ带 ���� �����ȴ�.
		//
	}
}
