package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	public Connection getConnection() throws Exception{		//1단계, 2단계 분리
		// 예외처리를 메서드 호출하는 곳에서 하도록 설정 = throws Exception
		Connection con = null;
		Context init = new InitialContext();
		// init.lookup("위치/jdbc/MysqlDB");
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}
	
	public void insertMember(MemberBean mb) {
		//DB접속
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();

			String sql= "insert into member(id, pass, name, reg_date) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setTimestamp(4, mb.getReg_date());
			
			//sql 구문 실행
			pstmt.executeUpdate();	
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}	
	}//insertMember() 함수
	
	public MemberBean getMember(String id) {
		MemberBean mb = new MemberBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();

			String sql= "select * from member where id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			//sql 구문 실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return mb;
	}//getMember()함수
	
	public int userCheck(String id, String pass) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			 con = getConnection();

			 // sql id조건에 만족하는 pass 정보가져오기
			 String sql="select * from member where id = ?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 // id 존재하는지 조회, id비교, 디비 id값과 폼의 id값을 비교
			 String password = "";
			 if(rs.next()){
			 	password = rs.getString("pass");
			 	//폼과 디비의 id비교
			 	if(pass.equals(password)){	//패스워드 맞음
			 		check = 1;
			 	} else{						//비밀번호 틀림
			 		check = 0;
			 	}	
			 } else{						//아이디 없음
				 	check = -1;
			 }
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return check;
	}//userCheck 메서드
	
	public void updateMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			
			String sql = "update member set name = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getName());
			pstmt.setString(2, mb.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
	}// updateMember()
	
	public void deleteMember(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			
			String sql = "delete from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		
	}// deleteMember()
	public List getMemberList() {
		List memberList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				memberList.add(mb);	// 저장할 때 업캐스팅 - Object형
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch(SQLException e) {}
		}
		return memberList;
	}// getMemberList() 
	
}//클래스 함수

















