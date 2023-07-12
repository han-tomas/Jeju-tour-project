package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.common.*;
public class QnADAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static QnADAO dao;
	//싱글턴
	public static QnADAO newInstance()
	{
		if(dao==null)
			dao=new QnADAO();
		return dao;
	}
	// 기능
	// 1. 목록 출력 => 인라인 뷰 => 페이징
	public List<QnAVO> qnaListData(int page)
	{
		List<QnAVO> list = new ArrayList<QnAVO>();
		try
		{
			conn=db.getConnection();
			String sql = "SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					+ "FROM (SELECT /*+INDEX_DESC(jeju_QnABoard jqb_no_pk)*/no,subject,name,regdate,hit "
					+ "FROM jeju_QnABoard)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start = (page*rowSize)-(rowSize-1);
			int end=page*rowSize;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				QnAVO vo = new QnAVO();
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
	// 1-1 총 QnA 갯수
	public int qnaTotalCount()
	{
		int count=0;
		try
		{
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_QnABoard";
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
	
	// 2. 글쓰기
	public void qnaBoardInsert(QnAVO vo)
	{
		try
		{
			conn=db.getConnection();
			String sql="INSERT INTO jeju_QnABoard VALUES("
					+ "jqb_no_seq.nextval,?,?,?,?,SYSDATE,0)";
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
	// 3. 상세보기 
	public QnAVO qnaDetailData(int no)
	{
		QnAVO vo = new QnAVO();
		try
		{
			conn=db.getConnection();
			// 조회수 증가
			String sql ="UPDATE jeju_QnABoard SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			// 실제 데이터 읽기
			sql="SELECT no,subject,name,content,TO_CHAR(regdate,'yyyy-MM-dd'),hit "
					+ "FROM jeju_QnABoard "
					+ "WHERE no=?";
			ps = conn.prepareStatement(sql);
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
}
