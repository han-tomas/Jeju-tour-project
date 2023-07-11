package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;

public class MangoDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static MangoDAO dao;
	
	public static MangoDAO newInstance() {
		if(dao==null)
			dao=new MangoDAO();
		return dao;
	}
	
	// 1.카테고리 생성
	public List<MangoCategoryVO> mangoCategoryListData(){
		List<MangoCategoryVO> list=new ArrayList<MangoCategoryVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT title,mcno "
					+ "FROM mango_category";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MangoCategoryVO vo=new MangoCategoryVO();
				vo.setTitle(rs.getString(1));
				vo.setMcno(rs.getInt(2));
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
	
	// 실제 맛집 목록
	public List<MangoVO> mangoListData(int mcno){
		List<MangoVO> list=new ArrayList<MangoVO>();
		try {
			conn=db.getConnection();
			String sql = "SELECT fino, mcno, poster, name, score, address, hit, like_count, num "
				    + "FROM (SELECT fino, mcno, poster, name, score, address, hit, like_count, rownum as num "
				    + "FROM (SELECT /*+INDEX_ASC(food_info fi_fino_pk)*/fino, mcno, poster, name, score, address, hit, like_count  "
				    + "FROM food_info "
				    + "WHERE mcno = ?)) ";
//			// '=' 연산자를 사용하여 mcno와 일치하는 데이터 선택
//				    + "WHERE num BETWEEN ? AND ?";

	        ps = conn.prepareStatement(sql);
//	        int rowSize=20;
//	        int start=(rowSize*mcno)-(rowSize-1);
//	        int end=rowSize*mcno;
	        ps.setInt(1, mcno);
//	        ps.setInt(2, start);
//	        ps.setInt(3, end);
	        ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MangoVO vo=new MangoVO();
				vo.setFino(rs.getInt(1));
				vo.setMcno(rs.getInt(2));
				String poster=rs.getString(3);
				int caretIndex = poster.indexOf("^");
				if (caretIndex != -1) {
				    poster = poster.substring(0, caretIndex);
				}
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setName(rs.getString(4));
				vo.setScore(rs.getDouble(5));
				String addr=rs.getString(6);
				addr=addr.substring(0,addr.indexOf("지번"));
				addr=addr.substring(8);
				vo.setAddress(addr);
				vo.setHit(rs.getInt(7));
				vo.setLike_count(rs.getInt(8));
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
	
	public int mangoTotalPage() {
		int total=0;
		try {
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) "
					+ "FROM food_info";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	// 맛집 상세보기
	public MangoVO mangoDetailData(int fino) {
		MangoVO vo=new MangoVO();
		try {
			conn=db.getConnection();
			String sql="UPDATE food_info SET "
					+ "hit=hit+1 "
					+ "WHERE fino=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fino);
			ps.executeUpdate();
			sql="SELECT fino,mcno,poster,name,score,address,phone,type,price,parking,time,menu,hit,like_count "
				+ "FROM food_info "
				+ "WHERE fino=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fino);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFino(rs.getInt(1));
			vo.setMcno(rs.getInt(2));
			vo.setPoster(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setScore(rs.getDouble(5));
			vo.setAddress(rs.getString(6));
			vo.setPhone(rs.getString(7));
			vo.setType(rs.getString(8));
			vo.setPrice(rs.getString(9));
			vo.setParking(rs.getString(10));
			vo.setTime(rs.getString(11));
			vo.setMenu(rs.getString(12));
			vo.setHit(rs.getInt(13));
			vo.setLike_count(rs.getInt(14));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	

}
