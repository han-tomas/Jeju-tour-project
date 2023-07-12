package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

import com.sist.dao.RentcarDAO;
import com.sist.vo.RentcarVO;

public class RentcarModel {
	@RequestMapping("rentcar/rentcar_main.do") 
	public String car_main(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		
		RentcarDAO dao=RentcarDAO.newInstance();
		
		List<RentcarVO> list=dao.RentcarListData(curpage);
		
		int totalpage=dao.RentcarTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "../rentcar/rentcar_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/rentcar_detail.before.do")
	  public String rentcar_detail_before(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  // no
		  String cid=request.getParameter("cid");
		  
		  // 전송값 => 상세보기 : primary key 
		  // 검색  => 검색어 
		  // 로그인 (id,pwd) , ....
		  // Cookie에 저장 
		  Cookie cookie=new Cookie("rentcar_"+cid, cid);
		  cookie.setPath("/");
		  cookie.setMaxAge(60*60*24);
		  response.addCookie(cookie);
		  
		  return "redirect:../rentcar/rentcar_detail.do?cid="+cid;
		  // sendRedirect() => 기존에 제작된 메소드 (메소드를 호출)
		  // => 반복 제거 => getConnection,
		  // forward => 새로운 데이터를 전송 
		  // sendRedirect => _ok.do , _before.do => 
	  }
	
	@RequestMapping("rentcar/rentcar_detail.do")
	public String car_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String cid=request.getParameter("cid");
		RentcarDAO dao=RentcarDAO.newInstance();
		RentcarVO vo=dao.RentcarDetailData(Integer.parseInt(cid));
		request.setAttribute("vo", vo);
		
		//String cid=request.getParameter("cid");
		request.setAttribute("main_jsp", "../rentcar/rentcar_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/rentcar_reserve.do")
	public String car_reserver(HttpServletRequest request, HttpServletResponse response)
	{
		String cid=request.getParameter("cid");
		RentcarDAO dao=RentcarDAO.newInstance();
		RentcarVO vo=dao.RentcarDetailData(Integer.parseInt(cid));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../rentcar/rentcar_reserve.jsp");
		//return "../rentcar/rentcar_reserve.do?cid="+cid;
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/day_opt.do")
	public String day_opt(HttpServletRequest request, HttpServletResponse response)
	{
		String strYear=request.getParameter("year");
	    String strMonth=request.getParameter("month");
	    Date date=new Date();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	    String today=sdf.format(date);
	    StringTokenizer st=new StringTokenizer(today,"-");
	    String sy=st.nextToken();
	    String sm=st.nextToken();
	    String sd=st.nextToken();
	    
	    if(strYear==null)
	    	strYear=sy;
	    
	    if(strMonth==null)
	    	strMonth=sm;
	    
	    int year=Integer.parseInt(strYear);
	    int month=Integer.parseInt(strMonth);
	    int day=Integer.parseInt(sd);
	    // 요일 
	    String[] strWeek={"일","월","화","수","목","금","토"};
	    
	    Calendar cal=Calendar.getInstance();
	    cal.set(Calendar.YEAR,year);
	    cal.set(Calendar.MONTH,month-1);
	    cal.set(Calendar.DATE,1); // 1일자 
	    
	    int week=cal.get(Calendar.DAY_OF_WEEK);// 요일 구하기
	    int lastday=cal.getActualMaximum(Calendar.DATE);// 각달의 마지막 일 
	    
	    week=week-1;
	    
	    request.setAttribute("year", year);
	    request.setAttribute("month", month);
	    request.setAttribute("day", day);
	    request.setAttribute("week", week);
	    request.setAttribute("lastday", lastday);
	    request.setAttribute("strWeek", strWeek);
	    request.setAttribute("main_jsp", "../rentcar/rentcar_diary.jsp");
	    return "../rentcar/rentcar_detail.jsp";
	}
}
