package com.sist.model;
import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;

public class QnAModel {
	@RequestMapping("qna/qna_list.do")
	public String qna_list(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// DAO 연동
		QnADAO dao = QnADAO.newInstance();
		List<QnAVO> list = dao.qnaListData(curpage);
		// 총 게시물 갯수 
		int rowtotal= dao.qnaTotalCount();
		// 총페이지
		int totalpage= (int)Math.ceil(rowtotal/10.0);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;//1,11,21...
		// 1~10 => 1 , 11~20 => 11
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10,20,30 ... 
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("rowtotal", rowtotal);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../qna/qna_list.jsp");
		return "../main/main.jsp";
	}
	// 데이터 추가
		@RequestMapping("qna/qna_insert.do")
		public String qna_insert(HttpServletRequest request, HttpServletResponse response)
		{
			request.setAttribute("main_jsp", "../qna/qna_insert.jsp");
			
			return "../main/main.jsp";
		}
		@RequestMapping("qna/qna_insert_ok.do")
		public String qna_insert_ok(HttpServletRequest request, HttpServletResponse response)
		{
			try
			{
				request.setCharacterEncoding("UTF-8");
				
			}catch(Exception ex) {}
			QnAVO vo = new QnAVO();
			vo.setName(request.getParameter("name"));
			vo.setSubject(request.getParameter("subject"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			QnADAO dao = QnADAO.newInstance();
			dao.qnaBoardInsert(vo);
			return "redirect:../qna/qna_list.do";
		}
}
