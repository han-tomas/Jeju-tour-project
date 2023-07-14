package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class CourseDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static CourseDAO dao;
	
	public static CourseDAO newInstance()
	{
		if(dao==null)
			dao= new CourseDAO();
		return dao;
	}
	
	/*
	 CNO                                       NOT NULL NUMBER
	 TITLE                                     NOT NULL VARCHAR2(100)
	 POSTER                                             VARCHAR2(1000)
	 RECOMMEND                                 NOT NULL NUMBER
	 JJIM                                      NOT NULL NUMBER
	 COPY                                      NOT NULL NUMBER
	 VIEWS                                     NOT NULL NUMBER
	 TCNO                                      NOT NULL NUMBER
	 */
	// 카테고리 목록 출력
	public List<CourseCategoryVO> courseCategoryListData()
	{
		List<CourseCategoryVO> list = new ArrayList<CourseCategoryVO>();
		try
		{
			conn=db.getConnection();
			String sql ="SELECT cno,title,poster,recommend,jjim,copy,views FROM course_category";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				CourseCategoryVO vo = new CourseCategoryVO();
				vo.setCno(rs.getInt(1));
				String title=rs.getString(2);
				if(title.length()>27)
				{
					title=title.substring(0,27)+"...";
					vo.setTitle(title);
				}
				vo.setTitle(title);
				vo.setPoster(rs.getString(3));
				vo.setRecommend(rs.getInt(4));
				vo.setJjim(rs.getInt(5));
				vo.setCopy(rs.getInt(6));
				vo.setViews(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	public List<Integer> daytype(int cno)
	{
		List<Integer> list = new ArrayList<Integer>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT DISTINCT daytype FROM course_detail WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				
				int daytype = rs.getInt(1);
				list.add(daytype);
			}
			rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	public List<CourseDetailVO> courseDetailData(int cno) {
		List<CourseDetailVO> list = new ArrayList<CourseDetailVO>();
		try
		{
			conn=db.getConnection();
			// 조회수 증가
			String sql= "UPDATE course_category SET "
					+ "views = views+1 "
					+ "WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.executeUpdate();
			
			sql ="SELECT no, daytype,coursename,cno FROM course_detail where cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				CourseDetailVO vo = new CourseDetailVO();
				vo.setNo(rs.getInt(1));
				vo.setDaytype(rs.getInt(2));
				String coursename=rs.getString(3);
				coursename=coursename.trim();
				vo.setCoursename(coursename);
				vo.setCno(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	public CourseCategoryVO courseImage(int cno)
	{
//		List<CourseCategoryVO> list = new ArrayList<CourseCategoryVO>();
		CourseCategoryVO vo = new CourseCategoryVO();
		try 
		{
			conn=db.getConnection();
			String sql="SELECT title,poster,cno FROM course_category WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setTitle(rs.getString(1));
			vo.setPoster(rs.getString(2));
			vo.setCno(rs.getInt(3));
//			while(rs.next())
//			{
//				CourseCategoryVO vo = new CourseCategoryVO();
//				vo.setTitle(rs.getString(1));
//				vo.setPoster(rs.getString(2));
//				list.add(vo);
//			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return vo;
	}
}
