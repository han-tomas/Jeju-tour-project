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
		
	
}
