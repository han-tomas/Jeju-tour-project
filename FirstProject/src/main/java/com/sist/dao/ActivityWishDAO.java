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
	
	public List<ActivityWishVO> activityWishListData(String id){
		List<ActivityWishVO> list=new ArrayList<ActivityWishVO>();
		try {
			conn=db.getConnection();
//			String sql="SELECT no,fno,"
//					+ "(SELECT poster FROM food_house WHERE fno=jjim.fno),"
//					+ "(SELECT name FROM food_house WHERE fno=jjim.fno),"
//					+ "(SELECT phone FROM food_house WHERE fno=jjim.fno) "
//					+ "FROM jjim "
//					+ "WHERE id=? "
//					+ "ORDER BY no DESC";
			String sql="SELECT no, acino, (SELECT title FROM activity_info WHERE acino=activity_info.acino),"
					+ "(SELECT main_poster FROM activity_info WHERE acino=activity_info.acino),"
					+ "(SELECT price FROM activity_info WHERE acino=activity_info.acino), "
					+ "(SELECT score FROM activity_info WHERE acino=activity_info.acino) "
					+ "FROM jjim "
					+ "WHERE id=? "
					+ "ORDER BY no DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				ActivityWishVO vo=new ActivityWishVO();
				vo.setNo(rs.getInt(1));
				vo.setAcino(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				String poster=rs.getString(4);
				poster=poster.replace("#", "&");
				vo.setMain_poster(poster);
				vo.setPrice(rs.getInt(5));
				vo.setScore(rs.getDouble(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		return list;
	}
	
	public void activityWishCancle(int acino, String id) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM activity_wish WHERE acino=? and id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, acino);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			db.disConnection(conn, ps);
		}
	}
}
