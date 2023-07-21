package com.sist.dao;

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
	
	public List<ReservationVO> reservationListData(String id, int page){
		List<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT dbday,poster,title,regdate,tprice,NVL(acino,0),NVL(rno,0),NVL(cid,0),rcno,rok,jrno,num "
					+ "FROM (SELECT dbday,poster,title,regdate,tprice,acino,rno,cid,rcno,rok,jrno,rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(jeju_reserve jr_jrno_pk)*/dbday, poster, title, regdate, tprice,acino,rno,cid, rcno, rok,jrno "
					+ "FROM jeju_reserve WHERE id=?)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			int rowSize=5;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReservationVO vo=new ReservationVO();
				vo.setDbday(rs.getString(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				Date date = rs.getDate(4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String realday = sdf.format(date);
				vo.setRealDate(realday);
				vo.setTprice(rs.getInt(5));
				vo.setJrno(rs.getInt(6));
				vo.setAcino(rs.getInt(6));
				vo.setRno(rs.getInt(7));
				vo.setCid(rs.getInt(8));
				vo.setRcno(rs.getInt(9));
				vo.setRok(rs.getString(10));
				vo.setJrno(rs.getInt(11));
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
	
	public int reservationRowCount(String id) {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_reserve WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
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
	//비밀번호 확인
	public String mypagePwdOK(String id,String pwd)
	{
		String result="NO";
		try
		{
			conn=db.getConnection();
			String sql="SELECT pwd FROM jeju_member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd))
			{
				result="YES";
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;		
	}
	// 내정보수정
	// 내정보 불러오기
	public MemberVO mypageUpdateData(String id)
	{
		MemberVO vo = new MemberVO();
		try
		{
			conn=db.getConnection();
			String sql ="SELECT id,name,sex,birth,email,post,"
					+ "addr1,addr2,phone,content,pwd "
					+ "FROM jeju_member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			   vo.setId(rs.getString(1));
			   vo.setName(rs.getString(2));
			   vo.setSex(rs.getString(3));
			   vo.setBirth(rs.getString(4));
			   vo.setEmail(rs.getString(5));
			   vo.setPost(rs.getString(6));
			   vo.setAddr1(rs.getString(7));
			   vo.setAddr2(rs.getString(8));
			   vo.setPhone(rs.getString(9));
			   vo.setContent(rs.getString(10));
			   vo.setPwd(rs.getString(11));
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
	// 내정보 수정
	public void mypageUpdate(MemberVO vo) {
		try {
			conn = db.getConnection();
			String sql = "UPDATE jeju_member SET "
						+"pwd=?,name=?,sex=?,birth=?,email=?,post=?,addr1=?,"
						+ "addr2=?,phone=?,content=? "
						+ "WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getPwd());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getSex());
			ps.setString(4, vo.getBirth());
			ps.setString(5, vo.getEmail());
			ps.setString(6, vo.getPost());
			ps.setString(7, vo.getAddr1());
			ps.setString(8, vo.getAddr2());
			ps.setString(9, vo.getPhone());
			ps.setString(10, vo.getContent());
			ps.setString(11, vo.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	// 회원 탈퇴
	public String mypageDeleteOk(String id,String pwd)
	{
		String result="NO";
		try
		{
			conn=db.getConnection();
			   String sql="SELECT pwd FROM jeju_member "
			   		+ "WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   String db_pwd = rs.getString(1);
			   rs.close();
			   if(db_pwd.equals(pwd))
			   {
				   try
				   {
					   conn.setAutoCommit(false);
					   
					   sql="DELETE FROM hotel_wish WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM activity_wish WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM course_recommend WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM course_jjim WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM jeju_food_jjim WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM jeju_food_like WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM wish_reserve WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM jeju_reserve WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM jeju_freeboard_reply WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM qnaboard WHERE id=?";
					   ps=conn.prepareStatement(sql);
					   ps.setString(1, id);
					   ps.executeUpdate();
					   
					   sql="DELETE FROM jeju_member "
						   		+ "WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
					   result="YES";
				   }catch(Exception ex)
				   {
					   try
					   {
						   conn.rollback();
					   }catch(Exception e) {}
				   }
				   finally
				   {
					   try
					   {
						   conn.setAutoCommit(true);
					   }catch(Exception ex) {}
				   }
			   }
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return result;
	}
	
	public void reserveDelete(int jrno) {
		try {
			conn=db.getConnection();
			String sql="DELETE FROM jeju_reserve WHERE jrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, jrno);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
	}
	
	public ReservationVO reserveSearch(int jrno) {
		ReservationVO vo = new ReservationVO();
		try {
			conn=db.getConnection();
			String sql="SELECT rcno, NVL(acino,0), NVL(rno,0), NVL(cid,0) "
					+ "FROM jeju_reserve WHERE jrno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, jrno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setJrno(jrno);
			vo.setRcno(rs.getInt(1));
			vo.setAcino(rs.getInt(2));
			vo.setRno(rs.getInt(3));
			vo.setCid(rs.getInt(4));
			rs.close();
			
			if(vo.getRno()!=0) {
				sql = "SELECT huno FROM room WHERE rno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getRno());
				rs = ps.executeQuery();
				rs.next();
				int huno = rs.getInt(1);
				rs.close();
				sql = "SELECT hdno FROM hotel_detail WHERE huno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, huno);
				rs = ps.executeQuery();
				rs.next();
				vo.setHdno(rs.getInt(1));
				rs.close();
			} else {
				vo.setHdno(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
	public void reviewInsert(ReviewVO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO reserve_review VALUES("
					+ "rr_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getContent());
			ps.setString(2, vo.getScore());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getId());
	        if (vo.getHdno() == 0) {
	            ps.setNull(5, java.sql.Types.INTEGER);
	        } else {
	            ps.setInt(5, vo.getHdno());
	        }
	        
	        if (vo.getAcino() == 0) {
	            ps.setNull(6, java.sql.Types.INTEGER);
	        } else {
	            ps.setInt(6, vo.getAcino());
	        }
	        
	        if (vo.getCid() == 0) {
	            ps.setNull(7, java.sql.Types.INTEGER);
	        } else {
	            ps.setInt(7, vo.getCid());
	        }
			ps.setInt(8, vo.getRcno());
			ps.setInt(9, vo.getJrno());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.disConnection(conn, ps);
		}
	}
}
