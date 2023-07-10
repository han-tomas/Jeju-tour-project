package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.sql.*;
public class ActivityModel {
	@RequestMapping("activity/activity_list.do") 
	public String activity_list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../activity/activity_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("activity/activity_list_result.do")
	public String activity_list_result(HttpServletRequest request, HttpServletResponse response) {
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String accno=request.getParameter("accno");
		if(accno==null)
			accno="1";
		ActivityDAO dao=ActivityDAO.newInstance();
		List<ActivityCategoryVO> cList=dao.activityCategoryListData();
		List<ActivityVO> list=dao.activityListData(Integer.parseInt(page), Integer.parseInt(accno));
		int totalCategory=dao.totalCategoryCount(Integer.parseInt(accno));
		int curpage=Integer.parseInt(page);
		int totalpage=dao.activityTotalPage(Integer.parseInt(accno));
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		
		request.setAttribute("accno", accno);
		request.setAttribute("totalCategory", totalCategory);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("cList", cList);
		request.setAttribute("list", list);
		
		return "../activity/activity_list_result.jsp";
	}
	
	@RequestMapping("activity/activity_detail_before.do")
	public String activity_detail_before(HttpServletRequest request, HttpServletResponse response) {
		
		String acino=request.getParameter("acino");
		
		Cookie cookie=new Cookie("activity_"+acino, acino);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:../activity/activity_detail.do?acino="+acino;
	}
	
	@RequestMapping("activity/activity_detail.do")
	public String goods_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String acino=request.getParameter("acino");
		// DAO 연결
		ActivityDAO dao=ActivityDAO.newInstance();
		// 결과값을 request에 묶어서 => goods_detail.jsp로 전송 
		ActivityVO vo=dao.activityDetailData(Integer.parseInt(acino));
		if(vo.getPoster()==null)
			vo.setPoster(vo.getMain_poster());
		String[] images=vo.getPoster().split("\\^");
		int imagesLength = images.length;
		String addr1=vo.getLocation_name();
		request.setAttribute("addr1", addr1);
		request.setAttribute("imagesLength", imagesLength);
		request.setAttribute("images", images);
		request.setAttribute("vo", vo);
		// 데이터 => goods_detail
		request.setAttribute("main_jsp", "../activity/activity_detail.jsp");
		return "../main/main.jsp";
	}
}
