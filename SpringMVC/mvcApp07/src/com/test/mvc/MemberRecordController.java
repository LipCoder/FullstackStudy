package com.test.mvc;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberRecordController
{
	// ※
	/*
	@RequestMapping(액션이름.action)
	public String 메소드이름(매개변수)
	{
		// ※ 비즈니스 로직 처리(모델 활용)
		// ...
		
		return "뷰이름.jsp"
	}
	*/
	
	// 데이터베이스로부터 멤버 리스트를 읽어오는 과정
	@RequestMapping("/memberlist.action")
	public String memberList(Model model)
	{
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connect();
			list = dao.lists();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.disConnect();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/MemberList.jsp";
	}
	
	
	// 데이터 입력 폼 요청 처리 과정
	@RequestMapping("/memberinsertform.action")
	public String memberInsertForm()
	{
		String result = "/WEB-INF/views/MemberInsertForm.jsp";
		return result;
	}
	
	// 데이터 입력 액션 요청 처리 과정
	@RequestMapping("/memberinsert.action")
	public String memberInsert(MemberDTO dto)
	{
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connect();
			dao.insertQuery(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.disConnect();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		return "/WEB-INF/views/MemberInsert.jsp";
	}
}
