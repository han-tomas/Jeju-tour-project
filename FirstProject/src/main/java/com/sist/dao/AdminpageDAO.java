package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sist.common.CreateDataBase;
import com.sist.vo.ReservationVO;

public class AdminpageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static AdminpageDAO dao;
	
	public static AdminpageDAO newInstance() {
		if(dao==null)
			dao=new AdminpageDAO();
		return dao;
	}
	
	public List<ReservationVO> activityListData(int page){
		List<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT dbday,poster,title,regdate,tprice,rname,rok,jrno, num "
					+ "FROM (SELECT dbday,poster,title,regdate,tprice,rname, rok,jrno, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(jeju_reserve jr_jrno_pk)*/dbday, poster, title, regdate, tprice, rname, rok,jrno "
					+ "FROM jeju_reserve WHERE rcno=1)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReservationVO vo=new ReservationVO();
				vo.setDbday(rs.getString(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				Date date = rs.getDate(4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String realday = sdf.format(date);
				vo.setRealDate(realday);
				vo.setTprice(rs.getInt(5));
				vo.setRname(rs.getString(6));
				vo.setRok(rs.getString(7));
				vo.setJrno(rs.getInt(8));
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
	
	public List<ReservationVO> hotelListData(int page){
		List<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT dbday,poster,title,regdate,tprice,rname,rok,jrno, num "
					+ "FROM (SELECT dbday,poster,title,regdate,tprice,rname,rok,jrno, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(jeju_reserve jr_jrno_pk)*/dbday, poster, title, regdate, tprice, rname, rok,jrno "
					+ "FROM jeju_reserve WHERE rcno=2)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReservationVO vo=new ReservationVO();
				vo.setDbday(rs.getString(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				Date date = rs.getDate(4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String realday = sdf.format(date);
				vo.setRealDate(realday);
				vo.setTprice(rs.getInt(5));
				vo.setRname(rs.getString(6));
				vo.setRok(rs.getString(7));
				vo.setJrno(rs.getInt(8));
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
	
	public List<ReservationVO> rentcarListData(int page){
		List<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT dbday,poster,title,regdate,tprice,rname,rok,jrno, num "
					+ "FROM (SELECT dbday,poster,title,regdate,tprice,rname,rok,jrno, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(jeju_reserve jr_jrno_pk)*/dbday, poster, title, regdate, tprice, rname, rok,jrno "
					+ "FROM jeju_reserve WHERE rcno=3)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReservationVO vo=new ReservationVO();
				vo.setDbday(rs.getString(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				Date date = rs.getDate(4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String realday = sdf.format(date);
				vo.setRealDate(realday);
				vo.setTprice(rs.getInt(5));
				vo.setRname(rs.getString(6));
				vo.setRok(rs.getString(7));
				vo.setJrno(rs.getInt(8));
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
	
	public int activityReserveRowCount() {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_reserve WHERE rcno=1";
			ps=conn.prepareStatement(sql);
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
	
	public int hotelReserveRowCount() {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_reserve WHERE rcno=2";
			ps=conn.prepareStatement(sql);
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
	
	public int rentcarReserveRowCount() {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_reserve WHERE rcno=3";
			ps=conn.prepareStatement(sql);
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
	
	public void reserveOk(int jrno) {
		try {
			conn=db.getConnection();
			String sql="UPDATE jeju_reserve SET "
					+ "rok='y' "
					+ "WHERE jrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, jrno);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		
	}
	public int getRcno(int jrno) {
		int rcno=0;
		try {
			conn=db.getConnection();
			String sql="SELECT rcno FROM jeju_reserve WHERE jrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, jrno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			rcno=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		return rcno;
	}
	
}
