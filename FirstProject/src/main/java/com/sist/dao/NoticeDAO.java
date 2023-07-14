package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.common.*;
public class NoticeDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDataBase db=new CreateDataBase();
   private static NoticeDAO dao;
   // 싱글턴 
   public static NoticeDAO newInstance()
   {
	   if(dao==null)
		   dao=new NoticeDAO();
	   return dao;
   }
   // 기능 
   // notice list
   public List<NoticeVO> noticeListData(int page)
   {
	   List<NoticeVO> list=new ArrayList<NoticeVO>();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,type,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,type,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(notice noti_no_pk)*/no,subject,name,regdate,hit,type "
				     +"FROM notice)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   // 결과값 읽기
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   NoticeVO vo=new NoticeVO();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setDbday(rs.getString(4));
			   vo.setHit(rs.getInt(5));
			   vo.setType(rs.getString(6));
			   vo.setRownum(rs.getInt(7));
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
   
   // paging
   public int noticeRowCount()
   {
	   int count=0;
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT COUNT(*) FROM notice";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
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
   
   // notice Insert
   public void noticeInsert(NoticeVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO notice VALUES("
				     +"noti_no_seq.nextval,?,?,?,?,SYSDATE,0)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getType());
		   ps.setString(2, vo.getName());
		   ps.setString(3, vo.getSubject());
		   ps.setString(4, vo.getContent());
		   ps.executeUpdate(); // commit => autocommit
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   
   // notice detail 
   public NoticeVO noticeDetailData(int no)
   {
	   NoticeVO vo=new NoticeVO();
	   try
	   {
		   conn=db.getConnection();
		   String sql="UPDATE notice SET "
				     +"hit=hit+1 "
				     +"WHERE no=?";
		   // 조회수 증가 
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ps.executeUpdate();
		   
		   // 실제 데이터 읽기 
		   sql="SELECT no,subject,name,content,"
			  +"TO_CHAR(regdate,'yyyy-MM-dd'),hit "
			  +"FROM notice "
			  +"WHERE no=?";
		   
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   
		   ResultSet rs=ps.executeQuery();
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
   
   // 5. notice_update.jsp로 보내는 데이터
   public NoticeVO noticeUpdateData(int no)
   {
	   NoticeVO vo=new NoticeVO();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT no,subject,name,content,type "
			  +"FROM notice "
			  +"WHERE no=?";
		   
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setSubject(rs.getString(2));
		   vo.setName(rs.getString(3));
		   vo.setContent(rs.getString(4));
		   vo.setType(rs.getString(5));
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
   
   // 실제 update
   public void noticeUpdate(NoticeVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="UPDATE notice SET "
					  +"name=?,subject=?,content=?, type=? "
					  +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getName());
		   ps.setString(2, vo.getSubject());
		   ps.setString(3, vo.getContent());
		   ps.setString(4, vo.getType());
		   ps.setInt(5, vo.getNo());
		   
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
   
   // delete
   public void noticeDelete(int no)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="DELETE FROM notice WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
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
}





