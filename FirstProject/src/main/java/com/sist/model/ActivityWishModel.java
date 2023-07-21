package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class ActivityWishModel {
	@RequestMapping("activity/activityWish_insert.do")
	public String activityWish_insert(HttpServletRequest request, HttpServletResponse response) {
		String acino=request.getParameter("acino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		WishReserveVO vo=new WishReserveVO();
		vo.setId(id);
		vo.setAcino(Integer.parseInt(acino));
		ActivityWishDAO dao=ActivityWishDAO.newInstance();
		dao.activityWishInsert(vo);
		
		return "redirect:../activity/activity_detail.do?acino="+acino;
	}
	
	@RequestMapping("activity/activityWish_cancle.do")
	public String ActivityWish_cancle(HttpServletRequest request, HttpServletResponse response) {
		String acino=request.getParameter("acino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		ActivityWishDAO dao=ActivityWishDAO.newInstance();
		dao.activityWishCancle(Integer.parseInt(acino), id);
		
		
		return "redirect:../activity/activity_detail.do?acino="+acino;
	}

	@RequestMapping("activity/activityWish_Mycancle.do")
	public String ActivityWish_Mycancle(HttpServletRequest request, HttpServletResponse response) {
		String acino=request.getParameter("acino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
		ActivityWishDAO dao=ActivityWishDAO.newInstance();
		dao.activityWishCancle(Integer.parseInt(acino), id);
		
		
		return "redirect:../mypage/mypage_jjim_list.do";
	}
}
