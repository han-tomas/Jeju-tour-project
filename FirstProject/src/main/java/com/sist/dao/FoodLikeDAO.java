package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.common.*;
import com.sist.vo.*;
public class FoodLikeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static FoodLikeDAO dao;
	public static FoodLikeDAO newInstance() {
		if(dao==null)
			dao=new FoodLikeDAO();
		return dao;
	}
	
	// like 하기
	public void foodLikeInsert(FoodLikeVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO jeju_food_like VALUES("
					+ "jfl_no_seq.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getFino());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	
	// like 여부 확인
	public int foodLikeOk(int fino,String id) {
		int like_ok=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_food_like "
					+ "WHERE fino=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fino);
			ps.setString(2, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			like_ok=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return like_ok;
	}
	
	// like취소
	public void foodLikeCancle(String id, int fino) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM jeju_food_like WHERE id=? AND fino=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, fino);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
}
