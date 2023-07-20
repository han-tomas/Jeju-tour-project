package com.sist.dao;

import java.sql.*;

import com.sist.common.*;
import java.util.*;
import com.sist.vo.*;

import oracle.jdbc.proxy.annotation.Pre;

public class HotelDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private String[] tab = {"'%'", "1", "2", "3", "4"};
	private static HotelDAO dao;
	private String hotelURL = "http://www.jejutori.com/";
	
	// 싱글턴
	public static HotelDAO newInstance() {
		if (dao == null) {
			dao = new HotelDAO();
		}
		return dao;
	}
	
	// 기능
	// 리스트출력
	public List<HotelVO> hotelListData(int page, int type) {
		List<HotelVO> list = new ArrayList<HotelVO>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT hdno, huno, name, poster, addr, hcno, num "
						+"FROM (SELECT hdno, huno, name, poster, addr, hcno, rownum as num "
						+"FROM (SELECT hdno, huno, name, poster, addr,  hcno "
						+"FROM hotel_detail WHERE hcno like "+tab[type]
						+" ORDER BY hdno ASC)) "
						+"WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 12;
			int start = (rowSize*page)-(rowSize-1);
			int end = rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				HotelVO vo = new HotelVO();
				vo.setHdno(rs.getInt(1));
				vo.setHuno(rs.getInt(2));
				vo.setName(rs.getString(3));
				String poster = rs.getString(4).substring(0, rs.getString(4).indexOf("^"));
				vo.setPoster(hotelURL+poster);
				vo.setAddress(rs.getString(5).substring(0, rs.getString(5).indexOf("/")));
				vo.setHcno(rs.getInt(6));
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
	
	// 총페이지
	public int hotelTotalPage(int type) {
		int total=0;
		try {
			conn = db.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM hotel_detail where hcno like "+tab[type];
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return total;
	}
	
	// 상세 페이지
	public HotelVO hotelDetailData(int huno) {
		HotelVO vo = new HotelVO();
		
		try {
			conn = db.getConnection();
			
			// hdno 취득
			String sql = "SELECT hdno from hotel_detail WHERE huno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, huno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int hdno = rs.getInt(1);
			rs.close();
			
			// hit 증가
			sql="UPDATE hotel_detail SET "
					+ "hit=hit+1 "
					+ "WHERE hdno="+hdno;
			
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			// 실제 데이터 읽기
			sql = "SELECT hdno, huno, name, addr, content, etc, poster, hit "
						+"FROM hotel_detail "
						+"WHERE huno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, huno);
			rs = ps.executeQuery();
			rs.next();
			vo.setHdno(rs.getInt(1));
			vo.setHuno(rs.getInt(2));
			vo.setName(rs.getString(3));
			vo.setAddress(rs.getString(4));
			vo.setAddr1(rs.getString(4).substring(0, rs.getString(4).indexOf("/")));
			vo.setAddr2(rs.getString(4).substring(rs.getString(4).lastIndexOf("/")+1));
			vo.setContent(rs.getString(5));
			vo.setEtc(rs.getString(6));
			vo.setPoster(rs.getString(7));
			vo.setHit(rs.getInt(8));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return vo; 
	}
	
	// 방 리스트
	public List<RoomVO> roomListData(int huno, String start, String end) {
		List<RoomVO> rList = new ArrayList<RoomVO>();
		try {
			conn = db.getConnection();
			String sql = "SELECT rno, huno, rname, account, price, person, rstructure, special, rposter, num "
						+"FROM (SELECT rno, huno, rname, account, price, person, rstructure, special, rposter, rownum as num "
						+"FROM (SELECT rno, huno, rname, account, price, person, rstructure, special, rposter "
						+"FROM room WHERE huno = ?)) room_data "
						+"WHERE NOT EXISTS (SELECT 1 "
						+"FROM jeju_reserve WHERE huno = ? "
						+"AND rno = room_data.rno "
						+"AND TO_DATE(checkin, 'YYYY-MM-DD') <= TO_DATE(?, 'YYYY-MM-DD') "
						+"AND TO_DATE(checkout, 'YYYY-MM-DD') > TO_DATE(?, 'YYYY-MM-DD') "
						+"GROUP BY rno "
						+"HAVING COUNT(*) >= account)";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, huno);
			ps.setInt(2, huno);
			ps.setString(3, end);
			ps.setString(4, start);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				RoomVO vo = new RoomVO();
				vo.setRno(rs.getInt(1));
				vo.setHuno(rs.getInt(2));
				vo.setRname(rs.getString(3));
				vo.setAccount(rs.getInt(4));
				vo.setPrice(rs.getInt(5));
				vo.setPerson(rs.getString(6));
				vo.setRstructure(rs.getString(7));
				vo.setSpecial(rs.getString(8));
				vo.setRposter(rs.getString(9));
				rList.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return rList;
	}
	
	// 방정보
	public RoomVO roomSelectData(int rno) {
		RoomVO vo = new RoomVO();
		try {
			conn = db.getConnection();
			String sql = "SELECT rno, huno, rname, account, price, person, rstructure, special, rposter "
						+"FROM room WHERE rno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setRno(rs.getInt(1));
			vo.setHuno(rs.getInt(2));
			vo.setRname(rs.getString(3));
			vo.setAccount(rs.getInt(4));
			vo.setPrice(rs.getInt(5));
			vo.setPerson(rs.getString(6));
			vo.setRstructure(rs.getString(7));
			vo.setSpecial(rs.getString(8));
			vo.setRposter(rs.getString(9));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 숙소명 취득
	public String hotelNameData(int huno) {
		String name = "";
		
		try {
			conn = db.getConnection();
			String sql = "SELECT name FROM hotel_detail "
						+"WHERE huno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, huno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			name = rs.getString(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return name;
	}
	
	// 예약하기
	public void hotelReserveOk(ReservationVO vo) {
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO jeju_reserve ("
						+"jrno, checkin, checkout, dbday, rno, id, rname, remail, rphone, "
						+"inwon, price, tprice, poster, title, rcno, rok, regdate) "
						+"VALUES("
						+"jr_jrno_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,2,'n',sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getCheckin());
			ps.setString(2, vo.getCheckout());
			ps.setString(3, vo.getDbday());
			ps.setInt(4, vo.getRno());
			ps.setString(5, vo.getId());
			ps.setString(6, vo.getRname());
			ps.setString(7, vo.getRemail());
			ps.setString(8, vo.getRphone());
			ps.setInt(9, vo.getInwon());
			ps.setInt(10, vo.getPrice());
			ps.setInt(11, vo.getTprice());
			ps.setString(12, vo.getPoster());
			ps.setString(13, vo.getTitle());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
}
