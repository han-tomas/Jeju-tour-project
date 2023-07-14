package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class TravelDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static TravelDAO dao;
	public static TravelDAO newInstance()
	{
		if(dao == null)
			dao=new TravelDAO();
		return dao;
	}
	// 검색 목록 출력
	// no,poster,title,tag,loc,lno
	public List<TravelVO> travelFindData(String fd,int page)
	{
		List<TravelVO> list=new ArrayList<TravelVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,poster,title,tag,loc,lno,num "
					+ "FROM (SELECT no,poster,title,tag,loc,lno,rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(travel_detail td_no_pk)*/no,poster,title,tag,loc,lno "
					+ "FROM travel_detail WHERE title LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, fd);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TravelVO vo = new TravelVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				String tag= rs.getString(4);
				if(tag.length()>50)
				{
					tag=tag.substring(0,50)+"...";
				}
				vo.setTag(tag);
				vo.setLoc(rs.getString(5));
				vo.setLno(rs.getInt(6));
				String label="";
				if(rs.getInt(6)==1)
				{
					label="관광지";
				}
				else if(rs.getInt(6)==2)
				{
					label="음식점";
				}
				else if(rs.getInt(6)==3)
				{
					label="숙박";
				}
				else
				{
					label="행사/축제";
				}
				vo.setLabel(label);
				list.add(vo);
				
			}
			rs.close();
		}catch(Exception ex)
		{
			
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	public List<TravelVO> travelCategoryFindData(String fd,int page,int lno)
	{
		List<TravelVO> list=new ArrayList<TravelVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,poster,title,tag,loc,lno,num "
					+ "FROM (SELECT no,poster,title,tag,loc,lno,rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(travel_detail td_no_pk)*/no,poster,title,tag,loc,lno "
					+ "FROM travel_detail WHERE title LIKE '%'||?||'%' AND lno=?)) "
					+ "WHERE num BETWEEN ? AND ? ";
					
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, fd);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ps.setInt(2, lno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TravelVO vo = new TravelVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				String tag= rs.getString(4);
				if(tag.length()>50)
				{
					tag=tag.substring(0,50)+"...";
				}
				vo.setTag(tag);
				vo.setLoc(rs.getString(5));
				vo.setLno(rs.getInt(6));
				String label="";
				if(rs.getInt(6)==1)
				{
					label="관광지";
				}
				else if(rs.getInt(6)==2)
				{
					label="음식점";
				}
				else if(rs.getInt(6)==3)
				{
					label="숙박";
				}
				else
				{
					label="행사/축제";
				}
				vo.setLabel(label);
				list.add(vo);
				
			}
			rs.close();
		}catch(Exception ex)
		{
			
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return list;
	}
	// 검색 총페이지
	public int travelFindTotalPage(String fd)
	{
		int total=0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM travel_detail "
					+ "WHERE title LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, fd);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	public int travelCategoryFindTotalPage(String fd,int lno)
	{
		int total=0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM travel_detail "
					+ "WHERE title LIKE '%'||?||'%' "
					+ "AND lno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, fd);
			ps.setInt(2, lno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	// 여행지 상세보기
	/*
	 NO          	   NOT NULL NUMBER
	 TITLE             NOT NULL VARCHAR2(100)
	 TAG               NOT NULL VARCHAR2(1000)
	 INTRODUCTION      NOT NULL VARCHAR2(1000)
	 LOC                        VARCHAR2(100)
	 ADDR              NOT NULL VARCHAR2(200)
	 ROAD              NOT NULL VARCHAR2(200)
	 TEL               NOT NULL VARCHAR2(60)
	 POSTER            NOT NULL VARCHAR2(500)
	 INFO              NOT NULL CLOB
	 LNO               NOT NULL NUMBER
	 TCNO              NOT NULL NUMBER
	 */
	public TravelVO travelDetailData(int no)
	{
		TravelVO vo = new TravelVO();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,title,tag,introduction,loc,addr,road,tel,"
					+ "poster,info,lno "
					+ "FROM travel_detail "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setTag(rs.getString(3));
			vo.setIntroduction(rs.getString(4));
			vo.setLoc(rs.getString(5));
			vo.setAddr(rs.getString(6));
			vo.setRoad(rs.getString(7));
			vo.setTel(rs.getString(8));
			vo.setPoster(rs.getString(9));
			vo.setInfo(rs.getString(10));
			vo.setLno(rs.getInt(11));
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
	// 해당 검색어
	public List<TravelVO> coursenameRelated(String coursename)
	{
		List<TravelVO> list = new ArrayList<TravelVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no, poster,title,lno FROM travel_detail "
					+ "WHERE title LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, coursename);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TravelVO vo  = new TravelVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				int lno =rs.getInt(4);
				String label="";
				if(lno==1)
				{
					label="관광지";
				}
				else if(lno==2)
				{
					label="음식점";
				}
				else if(lno==3)
				{
					label="숙박";
				}
				else
				{
					label="행사/축제";
				}
				vo.setLabel(label);
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

