package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.RentcarWishDAO;
import com.sist.vo.WishReserveVO;

public class RentcarWishModel {
	
	@RequestMapping("rentcar/rentcarWish_insert.do")
	public String rentcarWish_insert(HttpServletRequest request, HttpServletResponse response) {
		String cid=request.getParameter("cid");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setCid(Integer.parseInt(cid));
		RentcarWishDAO dao=RentcarWishDAO.newInstance();
		dao.rentcarWishInsert(vo);
		
		return "redirect:../rentcar/rentcar_detail.do?cid="+cid;
	}
	
	@RequestMapping("rentcar/rentcarWish_cancel.do")
	public String rentcarWish_cancel(HttpServletRequest request, HttpServletResponse response) {
		String cid=request.getParameter("cid");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setCid(Integer.parseInt(cid));
		RentcarWishDAO dao=RentcarWishDAO.newInstance();
		dao.rentcarWishCancel(vo);
		
		
		return "redirect:../rentcar/rentcar_detail.do?cid="+cid;
	}
}
