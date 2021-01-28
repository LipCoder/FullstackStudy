package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GradeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/gradelist.action", method = RequestMethod.GET)
	public String studentList(ModelMap model)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/GradeList.jsp";
	}
	
	@RequestMapping(value="/gradeform.action", method = RequestMethod.GET)
	public String studentForm()
	{
		return "WEB-INF/views/GradeForm.jsp";
	}
	
	@RequestMapping(value="/gradeinsert.action", method = RequestMethod.POST)
	public String studentInsert(GradeDTO g)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.add(g);
		
		return "redirect:gradelist.action";
	}
	
	@RequestMapping(value="/grademodifyform.action", method = RequestMethod.GET)
	public String studentModifyForm(ModelMap model, GradeDTO g)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("info", dao.search(g));
		
		return "WEB-INF/views/GradeModifyForm.jsp";
	}
	
	@RequestMapping(value="/grademodify.action", method = RequestMethod.POST)
	public String studentModify(GradeDTO g)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
	
		dao.modify(g);
		
		return "redirect:gradelist.action";
	}
	
	
	@RequestMapping(value="/gradedelete.action", method = RequestMethod.GET)
	public String studentDelete(GradeDTO g)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.remove(g);
		
		return "redirect:gradelist.action";
	}
}
