package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class FoodLikeModel {
	@RequestMapping("foodLike/food_like_insert.do")
	public String food_like_insert(HttpServletRequest request,HttpServletResponse response) {
		String fino=request.getParameter("fino");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		FoodLikeVO vo=new FoodLikeVO();
		vo.setId(id);
		vo.setFino(Integer.parseInt(fino));
		
		FoodLikeDAO dao=FoodLikeDAO.newInstance();
		dao.foodLikeInsert(vo);
		
		return "redirect:../food/food_detail.do?fino="+fino;
	}
}
