package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		return "../main/main.jsp";
	}
	
}
