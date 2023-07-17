package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
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
}
