package com.sist.model;

import java.time.DayOfWeek;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.RentcarDAO;
import com.sist.vo.MemberVO;
//import com.sist.dao.ReserveDAO;
import com.sist.vo.RentcarVO;

public class RentcarModel {
	@RequestMapping("rentcar/rentcar_main.do") 
	public String car_main(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";	
		String type=request.getParameter("type");
		if (type=="1")
			type="";
		else if (type==null)
			type="";
		int curpage=Integer.parseInt(page);
		
		RentcarDAO dao=RentcarDAO.newInstance();
		
		
		//int totalpage=dao.RentcarSortTotalPage(Integer.parseInt(type));
		int totalpage=dao.RentcarTotalPage();
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if (endPage > totalpage)
			endPage = totalpage;
		
		//request.setAttribute("sList", sList);
		//request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("type", type);
		
		request.setAttribute("main_jsp", "../rentcar/rentcar_main.jsp");
		
		return "../main/main.jsp";
	}
	@RequestMapping("rentcar/rentcar_main_result.do")
	public String Rentcar_main_result(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page==null)
			page="1";
		String type = request.getParameter("type");
		if (type == null)
			type="0";
		
		int curpage = Integer.parseInt(page);
		
		// DB연동
		RentcarDAO dao = RentcarDAO.newInstance();
		List<RentcarVO> sList = dao.RentcarSort(curpage, Integer.parseInt(type));
		
		request.setAttribute("sList", sList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("type", type);
		
		return "../rentcar/rentcar_main_result.jsp";
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

		request.setAttribute("main_jsp", "../rentcar/rentcar_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/rentcar_reserve.do")
	public String car_reserver(HttpServletRequest request, HttpServletResponse response)
	{	
		try
		{
			request.setCharacterEncoding("UTF-8");
			
			//String rent_day=request.getParameter("rent_day");
			String insOpt=request.getParameter("insOpt");
			request.setAttribute("insOpt",insOpt);
			//HttpSession session=request.getSession();
			//String id=(String)session.getAttribute("id");
			
			int insPrice=0;
			if (insOpt.equals("고급자차")) // 문자열 비교에 equals() 메서드 사용
			    insPrice = 10000;
			else if (insOpt.equals("일반자차")) // 문자열 비교에 equals() 메서드 사용
			    insPrice = 5000;
			else
			    insPrice = 0;
			request.setAttribute("insPrice", insPrice);
			
		}catch(Exception ex) {}
			String date=request.getParameter("date");
			request.setAttribute("date", date);
			String[] dateParts = date.split(" - ");
			String cid=request.getParameter("cid");
		if (!date.equals("")) {
			// 날짜 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
	        
	        // 문자열을 LocalDate 객체로 변환
	        LocalDate startDate = LocalDate.parse(dateParts[0], formatter);
	        LocalDate endDate = LocalDate.parse(dateParts[1], formatter);
	        //LocalDate currentDate = LocalDate.now();
	        
	        
	        long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
			
			 
	        
	        // 요일 계산
	        String[] koreanDays = {"일", "월", "화", "수", "목", "금", "토"};
	        DayOfWeek startDateOfWeek = startDate.getDayOfWeek();
	        DayOfWeek endDateOfWeek = endDate.getDayOfWeek();
	        int startDateOfWeekValue = startDateOfWeek.getValue();
	        int endDateOfWeekValue = endDateOfWeek.getValue(); 
	        
	        String start = koreanDays[startDateOfWeekValue];
	        String end = koreanDays[endDateOfWeekValue];
	        request.setAttribute("startDate", startDate);
	        request.setAttribute("endDate", endDate);
	        
	        request.setAttribute("date", startDate + "(" + start + ") ~ "
	        						+ endDate + "(" + end + ")");
	        request.setAttribute("days", daysBetween);	
		}
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		MemberDAO mdao=MemberDAO.newInstance();
		MemberVO mvo=mdao.memberSearch(id);
		request.setAttribute("mvo", mvo);
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		
		//request.setAttribute("rent_day", rent_day);
		RentcarDAO dao=RentcarDAO.newInstance();
		RentcarVO vo=dao.RentcarDetailData(Integer.parseInt(cid));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../rentcar/rentcar_reserve.jsp");
		
		//return "../rentcar/rentcar_reserve.do?cid="+cid;
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/rentcar_reserve_ok.do")
	public String car_reserve_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		  {
			  
			  String cid=request.getParameter("cid");
				String insOpt=request.getParameter("insOpt");
				request.setAttribute("insOpt",insOpt);
				RentcarDAO dao=RentcarDAO.newInstance();
				RentcarVO vo=dao.RentcarDetailData(Integer.parseInt(cid));
				request.setAttribute("vo", vo);
				request.setAttribute("main_jsp", "../rentcar/rentcar_reserve.jsp");
		  }catch(Exception ex) {}
		
		//return "../rentcar/rentcar_reserve.do?cid="+cid;
		return "redirect:../rentcar/rentcar_reserve.do";
	
		
	}
	@RequestMapping("rentcar/agreeBtn1.do")
	public String agreeBtn1(HttpServletRequest request, HttpServletResponse response) {
		return "../rentcar/agreeBtn1.jsp";
	}
	@RequestMapping("rentcar/agreeBtn2.do")
	public String agreeBtn2(HttpServletRequest request, HttpServletResponse response) {
		return "../rentcar/agreeBtn2.jsp";
	}
	@RequestMapping("rentcar/agreeBtn3.do")
	public String agreeBtn3(HttpServletRequest request, HttpServletResponse response) {
		return "../rentcar/agreeBtn3.jsp";
	}
	
}
