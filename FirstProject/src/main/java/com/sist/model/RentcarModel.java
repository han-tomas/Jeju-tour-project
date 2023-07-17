package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

import com.sist.dao.RentcarDAO;
//import com.sist.dao.ReserveDAO;
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

		request.setAttribute("main_jsp", "../rentcar/rentcar_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("rentcar/rentcar_reserve.do")
	public String car_reserver(HttpServletRequest request, HttpServletResponse response)
	{	
		
		String cid=request.getParameter("cid");
		//String rent_day=request.getParameter("rent_day");
		String insOpt=request.getParameter("insOpt");
		request.setAttribute("insOpt",insOpt);
		/*
		 * String start_Date=request.getParameter("start_Date");
		 * request.setAttribute("start_Date", start_Date); String
		 * end_Date=request.getParameter("end_Date"); request.setAttribute("end_Date",
		 * end_Date); String useTime=request.getParameter("usetime");
		 * request.setAttribute("usetime", useTime);
		 * System.out.println("시작일1:"+start_Date); System.out.println("종료일1:"+end_Date);
		 * System.out.println(useTime);
		 */
		String date=request.getParameter("date");
		request.setAttribute("date", date);
		String[] dateParts = date.split(" - ");
		if (!date.equals("")) {
			// 날짜 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

	        // 문자열을 LocalDate 객체로 변환
	        LocalDate startDate = LocalDate.parse(dateParts[0], formatter);
	        LocalDate endDate = LocalDate.parse(dateParts[1], formatter);

	        // 날짜 간의 차이 계산
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
		 
		
		
		
		/*
		 * try { PrintWriter out = response.getWriter(); out.println(start_Date); }catch
		 * (Exception e) { e.printStackTrace(); }
		 */
		//String end_Date=request.getParameter("end_Date");
		//request.setAttribute("end_Date", end_Date);
		
		//String useTime=request.getParameter("useTime");
		//request.setAttribute("useTime", useTime);

		
		System.out.println(insOpt);
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
		
		String cid=request.getParameter("cid");
		String insOpt=request.getParameter("insOpt");
		request.setAttribute("insOpt",insOpt);
		RentcarDAO dao=RentcarDAO.newInstance();
		RentcarVO vo=dao.RentcarDetailData(Integer.parseInt(cid));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../rentcar/rentcar_reserve.jsp");
		//return "../rentcar/rentcar_reserve.do?cid="+cid;
		return "redirect:../rentcar/rentcar_reserve.do";
		
	}
	
	@RequestMapping("rentcar/rentcar_diary.do")
	  public String diaryData(HttpServletRequest request,HttpServletResponse response)
	  {
			/*
			 * String strYear=request.getParameter("year"); String
			 * strMonth=request.getParameter("month"); Date date=new Date();
			 * SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d"); String
			 * today=sdf.format(date); StringTokenizer st=new StringTokenizer(today,"-");
			 * String sy=st.nextToken(); String sm=st.nextToken(); String sd=st.nextToken();
			 * 
			 * if(strYear==null) strYear=sy;
			 * 
			 * if(strMonth==null) strMonth=sm;
			 * 
			 * int year=Integer.parseInt(strYear); int month=Integer.parseInt(strMonth); int
			 * day=Integer.parseInt(sd); // 요일 String[]
			 * strWeek={"일","월","화","수","목","금","토"};
			 * 
			 * Calendar cal=Calendar.getInstance(); cal.set(Calendar.YEAR,year);
			 * cal.set(Calendar.MONTH,month-1); cal.set(Calendar.DATE,1); // 1일자
			 * 
			 * int week=cal.get(Calendar.DAY_OF_WEEK);// 요일 구하기 int
			 * lastday=cal.getActualMaximum(Calendar.DATE);// 각달의 마지막 일
			 * 
			 * week=week-1;
			 * 
			 * 
			 * request.setAttribute("year", year); request.setAttribute("month", month);
			 * request.setAttribute("day", day); request.setAttribute("week", week);
			 * request.setAttribute("lastday", lastday); request.setAttribute("strWeek",
			 * strWeek);
			 * 
			 * 
			 * int[] rday=new int[32];
			 * 
			 * while(st.hasMoreTokens()) { int a=Integer.parseInt(st.nextToken());
			 * if(a>=day) { rday[a]=1; } } request.setAttribute("rday", rday);
			 */
	    return "../rentcar/rentcar_diary.jsp";
	  }
	
}
