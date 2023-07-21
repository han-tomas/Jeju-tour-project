package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
		
		ActivityDAO dao=ActivityDAO.newInstance();
		TravelDAO tdao=TravelDAO.newInstance();
		HotelDAO hdao=HotelDAO.newInstance();
		FoodDAO fdao=FoodDAO.newInstance();
		RentcarDAO rdao=RentcarDAO.newInstance();
		String rentcarURL = "https://rentinjeju.com";
		
		Cookie[] cookies=request.getCookies();
		List<ActivityVO> cList=new ArrayList<ActivityVO>();
		List<TravelVO> tList=new ArrayList<>();
		List<HotelVO> hList=new ArrayList<>();
		List<FoodVO> fList=new ArrayList<FoodVO>();
		List<RentcarVO> rList=new ArrayList<RentcarVO>();
		
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("activity_")) {
					String cacino=cookies[i].getValue();
					ActivityVO cvo=dao.activityDetailData(Integer.parseInt(cacino));
					cList.add(cvo);
				}
				if(cookies[i].getName().startsWith("travel_")) {
					String ttno=cookies[i].getValue();
					TravelVO tvo=tdao.travelDetailData(Integer.parseInt(ttno));
					tList.add(tvo);
				}
				
				if(cookies[i].getName().startsWith("hotel_")) {
					String hhuno=cookies[i].getValue();
					HotelVO hvo=hdao.hotelDetailData(Integer.parseInt(hhuno));
					String aposter=hvo.getPoster().substring(0, hvo.getPoster().indexOf("^"));
					hvo.setPoster(aposter);
					hList.add(hvo);
				}
				if(cookies[i].getName().startsWith("food_")) {
					String fino=cookies[i].getValue();
					FoodVO fvo=fdao.foodDetailData(Integer.parseInt(fino));
					String addr=fvo.getAddress();
					String addr1=addr.substring(0,addr.indexOf("지번"));
					fList.add(fvo);
					request.setAttribute("addr1", addr1);
				}
				if(cookies[i].getName().startsWith("rentcar_")) {
					String cid=cookies[i].getValue();
					RentcarVO rvo=rdao.RentcarDetailData(Integer.parseInt(cid));
					String poster = rentcarURL+rvo.getImg();
					rvo.setImg(poster);
					rList.add(rvo);
					//System.out.println(rvo.getImg());
					
				}
			}
		}
		// 인기 검색어 Top 10
		TravelDAO ttopdao = TravelDAO.newInstance();
		List<TravelVO> ttoplist = ttopdao.findTop10();
		request.setAttribute("ttoplist", ttoplist);
		
		// 인기 맛집 list 10
		List<FoodVO> ffList=fdao.foodTopListData();
		request.setAttribute("ffList", ffList);
		
		// Activity 10
		List<ActivityVO> atList = dao.activityPopList();
		request.setAttribute("atList", atList);
		// 호텔 추천
		List<HotelVO> hhList = hdao.hotelTop10();
		request.setAttribute("hhList", hhList);
		
		// 렌트카 top 10
		List<RentcarVO> rtList = rdao.rentcarTop10();
		request.setAttribute("rtList", rtList);
		
		request.setAttribute("fList", fList);
		request.setAttribute("hList", hList);
		request.setAttribute("cList", cList);
		request.setAttribute("tList", tList);
		request.setAttribute("rList", rList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
}
