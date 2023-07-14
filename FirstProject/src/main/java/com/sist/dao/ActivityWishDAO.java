package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.common.*;
public class ActivityWishDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ActivityWishDAO dao;
	private CreateDataBase db = new CreateDataBase();
	
	public ActivityWishDAO newInstance() {
		if(dao==null)
			dao=new ActivityWishDAO();
		return dao;
	}
	public void activityWishInsert(ActivityWishVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO activity_wish VALUES("
					+ "aw_no_seq.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getAcino());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	public int activityWishCount(String id, int acino) {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT count(*) "
					+ "FROM activity_wish "
					+ "WHERE acino=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, acino);
			ps.setString(2, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		return count;
	}
	
}
