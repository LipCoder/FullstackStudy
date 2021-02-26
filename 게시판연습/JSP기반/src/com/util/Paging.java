package com.util;

public class Paging
{
	// 페이지당 게시판 수, 총 게시판 수를 기준으로
	// 페이지 갯수를 구한다.
	public int getPageCount(int numPerPage, int boardCount)
	{
		int pageCount = 0;
		
		pageCount = boardCount / numPerPage;
		
		// 페이지당 게시판 수 만큼 게시판을 채워넣고도
		// 남은 게시판이 있다면
		// 이를 담을 페이지를 하나 더 만들어야 한다.
		if(boardCount % numPerPage != 0)
			++pageCount;
		
		return pageCount;
	}
	
	// 페이징 처리
	public String getIndexList(int currentPage, int totalPage, String url)
	{
		// 페이징이 필요하지 않는 경우
		if(currentPage == 0)
			return "";
		
		StringBuffer strList = new StringBuffer();
		
		// 하단에 보여줄 페이지 수
		int numPerBlock = 10;
		
		// url 뒤에 ?를 붙인다.
		// 이미 붙어있다면 &를 붙인다.
		url += url.indexOf("?") == -1 ? "?" : "&";
		
		// 하단에 표시할 첫 페이지를 계산한다.
		int startPage = (currentPage / numPerBlock) * numPerBlock + 1;
		
		// 현재 페이지가 끝에 있다면 기존 시작 페이지에서
		// numPerBlock 만큼 빼준값이 시작 페이지가 된다.
		// 예를들어 currentPage가 20인 경우 startPage는 21이 될것이다.
		// 하지만 하단에는 페이지인덱스를 11 ~ 20까지 보여줘야 하므로
		// startPage는 11이 되어야한다.
		if(currentPage % numPerBlock == 0)
			startPage = startPage - numPerBlock;
		
		// 맨 처음 페이지
		if(totalPage > numPerBlock && startPage > numPerBlock)
			strList.append("<a href='" + url + "pageNum=1'>1</a>");
		
		// 현재 페이지에서 numPerBlock만큼 이전으로 이동 페이지
		int gap = currentPage - numPerBlock;
		if(totalPage > numPerBlock && startPage > numPerBlock)
			strList.append(" <a href='" + url + "pageNum=" + gap + "'>Prev</a>");
		
		// 하단 페이지를 만들기 위한 작업
		int page = startPage;
		while(page <= totalPage && page < startPage + numPerBlock)
		{
			// 현재 페이지는 페이지 이동이 필요없으므로
			// 현재 페이지임을 알 수 있게 강조 표시만 해준다.
			if(page == currentPage)
				strList.append(" <span style='color:orange; font-weight: bold;'>" + page + "</span>");
			else
				strList.append(" <a href='" + url + "pageNum=" + page + "'>" + page +"</a>");
			
			++page;
		}
		
		// 현재 페이지에서 numPerBlock만큼 다음으로 이동 페이지
		gap = currentPage + numPerBlock;
		if(totalPage - startPage > numPerBlock)
			strList.append(" <a href='" + url + "pageNum=" + gap + "'>Next</a>");
		
		// 맨 마지막 페이지
		if(totalPage > numPerBlock && startPage + numPerBlock < totalPage)
			strList.append("<a href='" + url + "pageNum=" + totalPage + "'> " + totalPage + "</a>");
		
		return strList.toString();
	}
}
