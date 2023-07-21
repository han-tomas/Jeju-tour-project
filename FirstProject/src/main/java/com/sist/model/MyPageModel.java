package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

import java.io.PrintWriter;
import java.util.*;

public class MyPageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//DAO
		MypageDAO dao = MypageDAO.newInstance();
		MemberVO vo = dao.mypageUpdateData(id);
		String phone1= vo.getPhone().substring(0,3);
		String phone2= vo.getPhone().substring(3,7);
		String phone3= vo.getPhone().substring(7,11);
		request.setAttribute("vo", vo);
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		request.setAttribute("mypage_jsp", "../mypage/mypage_detail.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_jjim_list.do")
	public String jjim_list(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		CourseJJimRecommendDAO dao = CourseJJimRecommendDAO.newInstance();
		List<CourseJJimVO> list  = dao.courseJJimListData(id);
		
		FoodJjimDAO fdao=FoodJjimDAO.newInstance();
		List<FoodJjimVO> flist=fdao.foodjjimListData(id);
		
		ActivityWishDAO adao = ActivityWishDAO.newInstance();
		List<WishReserveVO> alist = adao.activityWishListData(id);
		
		HotelWishDAO hdao = HotelWishDAO.newInstance();
		List<WishReserveVO> hlist = hdao.hotelWishListData(id);
		
		RentcarWishDAO rdao = RentcarWishDAO.newInstance();
		List<WishReserveVO> rlist = rdao.rentcarWishListData(id);		
		
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("alist", alist);
		request.setAttribute("hlist", hlist);
		request.setAttribute("rlist", rlist);
		request.setAttribute("mypage_jsp", "../mypage/mypage_jjim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("mypage/mypage_activity_reserve.do")
	public String mypage_activity_reserve(HttpServletRequest request, HttpServletResponse response) {
		String acino=request.getParameter("acino");
		String strInwon=request.getParameter("inwon");
		String strPrice=request.getParameter("price");
		String strTprice=request.getParameter("tprice");
		String dbday=request.getParameter("dbday");
		int inwon=Integer.parseInt(strInwon);
		int price=Integer.parseInt(strPrice);
		int tprice=Integer.parseInt(strTprice);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		MemberDAO mdao=MemberDAO.newInstance();
		MemberVO mvo=mdao.memberSearch(id);
		ActivityDAO adao=ActivityDAO.newInstance();
		ActivityVO avo=adao.activityDetailData(Integer.parseInt(acino));
		ReservationVO arvo=new ReservationVO();
		
		arvo.setDbday(dbday);
		arvo.setAcino(avo.getAcino());
		arvo.setId(id);
		arvo.setRname(name);
		arvo.setRemail(mvo.getEmail());
		arvo.setRphone(mvo.getPhone());
		arvo.setInwon(inwon);
		arvo.setPrice(price);
		arvo.setTprice(tprice);
		arvo.setPoster(avo.getMain_poster());
		arvo.setTitle(avo.getTitle());
		
		adao.activityReserveOk(arvo);
		
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	@RequestMapping("mypage/mypage_rentcar_reserve.do")
	public String mypage_rentcar_reserve(HttpServletRequest request, HttpServletResponse response) {
		String cid=request.getParameter("cid");
		String dbday=request.getParameter("dbday");
		//String strPrice=request.getParameter("price");
		String strTprice=request.getParameter("tprice");
		//int price=Integer.parseInt(strPrice);
		int tprice=Integer.parseInt(strTprice);
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		MemberDAO mdao=MemberDAO.newInstance();
		MemberVO mvo=mdao.memberSearch(id);
		
		RentcarDAO rdao=RentcarDAO.newInstance();
		RentcarVO rvo=rdao.RentcarDetailData(Integer.parseInt(cid));
		
		ReservationVO vo=new ReservationVO();
		
		vo.setDbday(dbday);
		vo.setCid(rvo.getCid());
		vo.setId(id);
		vo.setRname(name);
		vo.setRemail(mvo.getEmail());
		vo.setRphone(mvo.getPhone());
		//vo.setPrice(price);
		vo.setTprice(tprice);
		vo.setPoster(rvo.getImg());
		vo.setTitle(rvo.getCar_name());
		vo.setCheckin(startDate);
		vo.setCheckout(endDate);
		
		rdao.RentcarReserveOk(vo);
		
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	@RequestMapping("mypage/mypage_reserve.do")
	public String mypage_reserve(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		MypageDAO mydao=MypageDAO.newInstance();
		int curpage=Integer.parseInt(page);
		int count=mydao.reservationRowCount(id);
		int totalpage=(int)(Math.ceil(count/5.0));
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		
		List<ReservationVO> list=mydao.reservationListData(id,curpage);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_cart.do")
	public String mypage_cart(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("mypage_jsp", "../mypage/mypage_cart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_pwdcheck.do")
	public String mypage_pwdcheck(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/mypage_pwdcheck.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_pwdcheck_ok.do")
	public void mypage_pwdcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		String id =(String)session.getAttribute("id");
		
		MypageDAO dao = MypageDAO.newInstance();
		String res = dao.mypagePwdOK(id, pwd);
		
		try
		{
			PrintWriter out = response.getWriter();
			out.println(res);
		}catch(Exception ex) {}
	}
	@RequestMapping("mypage/mypage_update.do")
	public String mypage_update(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//DAO
		MypageDAO dao = MypageDAO.newInstance();
		MemberVO vo = dao.mypageUpdateData(id);
		String phone1= vo.getPhone().substring(0,3);
		String phone2= vo.getPhone().substring(3,7);
		String phone3= vo.getPhone().substring(7,11);
		request.setAttribute("vo", vo);
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		request.setAttribute("mypage_jsp", "../mypage/mypage_update.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_update_ok.do")
	public String mypage_update_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String birth = request.getParameter("birthday");
		String email = request.getParameter("email");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String content = request.getParameter("content");
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setSex(sex);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone1+phone2+phone3);
		vo.setContent(content);
		
		MypageDAO dao = MypageDAO.newInstance();
		dao.mypageUpdate(vo);
		
		return "redirect: ../mypage/mypage_detail.do";
	}
	@RequestMapping("mypage/mypage_detail.do")
	public String mypage_detail(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//DAO
		MypageDAO dao = MypageDAO.newInstance();
		MemberVO vo = dao.mypageUpdateData(id);
		String phone1= vo.getPhone().substring(0,3);
		String phone2= vo.getPhone().substring(3,7);
		String phone3= vo.getPhone().substring(7,11);
		request.setAttribute("vo", vo);
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		request.setAttribute("mypage_jsp", "../mypage/mypage_detail.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_delete.do")
	public String mypage_delete(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("mypage_jsp", "../mypage/mypage_delete.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_delete_ok.do")
	public void memberDeleteOk(HttpServletRequest request,HttpServletResponse response)
	{
		String pwd=request.getParameter("pwd");
		HttpSession session= request.getSession();
		String id = (String)session.getAttribute("id");
		// DAO 연동
		MypageDAO dao = MypageDAO.newInstance();
		String result=dao.mypageDeleteOk(id, pwd);
		if(result.equals("YES"))
		{
			session.invalidate(); // 세션을 해제해야 다시 로그인으로 넘어감
		}
		try
		{
			PrintWriter out = response.getWriter();
			out.println(result);
		}catch(Exception ex) {}
	}
	
	@RequestMapping("mypage/mypage_reserve_delete.do")
	public String mypage_reserve_delete(HttpServletRequest request,HttpServletResponse response) {
		
		String jrno=request.getParameter("jrno");
		MypageDAO dao=MypageDAO.newInstance();
		dao.reserveDelete(Integer.parseInt(jrno));
		
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	
}
