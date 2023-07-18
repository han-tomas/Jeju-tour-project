package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.common.*;
import com.sist.vo.*;
public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private static MemberDAO dao;
	
	// 싱글턴
	public static MemberDAO newInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	// 회원가입
	// 1. 아이디 중복체크
	public int memberIdCheck(String id) {
		int count = 0;
		try {
			conn = db.getConnection();
			String sql = "SELECT COUNT(*) "
						+"FROM jeju_member "
						+"WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return count;
	}
	
	// 2. 이메일 중복체크
	public int memberEmailCheck(String email) {
		int count = 0;
		try {
			conn = db.getConnection();
			String sql = "SELECT COUNT(*) "
						+"FROM jeju_member "
						+"WHERE email=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return count;
	}
	
	// 3. 우편번호 검색
	public int postFindCount(String dong) {
		int count=0;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT COUNT(*) "
						+"FROM zipcode "
						+"WHERE dong LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return count;
	}
	
	public List<ZipCodeVO> postFindData(String dong) {
		List<ZipCodeVO> list = new ArrayList<ZipCodeVO>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT zipcode, sido, gugun, dong, NVL(bunji, ' ') "
						+"FROM zipcode "
						+"WHERE dong LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ZipCodeVO vo = new ZipCodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
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
	
	// 4. 전화 중복체크
	public int memberPhoneCheck(String phone) {
		int count = 0;
		try {
			conn = db.getConnection();
			String sql = "SELECT COUNT(*) "
						+"FROM jeju_member "
						+"WHERE phone=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  phone);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return count;
	}
	
	// 5. 회원가입
	public void memberInsert(MemberVO vo) {
		try {
			conn = db.getConnection();
			String sql = "INSERT INTO jeju_member VALUES( "
						+"?,?,?,?,?,?,?,?,?,?,?,'n',SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getSex());
			ps.setString(5, vo.getBirth());
			ps.setString(6, vo.getEmail());
			ps.setString(7, vo.getPost());
			ps.setString(8, vo.getAddr1());
			ps.setString(9, vo.getAddr2());
			ps.setString(10, vo.getPhone());
			ps.setString(11, vo.getContent());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
	}
	
	// 회원 수정
	
	// 회원 탈퇴
	
	// 아이디 찾기
	 public String memeberId_EmailFind(String email)
	   {
		   String result="";
		   try
		   {
			   conn=db.getConnection();
			   String sql="SELECT COUNT(*) FROM jeju_member "
			   		+ "WHERE email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   int count=rs.getInt(1);
			   rs.close();
			   if(count==0) // email이 없는 상태
			   {
				   result="NO";
			   }
			   else // email이 존재
			   {
				   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
				   		+ "FROM jeju_member "
				   		+ "WHERE email=?";
				   //s***
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, email);
				   rs = ps.executeQuery();
				   rs.next();
				   result=rs.getString(1);
				   rs.close();
				   
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
	 public String memeberId_PhoneFind(String phone)
	 {
		 String result="";
		 try
		 {
			 conn=db.getConnection();
			 String sql="SELECT COUNT(*) FROM jeju_member "
					 + "WHERE phone=?";
			 ps=conn.prepareStatement(sql);
			 ps.setString(1, phone);
			 ResultSet rs = ps.executeQuery();
			 rs.next();
			 int count=rs.getInt(1);
			 rs.close();
			 if(count==0) // email이 없는 상태
			 {
				 result="NO";
			 }
			 else // email이 존재
			 {
				 sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
						 + "FROM jeju_member "
						 + "WHERE phone=?";
				 //s***
				 ps=conn.prepareStatement(sql);
				 ps.setString(1, phone);
				 rs = ps.executeQuery();
				 rs.next();
				 result=rs.getString(1);
				 rs.close();
				 
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
	// 비밀번호 찾기
	public String memberPasswordFind(String name,String email)
   {
	   String result="";
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT COUNT(*) FROM jeju_member "
		   		+ "WHERE name=? AND email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, name);
		   ps.setString(2, email);
		   ResultSet rs = ps.executeQuery();
		   rs.next();
		   int count =rs.getInt(1);
		   rs.close();
		   if(count ==0)
		   {
			   result="NO";
		   }
		   else
		   {
			   sql="SELECT RPAD(SUBSTR(pwd,1,1),LENGTH(pwd),'*') "
			   		+ "FROM jeju_member "
			   		+ "WHERE name=? AND email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, name);
			   ps.setString(2, email);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
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
	public String memberPasswordPhoneFind(String name,String phone)
	{
		String result="";
		try
		{
			conn=db.getConnection();
			String sql="SELECT COUNT(*) FROM jeju_member "
					+ "WHERE name=? AND phone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, phone);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count =rs.getInt(1);
			rs.close();
			if(count ==0)
			{
				result="NO";
			}
			else
			{
				sql="SELECT RPAD(SUBSTR(pwd,1,1),LENGTH(pwd),'*') "
						+ "FROM jeju_member "
						+ "WHERE name=? AND phone=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, phone);
				rs=ps.executeQuery();
				rs.next();
				result=rs.getString(1);
				rs.close();
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

	// 비밀번호 변경
	
	// 로그인
	public MemberVO memberLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		try {
			conn = db.getConnection();
			String sql = "SELECT COUNT(*) "
						+"FROM jeju_member "
						+"WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			////////////////////////////////// ID 존재여부 확인
			
			if (count == 0) {
				vo.setMsg("NOID");
			} else {
				sql = "SELECT pwd, name, admin, sex "
					 +"FROM jeju_member "
					 +"WHERE id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				rs.next();
				String db_pwd = rs.getString(1);
				String name = rs.getString(2);
				String admin = rs.getString(3);
				String sex = rs.getString(4);
				rs.close();
				
				if (db_pwd.equals(pwd)) { // 로그인 성공
					vo.setId(id);
					vo.setName(name);
					vo.setAdmin(admin);
					vo.setSex(sex);
					vo.setMsg("OK");
				} else { // 비밀번호 오류
					vo.setMsg("NOPWD");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return vo;
	}
	
	// 사용자 조회
	public MemberVO memberSearch(String id) {
		MemberVO vo = new MemberVO();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT birth, email, post, addr1, addr2, phone, content "
						+"FROM jeju_member "
						+"WHERE id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setBirth(rs.getString(1));
			vo.setEmail(rs.getString(2));
			vo.setPost(rs.getString(3));
			vo.setAddr1(rs.getString(4));
			vo.setAddr2(rs.getString(5));
			String phone1 = rs.getString(6).substring(0, 8);
			String phone2 = rs.getString(6).substring(8);
			vo.setPhone(phone1 + "-" + phone2);
			vo.setContent(rs.getString(7));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		
		return vo;
	}
	// 관리자 페이지에 들어갈 회원 리스트
	public List<MemberVO> memberList() {
		List<MemberVO> list=new ArrayList<MemberVO>();
		try {
			conn=db.getConnection();
			String sql="SELECT id,pwd,name,sex,birth,email,post,addr1,addr2,phone,TO_CHAR(regdate,'YYYY-MM-DD'),admin "
					+ "FROM jeju_member";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MemberVO vo=new MemberVO();
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setSex(rs.getString(4));
				vo.setBirth(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setPost(rs.getString(7));
				vo.setAddr1(rs.getString(8));
				vo.setAddr2(rs.getString(9));
				vo.setPhone(rs.getString(10));
				vo.setDb_date(rs.getString(11));
				vo.setAdmin(rs.getString(12));
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
	
}
