/*==================
 	MemberMain.java
 	- 컨트롤러
===================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.dao.IMemberDAO;
import com.test.dto.MemberDTO;

// to 컨트롤러
// 베이스 패키지의 클래스들을 스캔하다가... 이 내용을 발견하면 컨트롤러로 등록해 줬으면 좋겠다...
@Controller
public class MemberMain
{
	// to 컨트롤러
	// 여기에는 sqlSession 관련 객체를 생성해서.. 주입해 줬으면 좋겠다...
	// 자동으로 와이어로 연결해주겠다...
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping(value="/memberlist.action", method = RequestMethod.GET)
	public String memberList(ModelMap model)
	{
		//IMemberDAO dao = (IMemberDAO)new MemberDAO();
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/MemberList.jsp";
	}
	
	@RequestMapping(value="/memberinsert.action", method = RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
	
		dao.add(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value="/memberdelete.action", method = RequestMethod.GET)
	public String memberDelete(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(m);
		
		return "redirect:memberlist.action";
	}
}
