// #39.RegionUpdateController.java
// - 사용자 정의 컨트롤러 클래스
// - 지역 데이터 수정 액션 수행 및 해당 액션 수행 이후
//   『regionlist.action』을 요청할 수 있도록 처리.
// - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
//   → 인터페이스 자료형, setter 메소드 정의.

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//※ Spring 이 제공하는 『Controller』 인터페이스를 구현함으로써
//사용자 정의 컨트롤러 클래스를 구성한다.

public class RegionUpdateController implements Controller
{
	private IRegionDAO dao;
	
	public void setDao(IRegionDAO dao)
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
			// 다시 과리자로 로그인할 수 있도록 처리
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// ---------------------------------세션 처리 과정 추가(로그인에 대한 확인 과정 추가)

		try
		{
			// 데이터 수신(RegionUpdateForm.jsp 로 부터... regionId, regionName 수신)
			String regionId = request.getParameter("regionId");
			String regionName = request.getParameter("regionName");
			
			Region region = new Region();
			region.setRegionId(regionId);
			region.setRegionName(regionName);
			
			dao.modify(region);
			
			mav.setViewName("redirect:regionlist.action");		
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
