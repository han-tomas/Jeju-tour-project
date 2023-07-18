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
		Cookie[] cookies=request.getCookies();
		List<ActivityVO> cList=new ArrayList<ActivityVO>();
		List<TravelVO> tList=new ArrayList<>();
		List<HotelVO> hList=new ArrayList<>();
		
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
			}
		}
		
		request.setAttribute("hList", hList);
		request.setAttribute("cList", cList);
		request.setAttribute("tList", tList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
