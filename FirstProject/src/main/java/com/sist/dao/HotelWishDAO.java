package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.sist.vo.*;
import com.sist.common.CreateDataBase;
public class HotelWishDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static HotelWishDAO dao;
	private CreateDataBase db = new CreateDataBase();
	
	public static HotelWishDAO newInstance() {
		if(dao==null)
			dao=new HotelWishDAO();
		return dao;
	}
	
	public void hotelWishInsert(WishReserveVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO wish_reserve ("
					+ "no, id, hdno, rcno) VALUES ("
					+ "wr_no_seq.nextval,?,?,2)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getHdno());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	
	
	public int hotelWishCount(String id, int hdno) {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT count(*) "
					+ "FROM wish_reserve "
					+ "WHERE hdno=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, hdno);
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
	
	public void hotelWishCancle(WishReserveVO vo) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM wish_reserve WHERE hdno=? and id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getHdno());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
}
