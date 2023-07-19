package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import com.sist.common.*;
import com.sist.vo.*;
import java.sql.*;

public class MypageDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static MypageDAO dao;
	
	public static MypageDAO newInstance() {
		if(dao==null)
			dao=new MypageDAO();
		return dao;
	}
	
	public List<ReservationVO> reservationListData(String id){
		List<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT dbday,poster,title,regdate,tprice FROM jeju_reserve WHERE id=? "
					+ "ORDER BY jrno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReservationVO vo=new ReservationVO();
				vo.setDbday(rs.getString(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
//				Date date = rs.getDate(4);
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				String realday = sdf.format(date);
				String realday="2023년 07월 19일";
				vo.setRealDate(realday);
				vo.setTprice(rs.getInt(5));
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
	
}
