package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class CourseModel {
	@RequestMapping("travel/course_list.do")
	public String courseCategory(HttpServletRequest request, HttpServletResponse response)
	{
		CourseDAO dao=CourseDAO.newInstance();
		List<CourseCategoryVO> list = dao.courseCategoryListData();
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../travel/course_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("travel/course_detail.do")
	public String course_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		CourseDAO dao=CourseDAO.newInstance();
		List<CourseDetailVO> list = dao.courseDetailData(Integer.parseInt(cno));
		List<Integer> dlist = dao.daytype(Integer.parseInt(cno));
		CourseCategoryVO cvo =dao.courseImage(Integer.parseInt(cno));
		int[] aa= new int[4];
		for(int i=0; i<dlist.size();i++)
		{
			aa[i]=dlist.get(i);	
		}
		request.setAttribute("cvo", cvo);
		request.setAttribute("aa", aa);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../travel/course_detail.jsp");
		request.setAttribute("size", list.size());
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null)
		{
			CourseJJimRecommendDAO jdao = CourseJJimRecommendDAO.newInstance();
			int jjim_count=jdao.courseJJimCount(id, Integer.parseInt(cno));
			request.setAttribute("jjim_count", jjim_count);
			int recommend_count=jdao.courseRecommendOk(Integer.parseInt(cno), id);
			int recommend_total=jdao.courseRecommendCount(Integer.parseInt(cno));
			request.setAttribute("recommend_count", recommend_count);
			request.setAttribute("recommend_total", recommend_total);
		}
		
		return "../main/main.jsp";
	}
	@RequestMapping("travel/coursename_related.do")
	public String coursename_related(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String coursename = request.getParameter("coursename");
		
		TravelDAO dao = TravelDAO.newInstance();
		List<TravelVO> list = dao.coursenameRelated(coursename);
		request.setAttribute("list", list);
		return "../travel/coursname_related.jsp";
	}
	@RequestMapping("travel/course_info.do")
	public String jjim_info(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		CourseDAO dao=CourseDAO.newInstance();
		List<CourseDetailVO> list = dao.courseDetailData(Integer.parseInt(cno));
		List<Integer> dlist = dao.daytype(Integer.parseInt(cno));
		CourseCategoryVO cvo =dao.courseImage(Integer.parseInt(cno));
		int[] aa= new int[4];
		for(int i=0; i<dlist.size();i++)
		{
			aa[i]=dlist.get(i);	
		}
		request.setAttribute("cvo", cvo);
		request.setAttribute("aa", aa);
		request.setAttribute("list", list);
		request.setAttribute("size", list.size());
		
		return "../travel/course_info.jsp";
	}
}
