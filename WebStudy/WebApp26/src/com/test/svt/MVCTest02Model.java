// Model ������ ������ Ŭ����

package com.test.svt;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		// 1���� 100������ ���� ��ü(�÷���)�� �����ϴ� ����
		List<String> lists = new ArrayList<String>();
		for(int i = 1; i <= 100; i++)
			lists.add(String.valueOf(i));
		
		request.setAttribute("lists", lists);
	
		result = "WEB-INF/view/MVCTest02.jsp";
		
		return result;
	}
}
