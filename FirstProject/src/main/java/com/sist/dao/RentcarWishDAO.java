package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.common.CreateDataBase;
import com.sist.vo.WishReserveVO;

public class RentcarWishDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static RentcarWishDAO dao;
	private CreateDataBase db = new CreateDataBase();
	private String rentcarURL = "https://rentinjeju.com";
	
	public static RentcarWishDAO newInstance() {
		if(dao==null)
			dao=new RentcarWishDAO();
		return dao;
	}
	
	public void rentcarWishInsert(WishReserveVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO wish_reserve ("
					+ "no, id, cid, rcno) VALUES ("
					+ "wr_no_seq.nextval,?,?,3)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getCid());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	public int rentcarWishCount(String id, int cid) {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT count(*) "
					+ "FROM wish_reserve "
					+ "WHERE cid=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
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
	
	public void rentcarWishCancel(WishReserveVO vo) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM wish_reserve WHERE cid=? and id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getCid());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	// mypage 찜목록출력
	public List<WishReserveVO> rentcarWishListData(String id){
		List<WishReserveVO> list = new ArrayList<WishReserveVO>();
		try {
			conn = db.getConnection();
			String sql = "SELECT no, cid, jejuRentcarPoster(cid), "
						+"jejuRentcarName(cid) "
						+"FROM wish_reserve "
						+"WHERE id=? "
						+ "AND rcno=3"
						+"ORDER BY no DESC";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				WishReserveVO vo = new WishReserveVO();
				vo.setNo(rs.getInt(1));
				vo.setCid(rs.getInt(2));
				vo.setMain_poster(rentcarURL+rs.getString(3));
				vo.setTitle(rs.getString(4));
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
