package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String adminpage_member_list(HttpServletRequest request,HttpServletResponse response) {
		MemberDAO dao=MemberDAO.newInstance();
		List<MemberVO> list=dao.memberList();
		
		request.setAttribute("list", list);
		request.setAttribute("adminpage_jsp", "../adminpage/member_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		return "../main/main.jsp";
	}
}
