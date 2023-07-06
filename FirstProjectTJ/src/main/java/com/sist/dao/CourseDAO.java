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
}
