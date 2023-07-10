package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.common.*;

public class ActivityDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ActivityDAO dao;
	private CreateDataBase db = new CreateDataBase();

	public static ActivityDAO newInstance() {
		if (dao == null)
			dao = new ActivityDAO();
		return dao;
	}

	// 카테고리 리스트
	public List<ActivityCategoryVO> activityCategoryListData() {
		List<ActivityCategoryVO> list = new ArrayList<ActivityCategoryVO>();
		try {
			conn = db.getConnection();
			String sql = "SELECT accno, rcno, name, link FROM activity_category";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ActivityCategoryVO vo = new ActivityCategoryVO();
				vo.setAccno(rs.getInt(1));
				vo.setAcno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setLink(rs.getString(4));
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

	// 리스트
	public List<ActivityVO> activityListData(int page, int accno) {
		List<ActivityVO> list = new ArrayList<ActivityVO>();
		try {
			conn = db.getConnection();
			/*
			 * "SELECT fno,poster, name, num " +
			 * "FROM (SELECT fno,poster, name, rownum as num " +
			 * "FROM (SELECT /*+ INDEX_ASC(food_location fl_fno_pk) fno,poster, name " +
			 * "FROM food_location WHERE address LIKE '%'||?||'%')) " +
			 * "WHERE num BETWEEN ? AND ? ";
			 */
			String sql = "SELECT acino,accno,title,score,review_count,price,main_poster,num "
					+ "FROM (SELECT acino,accno,title,score,review_count,price,main_poster,rownum as num  "
					+ "FROM (SELECT /*+ INDEX_ASC(activity_info aci_acino_pk)*/acino,accno,title,score,review_count,price,main_poster "
					+ "FROM activity_info WHERE accno=?)) " + "WHERE num BETWEEN ? AND ?";
			int rowSize = 12;
			int start = (rowSize * page) - (rowSize - 1);
			int end = (rowSize * page);
			ps = conn.prepareStatement(sql);
			ps.setInt(1, accno);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ActivityVO vo = new ActivityVO();
				vo.setAcino(rs.getInt(1));
				vo.setAccno(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setScore(rs.getDouble(4));
				vo.setReview_count(rs.getString(5));
				vo.setPrice(rs.getInt(6));
				String main_poster = rs.getString(7);
				main_poster = main_poster.replace("#", "&");
				vo.setMain_poster(main_poster);
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

	public int activityTotalPage(int accno) {
		int total = 0;
		try {
			conn = db.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) " + "FROM activity_info " + "WHERE accno=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, accno);
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
	
	// 상세보기
	public ActivityVO activityDetailData(int acino) {
		ActivityVO vo = new ActivityVO();
		try {
			conn = db.getConnection();
			String sql = "SELECT acino, accno, title, score, review_count, price, reviewer, review_content, "
					+ "hours_use, location_name, location_poster, how_use, poster, main_poster " + "FROM activity_info "
					+ "WHERE acino=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, acino);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setAcino(rs.getInt(1));
			vo.setAccno(rs.getInt(2));
			vo.setTitle(rs.getString(3));
			vo.setScore(rs.getDouble(4));
			vo.setReview_count(rs.getString(5));
			vo.setPrice(rs.getInt(6));
			vo.setReviewer(rs.getString(7));
			vo.setReview_content(rs.getString(8));
			vo.setHours_use(rs.getString(9));
			vo.setLocation_name(rs.getString(10));
			String location_poster = rs.getString(11);
			location_poster = location_poster.replace("#", "&");
			vo.setLocation_poster(location_poster);
			vo.setHow_use(rs.getString(12));
			if (rs.getString(13) != null) {
				String poster = rs.getString(13);
				poster = poster.replace("#", "&");
				vo.setPoster(poster);
			}
			String main_poster = rs.getString(14);
			main_poster = main_poster.replace("#", "&");
			vo.setMain_poster(main_poster);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	// 카테고리별 갯수
	public int totalCategoryCount(int accno) {
		int totalCategory=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM activity_info WHERE accno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, accno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalCategory=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			db.disConnection(conn, ps);
		}
		return totalCategory;
	}
}
