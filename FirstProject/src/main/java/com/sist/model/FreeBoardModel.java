package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class FreeBoardModel {
	@RequestMapping("freeboard/list.do")
	public String freeboard_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		// DAO 연동
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		List<FreeboardVO> list = dao.freeboardListData(curpage);
		int rowtotal = dao.freeboardTotalRow();
		int totalpage =(int)Math.ceil(rowtotal/10.0);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("rowtotal", rowtotal);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
		request.setAttribute("main_jsp", "../freeboard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/insert.do")
	public String freeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../freeboard/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		FreeboardVO vo = new FreeboardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		dao.freeboardInsert(vo);
		
		return "redirect:../freeboard/list.do";
	}
	@RequestMapping("freeboard/detail.do")
	public String freeboard_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String no = request.getParameter("no");
		//DAO연결
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		FreeboardVO vo = dao.freeboardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../freeboard/detail.jsp");
		
		
		// 댓글 읽기
		FreeBoardReplyDAO fdao=FreeBoardReplyDAO.newInstance();
		List<FreeBoardReplyVO> list = fdao.replyListData(Integer.parseInt(no));
		request.setAttribute("list", list);
		
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/update.do")
	public String freeboard_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no = request.getParameter("no");
		//DAO연결
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		FreeboardVO vo = dao.freeboardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../freeboard/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/update_ok.do")
	public void freeboard_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		FreeboardVO vo = new FreeboardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setNo(Integer.parseInt(request.getParameter("no")));
		
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		boolean bCheck = dao.freeboardUpdate(vo);
		try
		{
			PrintWriter out = response.getWriter();
			out.println(bCheck); // => Ajax에서 읽어서 처리
		}catch(Exception ex) {}
	}
	@RequestMapping("freeboard/delete.do")
	public void freeboard_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no = request.getParameter("no");
		String pwd= request.getParameter("pwd");
		
		FreeBoardDAO dao = FreeBoardDAO.newInstance();
		String res = dao.freeboardDelete(Integer.parseInt(no), pwd);
		
		try
		{
			PrintWriter out = response.getWriter();
			out.println(res); // => Ajax에서 읽어서 처리
		}catch(Exception ex) {}
	}
}
