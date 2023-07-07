package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.vo.HotelVO;

public class HotelModel {
	@RequestMapping("hotel/hotel_list.do")
	public String hotel_list(HttpServletRequest request, HttpServletResponse response) {
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
		
		// 총페이지
		int totalpage = dao.goodsTotalPage(Integer.parseInt(type));
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("type", type);
		
		return "../hotel/hotel_list_result.jsp";
	}
}
