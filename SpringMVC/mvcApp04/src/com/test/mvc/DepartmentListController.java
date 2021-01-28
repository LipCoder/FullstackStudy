// #41.DepartmentListController.java
// - 사용자 정의 컨트롤러 클래스
// - 부서에 대한 정보를 리스트 형태로 출력
//   DepartmentList.jsp 요청
// - DAO에 대한 의존성 주입(DI)
//   인터페이스, setter를 이용


package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

public class DepartmentListController implements Controller
{
	private IDepartmentDAO dao;
	
	public void setDao(IDepartmentDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
		// 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)---------------------------------
		HttpSession session = request.getSession();
				
		// 로그인이 안된 상태에서 직접 페이지를 요청하는 상황
		if (session.getAttribute("name") == null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		// 로그인은 되어 있지만 관리자가 아닌 상황
		else if (session.getAttribute("admin") == null)
		{
			// -- 일반 사원으로 로그인되어있는 상황을 해제하고
			// 다시 관리자로 로그인할 수 있도록 처리
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// ---------------------------------세션 처리 과정 추가(로그인에 대한 확인 과정 추가)
		
		ArrayList<Department> departmentList = new ArrayList<Department>();
		
		try
		{
			departmentList = dao.list();
			
			mav.addObject("departmentList", departmentList);
			
			mav.setViewName("DepartmentList");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
}
