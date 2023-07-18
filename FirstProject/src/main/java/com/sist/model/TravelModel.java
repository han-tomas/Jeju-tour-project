package com.sist.model;

import javax.servlet.http.Cookie;
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
		
		// Cookie 전송
		Cookie[] cookies=request.getCookies();
		List<TravelVO> cList=new ArrayList<TravelVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith("travel_"))
				{
					String tno=cookies[i].getValue();
					TravelVO tvo = dao.travelDetailData(Integer.parseInt(tno));
					cList.add(tvo);
				}
			}
		}
		request.setAttribute("cList", cList);
		
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
	@RequestMapping("travel/travel_find_detail_before.do")
	public String travel_find_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		//Cookie 생성
		String no =request.getParameter("no");
		Cookie cookie = new Cookie("travel_"+no, no);
		// 쿠키의 단점은 문자열만 저장이 가능 ... (요청한 사용자의 브라우저로전송)
		// 저장 위치 결정
		cookie.setPath("/");
		// 저장 기간 설정
		cookie.setMaxAge(60*60*24); // 초단위(하루 저장)
		// 전송 
		response.addCookie(cookie);
		// 전송
		return "redirect:../travel/travel_find_detail.do?no="+no;
	}
	@RequestMapping("travel/travel_find_detail.do")
	public String travel_find_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no = request.getParameter("no");
		//DAO 연결
		TravelDAO dao = TravelDAO.newInstance();
		TravelVO vo = dao.travelDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);

		request.setAttribute("main_jsp", "../travel/travel_find_detail.jsp");
		return "../main/main.jsp";
	}
	
}
