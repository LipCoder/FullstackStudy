/*=================================
 	IMemberDAO.java
 	- 인터페이스
===================================*/

package com.test.dao;

import java.util.ArrayList;

import com.test.dto.MemberDTO;

public interface IMemberDAO
{
	public int add(MemberDTO m);
	public int count();
	public ArrayList<MemberDTO> list();
	public int remove(MemberDTO m);
}
