package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.common.*;
import com.sist.vo.*;
public class FreeBoardReplyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static FreeBoardReplyDAO dao;
	
	public static FreeBoardReplyDAO newInstance()
	{
		if(dao==null)
			dao = new FreeBoardReplyDAO();
		return dao;
	}
	// 목록 출력
	public List<FreeBoardReplyVO> replyListData(int bno)
	{
		List<FreeBoardReplyVO> list = new ArrayList<FreeBoardReplyVO>();
		try
		{
			conn=db.getConnection();
			String sql="SELECT no,bno,id,name,content,TO_CHAR(regdate,'yyyy-MM-dd HH24:MI:SS'), "
					+ "group_tab "
					+ "FROM jeju_freeBoard_reply "
					+ "WHERE bno=? "
					+ "ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) // 모든 댓글
			{
				FreeBoardReplyVO vo = new FreeBoardReplyVO();
				vo.setNo(rs.getInt(1)); // 댓글 고유번호
				vo.setBno(rs.getInt(2)); // 게시물 no 참조받은 bno
				vo.setId(rs.getString(3)); 
				vo.setName(rs.getString(4)); 
				vo.setContent(rs.getString(5));
				vo.setDbday(rs.getString(6));
				vo.setGroup_tab(rs.getInt(7));
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
	// 댓글 수정
	public void replyUpdate(int no,String msg)
	{
		try
		{
			conn=db.getConnection();
			String sql="UPDATE jeju_freeboard_reply SET "
					+ "content=? "
					+ "WHERE no=?"; // 댓글 고유번호
			ps=conn.prepareStatement(sql);
			ps.setString(1, msg);
			ps.setInt(2, no);
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
	//댓글 입력
	public void replyInsert(FreeBoardReplyVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO project_freeboard_reply(no,bno,id,name,content,group_id) "
					+ "VALUES(jfr_no_seq.nextval,?,?,?,?,"
					+ "(SELECT NVL(MAX(group_id)+1,1) FROM jeju_freeboard_reply))";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getBno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getContent());
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
	// 대댓글 입력
	/*                              gi		gs		gt 
			AAAAAAAA				1		0		0  
			  =>BBBBBBB				1		1		1
			 (=>DDDDDDD				1		1		1 )
			    =>CCCCCCC			1		2		2
			  =>DDDDDDD				1		1		1
			
			                        gi		gs		gt 
			AAAAAAAA				1		0		0  
			  =>EEEEEEE				1		1		1  
			  =>DDDDDDD				1		2(1+1)	1  
			  =>BBBBBBB				1		3(2+1)	1
			    =>CCCCCCC			1		4(3+1)	2
	 
	 */
	public void replyReplyInsert(int pno,FreeBoardReplyVO vo)
	{
		try
		{
			conn=db.getConnection();
			//autocommit해제
			conn.setAutoCommit(false);
			// 처리 => SQL문장이 여러개 수행
			String sql="SELECT group_id,group_step,group_tab "
					+ "FROM jeju_freeboard_reply "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi = rs.getInt(1);
			int gs = rs.getInt(2);
			int gt = rs.getInt(3);
			rs.close();
			
			//group_step+1 => update
			sql="UPDATE project_freeboard_reply SET "
					+ "group_step=group_step+1 "
					+ "WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate(); // (commit()=>X)
			//insert => insert
			sql="INSERT INTO project_freeboard_reply VALUES("
					+ "pfr_no_seq.nextval,?,?,?,?,SYSDATE,?,?,?,?,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getBno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getContent());
			ps.setInt(5, gi);
			ps.setInt(6, gs+1);
			ps.setInt(7, gt+1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			//depth => update
			sql="UPDATE project_freeboard_reply SET "
					+ "depth=depth+1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			
			conn.commit();
		}catch(Exception ex)
		{
			try
			{
				conn.rollback();
			}catch(Exception e) {}
			ex.printStackTrace();
		}
		finally
		{
			// conn의 원래 기능으로 설정
			try
			{
				conn.setAutoCommit(true);
			}catch(Exception ex){}
			db.disConnection(conn, ps);
		}
	}
}
