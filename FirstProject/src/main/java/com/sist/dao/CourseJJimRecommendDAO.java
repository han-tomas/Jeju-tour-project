package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;

public class CourseJJimRecommendDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static CourseJJimRecommendDAO dao;
	
	public static CourseJJimRecommendDAO newInstance()
	{
		if(dao==null)
			dao = new CourseJJimRecommendDAO();
		return dao;
	}
	// JJim 저장
	public void courseJJimInsert(CourseJJimVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql = "INSERT INTO course_jjim VALUES("
					+ "cj_no_seq.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getCno());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	// JJim 확인
	public int courseJJimCount(String id, int cno)
	{
		int count = 0;
		try
		{
			conn=db.getConnection();
			String sql = "SELECT COUNT(*) "
					+ "FROM course_jjim "
					+ "WHERE cno=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	// JJim 목록
	public List<CourseJJimVO> courseJJimListData(String id)
	{
		List<CourseJJimVO> list = new ArrayList<CourseJJimVO>();
		try
		{
			conn = db.getConnection();
			String sql ="SELECT no,cno,courseGetPoster(cno),"
					+ "courseGetTitle(cno),courseGetJJim(cno),courseGetRecommend(cno) "
					+ "FROM course_jjim "
					+ "WHERE id=? "
					+ "ORDER BY no DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				CourseJJimVO vo = new CourseJJimVO();
				vo.setNo(rs.getInt(1));
				vo.setCno(rs.getInt(2));
				vo.setPoster(rs.getString(3));
				vo.setTitle(rs.getString(4));
				vo.setJjim(rs.getInt(5));
				vo.setRecommend(rs.getInt(6));
				list.add(vo);  // 찜목록에는 포스터,제목만 출력
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	// JJim 취소
	public void courseJJimCancel(int cno)
	{
		try
		{
			conn=db.getConnection();
			String sql="DELETE FROM course_jjim "
					+ "WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	// Recommend 저장
	public void courseRecommendInsert(CourseRecommendVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO course_recommend VALUES("
					+ "cr_no_seq.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getCno());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	// Recommend 확인
	public int courseRecommendCount(int cno)
	{
		int count=0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM course_recommend "
					+ "WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	// Recommend 확인
	public int courseRecommendOk(int cno,String id)
	{
		int count=0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM course_recommend "
					+ "WHERE cno=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	// 추천 취소
	public void courseRecommendCancel(int cno)
	{
		try
		{
			conn=db.getConnection();
			String sql="DELETE FROM course_recommend "
					+ "WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
}
