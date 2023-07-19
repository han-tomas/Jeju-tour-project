package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.*;
public class QnA_Model {
	@RequestMapping("qnaboard/qna_list.do")
	public String qna_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		QnA_DAO dao=QnA_DAO.newInstance();
		List<QnA_VO> list=dao.qnaBoardListData(curpage);
		int totalpage=dao.qnaBoardTotalPage();
		int count=dao.qnaBoardCount();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../qnaboard/qna_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("qnaboard/qna_insert.do")
	public String qna_insert(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../qnaboard/qna_insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("qnaboard/qna_insert_ok.do")
	public String qna_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		}catch(Exception e) {}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String type=request.getParameter("type");
		
		QnA_VO vo=new QnA_VO();
		vo.setId(id);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setType(type);
		
		QnA_DAO dao=QnA_DAO.newInstance();
		dao.qnaBoardInsert(vo);
		
		return "redirect:../qnaboard/qna_list.do";
	}
	
	@RequestMapping("qnaboard/qna_delete.do")
	public void qna_delete(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		QnA_DAO dao=QnA_DAO.newInstance();
		dao.qnaBoardDelete(Integer.parseInt(no),id);
	}
	
	@RequestMapping("qnaboard/qna_detail.do")
	public String qna_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		QnA_DAO dao=QnA_DAO.newInstance();
		QnA_VO vo=dao.qnaBoardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../qnaboard/qna_detail.jsp");
		return "../main/main.jsp";
	}
}
