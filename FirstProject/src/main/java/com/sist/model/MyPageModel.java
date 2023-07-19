package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

public class MyPageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_jjim_list.do")
	public String jjim_list(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		CourseJJimRecommendDAO dao = CourseJJimRecommendDAO.newInstance();
		List<CourseJJimVO> list  = dao.courseJJimListData(id);
		
		FoodJjimDAO fdao=FoodJjimDAO.newInstance();
		List<FoodJjimVO> flist=fdao.foodjjimListData(id);
		
		request.setAttribute("flist", flist);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_jjim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("mypage/mypage_activity_reserve.do")
	public String mypage_activity_reserve(HttpServletRequest request, HttpServletResponse response) {
		String acino=request.getParameter("acino");
		String strInwon=request.getParameter("inwon");
		String strPrice=request.getParameter("price");
		String strTprice=request.getParameter("tprice");
		String dbday=request.getParameter("dbday");
		int inwon=Integer.parseInt(strInwon);
		int price=Integer.parseInt(strPrice);
		int tprice=Integer.parseInt(strTprice);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		MemberDAO mdao=MemberDAO.newInstance();
		MemberVO mvo=mdao.memberSearch(id);
		ActivityDAO adao=ActivityDAO.newInstance();
		ActivityVO avo=adao.activityDetailData(Integer.parseInt(acino));
		ReservationVO arvo=new ReservationVO();
		
		arvo.setDbday(dbday);
		arvo.setAcino(avo.getAcino());
		arvo.setId(id);
		arvo.setRname(name);
		arvo.setRemail(mvo.getEmail());
		arvo.setRphone(mvo.getPhone());
		arvo.setInwon(inwon);
		arvo.setPrice(price);
		arvo.setTprice(tprice);
		arvo.setPoster(avo.getMain_poster());
		arvo.setTitle(avo.getTitle());
		
		adao.activityReserveOk(arvo);
		
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	@RequestMapping("mypage/mypage_reserve.do")
	public String mypage_reserve(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MypageDAO mydao=MypageDAO.newInstance();
		List<ReservationVO> list=mydao.reservationListData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_cart.do")
	public String mypage_cart(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("mypage_jsp", "../mypage/mypage_cart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
}
