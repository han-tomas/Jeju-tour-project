package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.HotelWishDAO;
import com.sist.vo.*;

public class HotelWishModel {
	@RequestMapping("hotel/hotelWish_insert.do")
	public String hotelWish_insert(HttpServletRequest request, HttpServletResponse response) {
		String huno=request.getParameter("huno");
		String hdno=request.getParameter("hdno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setHdno(Integer.parseInt(hdno));
		HotelWishDAO dao=HotelWishDAO.newInstance();
		dao.hotelWishInsert(vo);
		
		return "redirect:../hotel/hotel_detail.do?huno="+huno;
	}
	
	@RequestMapping("hotel/hotelWish_cancle.do")
	public String HotelWish_cancle(HttpServletRequest request, HttpServletResponse response) {
		String huno=request.getParameter("huno");
		String hdno=request.getParameter("hdno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setHdno(Integer.parseInt(hdno));
		HotelWishDAO dao=HotelWishDAO.newInstance();
		dao.hotelWishCancle(vo);
		
		return "redirect:../hotel/hotel_detail.do?huno="+huno;
	}
	
	@RequestMapping("hotel/hotelWish_Mycancle.do")
	public String HotelWish_Mycancle(HttpServletRequest request, HttpServletResponse response) {
		String hdno=request.getParameter("hdno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setHdno(Integer.parseInt(hdno));
		HotelWishDAO dao=HotelWishDAO.newInstance();
		dao.hotelWishCancle(vo);
		
		return "redirect:../mypage/mypage_jjim_list.do";
	}
}
