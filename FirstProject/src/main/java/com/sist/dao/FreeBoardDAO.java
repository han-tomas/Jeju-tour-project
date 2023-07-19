package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;
public class FreeBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static FreeBoardDAO dao;
	public static FreeBoardDAO newInstance()
	{
		if(dao==null)
			dao =  new FreeBoardDAO();
		return dao;
	}
	// 기능
	// 1. 목록 출력
	public List<FreeboardVO> freeboardListData(int page)
	{
		List<FreeboardVO> list = new ArrayList<FreeboardVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss'),hit,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,rownum AS num "
					+ "FROM (SELECT /*+INDEX_DESC(jeju_freeboard jf_no_pk)*/no,subject,name,regdate,hit "
					+ "FROM jeju_freeboard)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize=10;
			int start =(page*rowSize)-(rowSize-1);
			int end=page*rowSize;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				FreeboardVO vo = new FreeboardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	// 자유게시판 총 게시물 갯수
	public int freeboardTotalRow()
	{
		int count = 0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_freeboard";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	// 글쓰기
	public void freeboardInsert(FreeboardVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql ="INSERT INTO jeju_freeboard VALUES("
					+ "jf_no_seq.nextval,?,?,?,?,SYSDATE,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
	}
	
	// 상세보기
	public FreeboardVO freeboardDetailData(int no)
	{
		FreeboardVO vo = new FreeboardVO();
		try
		{
			conn=db.getConnection();
			String sql="UPDATE project_freeboard SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
			// 조회수 증가
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			// 실제 데이터 읽기
			sql="SELECT no,subject,name,content,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss'),hit "
					+ "FROM jeju_freeboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
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
	// 수정
	// 수정할 내용 불러오기
	public FreeboardVO freeboardUpdateData(int no)
	{
		FreeboardVO vo = new FreeboardVO();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,subject,name,content "
					+ "FROM jeju_freeboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setContent(rs.getString(4));
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
	// 수정하기
	public boolean freeboardUpdate(FreeboardVO vo)
	{
		boolean bCheck=false;
		try
		{
			conn=db.getConnection();
			String sql="SELECT pwd FROM jeju_freeboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				sql="UPDATE project_freeboard SET "
						+ "name=?,subject=?,content=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return bCheck;
	}
	// 6. 삭제
	public String freeboardDelete(int no, String pwd)
	{
		String res="NO";
		try
		{
			conn=db.getConnection();
			String sql="SELECT pwd FROM jeju_freeboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd))
			{
				res="YES";
				// 참조하고 있는 댓글을 먼저 지운다.
				sql= "DELETE FROM jeju_freeboard_reply "
						+ "WHERE bno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				
				sql="DELETE FROM jeju_freeboard "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			db.disConnection(conn, ps);
		}
		return res;
		
	}
}
