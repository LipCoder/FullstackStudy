// #56. PositionAjaxController.java
// - 사용자 정의 컨트롤러 클래스
// - 직위 리스트 중복검사 결과 반환 액션.
// - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
//   → 인터페이스 자료형, setter 메소드 정의.

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

public class PositionAjaxController implements Controller
{
	private IPositionDAO dao;
	
	
	public void setDao(IPositionDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 수신(PositionInsertForm.jsp 로 부터... positionName 수신)
		String positionName = request.getParameter("positionName");
				
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		String str = "사용할 수 있는 이름입니다.";
		try
		{
			positionList = dao.list();
			
			for(Position position : positionList)
			{
				if(position.getPositionName().equals(positionName))
				{
					str = "이미 사용중인 이름이 존재합니다.";
					break;
				}
			}
			
			mav.addObject("result", str);
			
			mav.setViewName("PositionAjax");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return mav;
	}
}
