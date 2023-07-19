package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.FreeBoardReplyDAO;
import com.sist.vo.FreeBoardReplyVO;

public class FreeBoardReplyModel {
	@RequestMapping("freeboard/reply_insert.do")
	public String reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno = request.getParameter("bno");
		String content = request.getParameter("content");
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		FreeBoardReplyVO vo = new FreeBoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setContent(content);
		vo.setId(id);
		vo.setName(name);
		//DAO로 전송
		FreeBoardReplyDAO dao = FreeBoardReplyDAO.newInstance();
		dao.replyInsert(vo);
		
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	@RequestMapping("freeboard/reply_update.do")
	public String reply_update(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		// 디코딩 (한글 변환)
		String bno = request.getParameter("bno"); // 게시물번호 (이동 목적)
		String no = request.getParameter("no"); // 댓글 번호
		String content = request.getParameter("content");
		//DAO연결 => 오라클 변경
		FreeBoardReplyDAO dao = FreeBoardReplyDAO.newInstance();
		dao.replyUpdate(Integer.parseInt(no), content);
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	@RequestMapping("freeboard/reply_reply_insert.do")
	public String reply_reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String bno = request.getParameter("bno");
		String pno = request.getParameter("pno");
		String content = request.getParameter("content");
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		FreeBoardReplyVO vo = new FreeBoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setContent(content);
		vo.setId(id);
		vo.setName(name);
		
		FreeBoardReplyDAO dao = FreeBoardReplyDAO.newInstance();
		dao.replyReplyInsert(Integer.parseInt(pno), vo);
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	@RequestMapping("freeboard/reply_delete.do")
	public String reply_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String bno=request.getParameter("bno");
		// DAO에 삭제 요청
		FreeBoardReplyDAO dao = FreeBoardReplyDAO.newInstance();
		dao.replyDelete(Integer.parseInt(no));
		return "redirect:../freeboard/detail.do?no="+bno;
	}
}
