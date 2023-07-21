package com.sist.model;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
public class HotelModel {
	private String hotelURL = "http://www.jejutori.com/";
	@RequestMapping("hotel/hotel_list.do")
	public String hotel_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page==null)
			page="1";
		String type = request.getParameter("type");
		if (type == null)
			type="0";
		int curpage = Integer.parseInt(page);
		
		// DB연동
		HotelDAO dao = HotelDAO.newInstance();
		
		// 총페이지
		int totalpage = dao.hotelTotalPage(Integer.parseInt(type));

		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if (endPage > totalpage)
			endPage = totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("type", type);
		
		request.setAttribute("main_jsp", "../hotel/hotel_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("hotel/hotel_list_result.do")
	public String hotel_list_result(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page==null)
			page="1";
		String type = request.getParameter("type");
		if (type == null)
			type="0";
		
		int curpage = Integer.parseInt(page);
		
		// DB연동
		HotelDAO dao = HotelDAO.newInstance();
		List<HotelVO> list = dao.hotelListData(curpage, Integer.parseInt(type));
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("type", type);
		
		return "../hotel/hotel_list_result.jsp";
	}
	
	@RequestMapping("hotel/hotel_detail_before.do")
	public String hotel_detail_before(HttpServletRequest request, HttpServletResponse response) {
		
		String huno=request.getParameter("huno");
		
		Cookie cookie=new Cookie("hotel_"+huno, huno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:../hotel/hotel_detail.do?huno="+huno;
	}
	
	@RequestMapping("hotel/hotel_detail.do")
	public String hotel_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String huno=request.getParameter("huno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		// DAO 연결
		HotelDAO dao=HotelDAO.newInstance();
		// 결과값을 request에 묶어서 => goods_detail.jsp로 전송 
		HotelVO vo=dao.hotelDetailData(Integer.parseInt(huno));
		String[] images=vo.getPoster().split("\\^");
		int imagesLength = images.length;
		for (int i=0; i<imagesLength; i++) {
			images[i] = hotelURL + images[i];
		}
		
		// 댓글 가져오기
		int hdno = dao.hotelHdnoData(Integer.parseInt(huno));
		List<ReviewVO> rlist = dao.hotelReview(hdno);
		
		// 찜여부 확인
		if(id!=null) {
			HotelWishDAO wdao=HotelWishDAO.newInstance();
			int wish_count=wdao.hotelWishCount(id, vo.getHdno());
			request.setAttribute("wish_count", wish_count);
		}
		request.setAttribute("imagesLength", imagesLength);
		request.setAttribute("images", images);
		request.setAttribute("vo", vo);
		request.setAttribute("rlist", rlist);
		
		request.setAttribute("main_jsp", "../hotel/hotel_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("hotel/room_list.do")
	public String room_list(HttpServletRequest request, HttpServletResponse response) {

		String huno = request.getParameter("huno");
		String inwon = request.getParameter("inwon");
		int person = Integer.parseInt(inwon);
		String date = request.getParameter("date");
		String[] dateParts = date.split(" - ");
		
		// 날짜 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

        // 문자열을 LocalDate 객체로 변환
        LocalDate startDate = LocalDate.parse(dateParts[0], formatter);
        LocalDate endDate = LocalDate.parse(dateParts[1], formatter);
        
        // DAO 연동
        HotelDAO dao = HotelDAO.newInstance();
        List<RoomVO> rList = dao.roomListData(Integer.parseInt(huno), startDate.toString(), endDate.toString());

		
		// 불요데이터 제거
		int halfSize = rList.size() / 2;
		for (int i=rList.size()-1; i>=halfSize; i--) {
			rList.remove(i);
		}
		
		for (int i = 0; i < rList.size(); i++) {
		    RoomVO vo = rList.get(i);
			String[] posters = vo.getRposter().split("\\^");
			for (int j=0; j<posters.length; j++) {
				posters[j] = hotelURL+posters[j];
			}
			vo.setRposters(posters);
			
			// 인원에 따른 가격 계산
	        String pattern = "(\\d+)명"; // 숫자로 된 'n명' 패턴

	        // 패턴과 일치하는 숫자를 추출
	        Pattern regex = Pattern.compile(pattern);
	        Matcher matcher = regex.matcher(vo.getPerson());

	        // 추출된 숫자를 int 변수에 저장
	        int min = 0;
	        int max = 0;

	        // 최소인원 (최소인원에 못미치더라도 예약 가능, 최소인원보다 많을 경우 추가인원 1명당 20%씩 가격상승)
	        if (matcher.find()) {
	            min = Integer.parseInt(matcher.group(1));
	        }
	        
	        // 최대인원
	        if (matcher.find()) {
	            max = Integer.parseInt(matcher.group(1));
	        }
			
	        if(person > 1 && person > min) {
	        	if (person <= max) {
	        		double plusPrice = 1+((person - min)*0.2);
	        		vo.setPrice((int)(vo.getPrice()*plusPrice));
	        	}
	        }
	        vo.setMaxInwon(max);
		}
		request.setAttribute("inwon", inwon);
		request.setAttribute("date", date);
		request.setAttribute("rList", rList);
		
		return "../hotel/room_list.jsp";
	}
	
	// 호텔 예약
	@RequestMapping("hotel/hotel_reserve.do")
	public String hotel_reserve(HttpServletRequest request, HttpServletResponse response) {
		try {
		String inwon = request.getParameter("inwon");
		int person = Integer.parseInt(inwon);
		String date = request.getParameter("date");
		if (date==null)
			date="";
		String rno = request.getParameter("rno");
		String[] dateParts = date.split(" - ");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		String name=(String)session.getAttribute("name");
		
		// DAO연동
		HotelDAO dao = HotelDAO.newInstance();
		RoomVO vo = dao.roomSelectData(Integer.parseInt(rno));
		String hname = dao.hotelNameData(vo.getHuno());
		int hnameIdx = hname.indexOf("(");
		if (hnameIdx != -1) {
			hname = hname.substring(0, hnameIdx);
		}
		
		MemberDAO mdao = MemberDAO.newInstance();
		MemberVO mvo = mdao.memberSearch(id);
		mvo.setName(name);
		
		if (!date.equals("")) {
			// 날짜 형식 지정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

	        // 문자열을 LocalDate 객체로 변환
	        LocalDate startDate = LocalDate.parse(dateParts[0], formatter);
	        LocalDate endDate = LocalDate.parse(dateParts[1], formatter);

	        // 날짜 간의 차이 계산
	        long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
	        
	        // 요일 계산
	        String[] koreanDays = {"", "월", "화", "수", "목", "금", "토", "일"};
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
		// 메인포스터 저장
		String poster = vo.getRposter();
		poster = poster.substring(0, poster.indexOf("^"));
		vo.setRposter(hotelURL+poster);
		// 인원에 따른 가격 계산
        String pattern = "(\\d+)명"; // 숫자로 된 'n명' 패턴

        // 패턴과 일치하는 숫자를 추출
        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(vo.getPerson());

        // 추출된 숫자를 int 변수에 저장
        int min = 0;
        int max = 0;

        // 최소인원 (최소인원에 못미치더라도 예약 가능, 최소인원보다 많을 경우 추가인원 1명당 20%씩 가격상승)
        if (matcher.find()) {
            min = Integer.parseInt(matcher.group(1));
        }
        
        // 최대인원
        if (matcher.find()) {
            max = Integer.parseInt(matcher.group(1));
        }
		
        if(person > 1 && person > min) {
        	if (person <= max) {
        		double plusPrice = 1+((person - min)*0.2);
        		vo.setPrice((int)(vo.getPrice()*plusPrice));
        	}
        }
		
		request.setAttribute("inwon", inwon);
		request.setAttribute("hname", hname);
		request.setAttribute("vo", vo);
		request.setAttribute("mvo", mvo);
		request.setAttribute("date", date);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("main_jsp", "../hotel/hotel_reserve.jsp");
		return "../main/main.jsp";
	}
	
	
}
