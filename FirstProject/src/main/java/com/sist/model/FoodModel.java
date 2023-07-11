package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class FoodModel {
	
	
	@RequestMapping("food/food_list.do")
	public String food_list(HttpServletRequest request,HttpServletResponse response) {
		String mcno=request.getParameter("mcno");
		
		if(mcno==null)
			mcno="1";
		
		int curpage=(Integer.parseInt(mcno));
		
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodCategoryVO> clist=dao.foodCategoryListData();
		List<FoodVO> flist=dao.foodListData(Integer.parseInt(mcno));
		int totalpage=dao.foodTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		for(foodVO vo:flist) {
//			System.out.println(vo.getName());
//		}
		request.setAttribute("clist", clist);
		request.setAttribute("flist", flist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
//		request.setAttribute("mcno", Integer.parseInt(mcno));
		request.setAttribute("main_jsp", "../food/food_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/food_list2.do")
	public String food_list2(HttpServletRequest request,HttpServletResponse response) {
		String mcno=request.getParameter("mcno");
		
		if(mcno==null)
			mcno="1";
		
		int curpage=(Integer.parseInt(mcno));
		
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodCategoryVO> clist=dao.foodCategoryListData();
		List<FoodVO> flist=dao.foodListData(Integer.parseInt(mcno));
		int totalpage=dao.foodTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		for(foodVO vo:flist) {
//			System.out.println(vo.getName());
//		}
		request.setAttribute("clist", clist);
		request.setAttribute("flist", flist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
//		request.setAttribute("mcno", Integer.parseInt(mcno));
		request.setAttribute("main_jsp", "../food/food_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/food_detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		// 쿠키생성
		String fino=request.getParameter("fino");
		Cookie cookie=new Cookie("food_"+fino, fino);
		
		// 쿠키 저장 위치 
		cookie.setPath("/");
		// 쿠키 저장 기간 설정
		cookie.setMaxAge(60*60*24); //24시간
		response.addCookie(cookie);
		return "redirect:../food/food_detail.do?fino="+fino;
	}
	
	@RequestMapping("food/food_detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		String fino=request.getParameter("fino");
		
		//dao연결
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodDetailData(Integer.parseInt(fino));
		
		//제주특별자치도 제주시 한경면 두조로 190-20 지번 제주 제주시 한경면 두모리 288
		String addr=vo.getAddress();
		String addr1=addr.substring(0,addr.indexOf("지번"));
		String addr2=addr.substring(addr.indexOf("지번")+3);
		
		String[] posters = vo.getPoster().split("\\^");
		int posterLength = posters.length;
		
		// 사진 1개일 경우
//		String poster=vo.getPoster();
//		poster=poster.substring(0,poster.indexOf("^"));
		
		
		// 저장
		request.setAttribute("vo", vo);
		request.setAttribute("addr1", addr1.trim());
		request.setAttribute("addr2", addr2.trim());
		request.setAttribute("posters", posters);
		request.setAttribute("posterLength", posterLength);
		
		request.setAttribute("main_jsp", "../food/food_detail.jsp");
		return "../main/main.jsp";
	}
}
