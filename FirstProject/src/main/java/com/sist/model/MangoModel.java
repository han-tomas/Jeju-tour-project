package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class MangoModel {
	
	
	@RequestMapping("mango/mango_list.do")
	public String mango_list(HttpServletRequest request,HttpServletResponse response) {
		String mcno=request.getParameter("mcno");
		
		if(mcno==null)
			mcno="1";
		
		int curpage=(Integer.parseInt(mcno));
		
		MangoDAO dao=MangoDAO.newInstance();
		List<MangoCategoryVO> clist=dao.mangoCategoryListData();
		List<MangoVO> flist=dao.mangoListData(Integer.parseInt(mcno));
		int totalpage=dao.mangoTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		for(MangoVO vo:flist) {
//			System.out.println(vo.getName());
//		}
		request.setAttribute("clist", clist);
		request.setAttribute("flist", flist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
//		request.setAttribute("mcno", Integer.parseInt(mcno));
		request.setAttribute("main_jsp", "../mango/mango_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mango/mango_list2.do")
	public String mango_list2(HttpServletRequest request,HttpServletResponse response) {
		String mcno=request.getParameter("mcno");
		
		if(mcno==null)
			mcno="1";
		
		int curpage=(Integer.parseInt(mcno));
		
		MangoDAO dao=MangoDAO.newInstance();
		List<MangoCategoryVO> clist=dao.mangoCategoryListData();
		List<MangoVO> flist=dao.mangoListData(Integer.parseInt(mcno));
		int totalpage=dao.mangoTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
//		for(MangoVO vo:flist) {
//			System.out.println(vo.getName());
//		}
		request.setAttribute("clist", clist);
		request.setAttribute("flist", flist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
//		request.setAttribute("mcno", Integer.parseInt(mcno));
		request.setAttribute("main_jsp", "../mango/mango_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mango/mango_detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		// 쿠키생성
		String fino=request.getParameter("fino");
		Cookie cookie=new Cookie("mango_"+fino, fino);
		
		// 쿠키 저장 위치 
		cookie.setPath("/");
		// 쿠키 저장 기간 설정
		cookie.setMaxAge(60*60*24); //24시간
		response.addCookie(cookie);
		return "redirect:../mango/mango_detail.do?fino="+fino;
	}
	
	@RequestMapping("mango/mango_detail.do")
	public String mango_detail(HttpServletRequest request,HttpServletResponse response) {
		String fino=request.getParameter("fino");
		
		//dao연결
		MangoDAO dao=MangoDAO.newInstance();
		MangoVO vo=dao.mangoDetailData(Integer.parseInt(fino));
		
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
		
		request.setAttribute("main_jsp", "../mango/mango_detail.jsp");
		return "../main/main.jsp";
	}
}
