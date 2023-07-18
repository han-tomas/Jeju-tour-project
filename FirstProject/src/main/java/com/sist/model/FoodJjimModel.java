package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodJjimDAO;
import com.sist.vo.FoodJjimVO;

public class FoodJjimModel {
	@RequestMapping("foodjjim/food_jjim_insert.do")
	public String food_jjim_insert(HttpServletRequest request,HttpServletResponse response) {
		String fino=request.getParameter("fino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		FoodJjimDAO dao=FoodJjimDAO.newInstance();
		FoodJjimVO vo=new FoodJjimVO();
		vo.setFino(Integer.parseInt(fino));
		vo.setId(id);
		
		dao.foodJjimInsert(vo);
		
		return "redirect:../food/food_detail.do?fino="+fino;
	}
	
	@RequestMapping("foodjjim/food_jjim_cancle.do")
	public String food_jjim_cancle(HttpServletRequest request,HttpServletResponse response) {
		String fino=request.getParameter("fino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		FoodJjimDAO dao=FoodJjimDAO.newInstance();
		dao.foodJjimCancle(Integer.parseInt(fino), id);
		
		return "redirect:../food/food_detail.do?fino="+fino;
	}
	
}
