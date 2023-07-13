package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.RequestMapping;

public class CourseJJimRecommendModel {
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String cno = request.getParameter("cno");
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		CourseJJimVO vo = new CourseJJimVO();
		vo.setId(id);
		vo.setCno(Integer.parseInt(cno));
		CourseJJimRecommendDAO dao = CourseJJimRecommendDAO.newInstance();
		dao.courseJJimInsert(vo);
		// 화면 이동 (서버)
		// sendRedirect() => 재호출 => .do (request를 초기화)
		// forward() => 새로운 데이터를 전송 => .jsp(request에 값을 담아서 전송)
		// return "redirect:"
		return "redirect:../travel/course_detail.do?cno="+cno;
	}
	@RequestMapping("jjim/jjim_cancel.do")
	public String jjim_cancel(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		CourseJJimRecommendDAO dao = CourseJJimRecommendDAO.newInstance();
		dao.courseJJimCancel(Integer.parseInt(no));
		return "redirect:../mypage/mypage_jjim_list.do"; // 마이페이지 만들예정
	}
	@RequestMapping("recommend/recommend_insert.do")
	public String like_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		CourseRecommendVO vo = new CourseRecommendVO();
		vo.setCno(Integer.parseInt(cno));
		vo.setId(id);
		CourseJJimRecommendDAO dao = CourseJJimRecommendDAO.newInstance();
		dao.courseRecommendInsert(vo);
		return "redirect:../travel/course_detail.do?cno="+cno;
	}
}
