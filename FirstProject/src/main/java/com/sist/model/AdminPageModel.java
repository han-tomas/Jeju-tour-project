package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AdminPageModel {
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request,HttpServletResponse response) {
		
		
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/member_list.do")
	public String member_list(HttpServletRequest request,HttpServletResponse response) {
		MemberDAO dao=MemberDAO.newInstance();
		List<MemberVO> list=dao.memberList();
		
		request.setAttribute("list", list);
		request.setAttribute("adminpage_jsp", "../adminpage/member_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/reserve_activity.do")
	public String reserve_activity(HttpServletRequest request,HttpServletResponse response) {
		
		AdminpageDAO dao= AdminpageDAO.newInstance();
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		List<ReservationVO> list=dao.activityListData(curpage);
		
		request.setAttribute("list", list);
		
		request.setAttribute("adminpage_jsp", "../adminpage/reserve_activity.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/reserve_hotel.do")
	public String reserve_hotel(HttpServletRequest request,HttpServletResponse response) {
		
		AdminpageDAO dao= AdminpageDAO.newInstance();
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		List<ReservationVO> list=dao.hotelListData(curpage);
		
		request.setAttribute("list", list);
		
		request.setAttribute("adminpage_jsp", "../adminpage/reserve_hotel.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/reserve_rentcar.do")
	public String reserve_rentcar(HttpServletRequest request,HttpServletResponse response) {
		AdminpageDAO dao= AdminpageDAO.newInstance();
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		List<ReservationVO> list=dao.rentcarListData(curpage);
		
		request.setAttribute("list", list);
		
		request.setAttribute("adminpage_jsp", "../adminpage/reserve_rentcar.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/admin_reserve_ok.do")
	public String admin_reserve_ok(HttpServletRequest request,HttpServletResponse response) {
		
		String jrno=request.getParameter("jrno");
		int ijrno=Integer.parseInt(jrno);
		String url="";
		AdminpageDAO dao=AdminpageDAO.newInstance();
		dao.reserveOk(ijrno);
		int rcno=dao.getRcno(ijrno);
		if(rcno==1) {
			url="redirect:../adminpage/reserve_activity.do";
		}else if(rcno==2) {
			url="redirect:../adminpage/reserve_hotel.do";
		}else if(rcno==3) {
			url="redirect:../adminpage/reserve_rentcar.do";
		}
		
		return url;
	}
	
	
	@RequestMapping("adminpage/adminqna_list.do")
	public String adminqna_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		
		int curpage=Integer.parseInt(page);
		
		QnA_DAO dao=QnA_DAO.newInstance();
		List<QnA_VO> list=dao.qnaAdminListData(curpage);
		int totalpage=dao.qnaBoardAdminTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage",totalpage);
		request.setAttribute("adminpage_jsp", "../adminpage/adminqna_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/adminqna_insert.do")
	public String adminqna_insert(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		
		request.setAttribute("no", no);
		request.setAttribute("adminpage_jsp", "../adminpage/adminqna_insert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/adminqna_insert_ok.do")
	public String adminqna_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {}
		
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String qno=request.getParameter("qno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		QnA_VO vo=new QnA_VO();
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setId(id);
		vo.setType(type);
		
		QnA_DAO dao=QnA_DAO.newInstance();
		dao.qnaBoardAdminInsert(Integer.parseInt(qno), vo);
		return "redirect:../adminpage/adminqna_list.do";
	}
	
	@RequestMapping("adminpage/adminqna_detail.do")
	public String adminqna_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		
		QnA_DAO dao=QnA_DAO.newInstance();
		QnA_VO vo=dao.qnaBoardAdminDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		return "../adminpage/adminqna_detail.jsp";
	}
}
