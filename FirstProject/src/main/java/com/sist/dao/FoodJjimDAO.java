package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;
public class FoodJjimDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static FoodJjimDAO dao;
	
	public static FoodJjimDAO newInstance() {
		if(dao==null)
			dao=new FoodJjimDAO();
		return dao;
	}
	
	// jjim하기
	public void foodJjimInsert(FoodJjimVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO jeju_food_jjim VALUES("
					+ "jfj_no_seq.nextval,?,?)";
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
	
	// jjim여부 확인
	public int foodJjimOk(int fino,String id) {
		int jjim_ok=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_food_jjim "
					+ "WHERE fino=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fino);
			ps.setString(2, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			jjim_ok=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return jjim_ok;
	}
	
	// jjim cancle
	public void foodJjimCancle(int fino,String id) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM jeju_food_jjim "
					+ "WHERE fino=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fino);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	
	// 찜한 맛집 목록 -> 마이페이지
	public List<FoodJjimVO> foodjjimListData(String id) {
		List<FoodJjimVO> list=new ArrayList<FoodJjimVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT no,fino,jejuFoodGetPoster(fino),jejuFoodGetName(fino),jejuFoodGetPhone(fino) "
					+ "FROM jeju_food_jjim "
					+ "WHERE id=? "
					+ "ORDER BY no DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodJjimVO vo=new FoodJjimVO();
				vo.setNo(rs.getInt(1));
				vo.setFino(rs.getInt(2));
				String poster=rs.getString(3);
				int caretIndex = poster.indexOf("^");
				if (caretIndex != -1) {
				    poster = poster.substring(0, caretIndex);
				}
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setName(rs.getString(4));
				vo.setPhone(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return list;
	}
}
