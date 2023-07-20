package com.sist.dao;
import java.util.*;
import java.util.Date;
import java.sql.*;
import com.sist.vo.*;
import com.sist.common.*;
public class QnA_DAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db=new CreateDataBase();
	private static QnA_DAO dao;
	
	public static QnA_DAO newInstance() {
		if(dao==null)
			dao=new QnA_DAO();
		return dao;
	}
	// list
	public List<QnA_VO> qnaBoardListData(int page){
		List<QnA_VO> list=new ArrayList<QnA_VO>();
		try {
			/*
	private int no,group_step,group_tab,group_id,isreply;
	private String id,name,subject,content,dbday,type;
	private Date regdate;
			 */
			conn=db.getConnection();
			String sql="SELECT no,id,subject,TO_CHAR(regdate,'yyyy-MM-dd'),group_tab,type,num "
					+ "FROM (SELECT no,id,subject,regdate,group_tab,type,rownum as num "
					+ "FROM (SELECT no,id,subject,regdate,group_tab,type "
					+ "FROM qnaboard ORDER BY group_id DESC,group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				QnA_VO vo=new QnA_VO();
				vo.setNo(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setGroup_tab(rs.getInt(5));
				vo.setType(rs.getString(6));
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
	
	// totalpage
	public int qnaBoardTotalPage() {
		int total=0;
		try {
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM qnaboard";
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
	
	// count number
	public int qnaBoardCount() {
		int count=0;
		try {
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM qnaboard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return count;
	}
	
	// insert
	public void qnaBoardInsert(QnA_VO vo) {
		try {
			conn=db.getConnection();
			String sql="INSERT INTO qnaboard(no,id,subject,content,type,group_id) "
					+ "VALUES(qna_no_seq.nextval,?,?,?,?,"
					+ "(SELECT NVL(MAX(group_id)+1,1) "
					+ "FROM qnaboard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getType());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	// delete
	public void qnaBoardDelete(int no,String id) {
		try {
			conn=db.getConnection();
			String sql="SELECT group_id,isreply "
					+ "FROM qnaboard "
					+ "WHERE no=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			int isreply=rs.getInt(2);
			rs.close();
			if(isreply==1) {
				sql="DELETE FROM qnaboard "
						+ "WHERE group_id=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gi);
				ps.executeUpdate();
			}else {
				sql="DELETE FROM qnaboard "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	// detail
	public QnA_VO qnaBoardDetailData(int no) {
		QnA_VO vo=new QnA_VO();
		try {
			/*
			private int no,group_step,group_tab,group_id,isreply;
			private String id,name,subject,content,dbday,type;
			private Date regdate;
			 */
			conn=db.getConnection();
			String sql="SELECT no,id,subject,content,TO_CHAR(regdate,'yyyy-MM-dd'),type "
					+ "FROM qnaboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setId(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setType(rs.getString(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}

	// admin
	// list
	public List<QnA_VO> qnaAdminListData(int page){
		List<QnA_VO> list=new ArrayList<QnA_VO>();
		try {
			conn=db.getConnection();
			String sql="SELECT no,id,subject,TO_CHAR(regdate,'yyyy-MM-dd'),isreply,group_step,num "
					+ "FROM (SELECT no,id,subject,regdate,isreply,group_step,rownum as num "
					+ "FROM (SELECT no,id,subject,regdate,isreply,group_step "
					+ "FROM qnaboard ORDER BY group_id DESC)) "
					+ "WHERE num BETWEEN ? AND ? "
					+ "AND group_step=0";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				QnA_VO vo=new QnA_VO();
				vo.setNo(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setGroup_step(rs.getInt(5));
				vo.setIsreply(rs.getInt(6));
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
	
	// totalpage
	public int qnaBoardAdminTotalPage() {
		int total=0;
		try {
			conn=db.getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM qnaboard";
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
	
	// admin reply
	public void qnaBoardAdminInsert(int qno,QnA_VO vo) {
		try {
			conn=db.getConnection();
			conn.setAutoCommit(false);
			String sql="SELECT group_id FROM qnaboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			rs.close();
			
			sql="INSERT INTO qnaboard(no,id,subject,content,group_id,group_step,group_tab,type) "
					+ "VALUES (qna_no_seq.nextval,?,?,?,?,1,1,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, gi);
			ps.setString(5, vo.getType());
			ps.executeUpdate();
			
			sql="UPDATE qnaboard SET isreply=1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qno);
			ps.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (Exception e2) {}
			db.disConnection(conn, ps);
		}
	}
	
	//detail
	public QnA_VO qnaBoardAdminDetailData(int no) {
		QnA_VO vo=new QnA_VO();
		try {
			conn=db.getConnection();
			String sql="SELECT no,id,subject,content,TO_CHAR(regdate,'yyyy-MM-dd'),type "
					+ "FROM qnaboard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setId(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setType(rs.getString(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
}
