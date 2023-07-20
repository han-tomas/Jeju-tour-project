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
	
	public static ActivityWishDAO newInstance() {
		if(dao==null)
			dao=new ActivityWishDAO();
		return dao;
	}
	
	public void activityWishInsert(WishReserveVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO wish_reserve ("
					+ "no, id, acino, rcno) VALUES ("
					+ "wr_no_seq.nextval,?,?,1)";
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
					+ "FROM wish_reserve "
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
	
	public void activityWishCancle(int acino, String id) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM wish_reserve WHERE acino=? and id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, acino);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	// mypage 찜목록출력
	public List<WishReserveVO> activityWishListData(String id){
		List<WishReserveVO> list = new ArrayList<WishReserveVO>();
		try {
			conn = db.getConnection();
			String sql = "SELECT no, acino, jejuActivityPoster(acino), "
						+"jejuActivityTitle(acino) "
						+"FROM wish_reserve "
						+"WHERE id=? "
						+ "AND rcno=1"
						+"ORDER BY no DESC";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				WishReserveVO vo = new WishReserveVO();
				vo.setNo(rs.getInt(1));
				vo.setAcino(rs.getInt(2));
				vo.setMain_poster(rs.getString(3));
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
