package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class TravelModel {
	@RequestMapping("travel/travel_find.do")
	public String travel_find(HttpServletRequest request,HttpServletResponse response)
	{
		// 검색어를 받는다.
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String fd=request.getParameter("fd");
		if(fd==null)
		{
			fd="";
		}
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		TravelDAO dao= TravelDAO.newInstance();
		String lno = request.getParameter("lno");
		List<TravelVO> list = new ArrayList<TravelVO>();
		if(lno!=null)
		{
			list = dao.travelCategoryFindData(fd, curpage, Integer.parseInt(lno));
		}
		else
		{
			list = dao.travelFindData(fd, curpage);
		}
		int totalpage=0;
		if(lno!=null)
		{
			totalpage=dao.travelCategoryFindTotalPage(fd, Integer.parseInt(lno));
		}
		else
		{
			totalpage=dao.travelFindTotalPage(fd);
		}
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("fd", fd);
		request.setAttribute("lno", lno);
		request.setAttribute("main_jsp", "../travel/travel_find.jsp");
		return "../main/main.jsp";
	}
}
