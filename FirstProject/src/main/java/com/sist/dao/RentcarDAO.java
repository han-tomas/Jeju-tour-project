package com.sist.dao;
import java.util.*;
import com.sist.common.*;
import java.sql.*;

import com.sist.vo.RentcarVO;
import com.sist.vo.RentcarVO;
public class RentcarDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@211.238.142.122:1521:xe";
	private CreateDataBase db=new CreateDataBase();
	private static RentcarDAO dao;
	
	public RentcarDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	public static RentcarDAO newInstance()
	{
		if(dao==null)
			dao=new RentcarDAO();
		return dao;
	}
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	public List<RentcarVO> RentcarListData(int page)
	  {
		  List<RentcarVO> list=new ArrayList<RentcarVO>();
		  try
		  {
			  conn=db.getConnection();
			  String sql="SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,rownum as num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2 "
						+ "FROM rent_info ORDER BY cid asc)) "
						+ "WHERE num BETWEEN ? AND ?";
			  ps=conn.prepareStatement(sql);
			  int rowSize=12;
			  int start=(rowSize*page)-(rowSize-1);
			  int end=rowSize*page;
			  
			  ps.setInt(1, start);
			  ps.setInt(2, end);
			  
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  RentcarVO vo=new RentcarVO();
				  vo.setCid(rs.getInt(1));
				  vo.setImg(rs.getString(2));
				  vo.setCar_name(rs.getString(3));
				  vo.setCar_size(rs.getString(4));
				  vo.setSeater(rs.getString(5));
				  vo.setFuel_type(rs.getString(6));
				  vo.setGear_type(rs.getString(7));
				  vo.setBrand(rs.getString(8));
				  vo.setPrice(rs.getInt(9));
				  vo.setRcno(rs.getInt(10));
				  vo.setHit(rs.getInt(11));
				  vo.setLike2(rs.getString(12));
				  
				  
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
	
	public int RentcarTotalPage()
	  {
		  int total=0;
		  try
		  {
			  conn=db.getConnection();
			  String sql="SELECT CEIL(COUNT(*)/12.0) FROM rent_info";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
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
	
	public RentcarVO RentcarDetailData(int cid)
	{
		
		RentcarVO vo=new RentcarVO();
		try
		{			
			conn=db.getConnection();
			String sql="UPDATE rent_info SET hit=hit+1 WHERE cid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.executeUpdate();
			
			sql="SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2 "
					+ "FROM rent_info "
					+ "WHERE cid=?";
			 
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			
			rs.next();
				vo.setCid(rs.getInt(1));
				vo.setImg(rs.getString(2));
				vo.setCar_name(rs.getString(3));
				vo.setCar_size(rs.getString(4));
				vo.setSeater(rs.getString(5));
				vo.setFuel_type(rs.getString(6));
				vo.setGear_type(rs.getString(7));
				vo.setBrand(rs.getString(8));
				vo.setPrice(rs.getInt(9));
				vo.setRcno(rs.getInt(10));
				vo.setHit(rs.getInt(11));
				vo.setLike2(rs.getString(12));
				rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn,ps);
		}
		return vo;
	}
}