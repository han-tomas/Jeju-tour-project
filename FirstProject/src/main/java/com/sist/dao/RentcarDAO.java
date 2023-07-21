package com.sist.dao;
import java.util.*;
import com.sist.common.*;
import java.sql.*;

import com.sist.vo.RentcarVO;
import com.sist.vo.ReservationVO;
import com.sist.vo.RentcarVO;
public class RentcarDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@211.238.142.122:1521:xe";
	private CreateDataBase db=new CreateDataBase();
	private static RentcarDAO dao;
	private String[] sizetab = {"'%'","'%SUV%'","'%수입%'","'%소형%'","'%중형%'","'%오픈%'"};
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
	
	/*public int RentcarTotalPage()
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
	  }*/
	
	public int RentcarSortTotalPage(int type)
	  {
		  int total=0;
		  try
		  {
			  conn=db.getConnection();
			  String sql="SELECT CEIL(COUNT(*)/12.0) FROM rent_info where car_size like "+sizetab[type];
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

	public List<RentcarVO> RentcarSort(int page, int type)
	  {
		  List<RentcarVO> sList=new ArrayList<RentcarVO>();
		  try
		  {
			  conn=db.getConnection();
			  String sql="SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,rownum as num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2 "
						+ "FROM rent_info WHERE car_size LIKE "+ sizetab[type]
						+ " ORDER BY cid ASC)) "
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
				  
				  
				  sList.add(vo);
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
		  return sList;
	  }
	
	public List<RentcarVO> RentcarRecommand(String rc)
	  {
		  List<RentcarVO> list=new ArrayList<RentcarVO>();
		  try
		  {
			  conn=db.getConnection();
			  String sql="SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2,rownum as num "
						+ "FROM (SELECT cid,img,car_name,car_size,seater,fuel_type,gear_type,brand,price,rcno,hit,like2 "
						+ "FROM rent_info WHERE car_size LIKE '?' "
						+ "ORDER BY cid ASC)) "
						+ "WHERE num BETWEEN 5 AND 10";
			  
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  RentcarVO vo=new RentcarVO();
				  vo.setCid(rs.getInt(1));
				  vo.setImg(rs.getString(2));
				  vo.setCar_name(rs.getString(3));
				  vo.setCar_size(rs.getString(4));
				  vo.setBrand(rs.getString(5));
				  vo.setPrice(rs.getInt(6));
				
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
	/*public void RentcarReserveOk(ReservationVO rrvo) 
	{
		try 
		{
			conn = db.getConnection();
			String sql = "INSERT INTO jeju_reserve ("
						+"jrno, checkin, checkout, dbday, rno, acino, cid, rcno, rname, remail, rphone, "
						+"inwon, price, tprice, poster, title, payment, rok, regdate) "
						+"VALUES("
						+"jr_jrno_seq.nextval,?,?,?,?,?,?,3,?,?,?,?,?,?,?,?,?,'n',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, rrvo.getCheckin());
			ps.setString(2, rrvo.getCheckout());
			ps.setString(3, rrvo.getDbday());
			ps.setInt(4, rrvo.getRno());
			ps.setInt(5, rrvo.getAcino());
			ps.setInt(6, rrvo.getCid());
			ps.setString(7, rrvo.getRname());
			ps.setString(8, rrvo.getRemail());
			ps.setString(9, rrvo.getRphone());
			ps.setInt(10, rrvo.getInwon());
			ps.setInt(11, rrvo.getPrice());
			ps.setInt(12, rrvo.getTprice());
			String rPoster="https://rentinjeju.com$"+rrvo.getPoster();
			ps.setString(13, rPoster);
			ps.setString(14, rrvo.getTitle());
			ps.setString(15, rrvo.getPayment());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}*/
	
	public void RentcarReserveOk(ReservationVO vo) 
	{
		try 
		{
			conn = db.getConnection();
			String sql = "INSERT INTO jeju_reserve ("
						+"jrno, checkin, checkout, dbday, cid, rcno, id, rname, remail, rphone, "
						+"tprice, poster, title, rok, regdate) "
						+"VALUES(jr_jrno_seq.nextval,?,?,?,?,3,?,?,?,?,?,?,?,'n',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCheckin());
			ps.setString(2, vo.getCheckout());
			ps.setString(3, vo.getDbday());
			ps.setInt(4, vo.getCid());
			ps.setString(5, vo.getId());
			ps.setString(6, vo.getRname());
			ps.setString(7, vo.getRemail());
			ps.setString(8, vo.getRphone());
			ps.setInt(9, vo.getTprice());
			String rPoster="https://rentinjeju.com"+vo.getPoster();
			ps.setString(10, rPoster);
			//System.out.println(rPoster);
			ps.setString(11, vo.getTitle());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	
	
		
}