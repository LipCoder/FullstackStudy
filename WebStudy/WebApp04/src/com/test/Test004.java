/* Servlet 관련 실습 */

// 현재... 자바 기본 클래스 Test004
// 이를 서블릿(Servlet)으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계

package com.test;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// GenericServlet으로 상속받는 순간 Test004는 서블릿이 된다. (추상클래스)
// 추상클래스이기 때문에 오버라이딩 해줘야한다.
public class Test004 extends GenericServlet   
{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
	}
	
}


