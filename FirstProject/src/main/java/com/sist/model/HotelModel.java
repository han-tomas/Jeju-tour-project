package com.sist.model;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

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
		// DAO 연결
		HotelDAO dao=HotelDAO.newInstance();
		// 결과값을 request에 묶어서 => goods_detail.jsp로 전송 
		HotelVO vo=dao.hotelDetailData(Integer.parseInt(huno));
		String[] images=vo.getPoster().split("\\^");
		int imagesLength = images.length;
		for (int i=0; i<imagesLength; i++) {
			images[i] = hotelURL + images[i];
		}
		request.setAttribute("imagesLength", imagesLength);
		request.setAttribute("images", images);
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../hotel/hotel_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("hotel/room_list.do")
	public String room_list(HttpServletRequest request, HttpServletResponse response) {

		String huno = request.getParameter("huno");
		
		// DAO 연동
		HotelDAO dao = HotelDAO.newInstance();
		List<RoomVO> rList = dao.roomListData(Integer.parseInt(huno));
		for(RoomVO vo:rList) {
			String[] posters = vo.getRposter().split("\\^");
			for (int i=0; i<posters.length; i++) {
				posters[i] = hotelURL+posters[i];
			}
			vo.setRposters(posters);
		}
		
		request.setAttribute("rList", rList);
		return "../hotel/room_list.jsp";
	}
}
