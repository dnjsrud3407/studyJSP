package board;

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

public class BoardDAO {
	public Connection getConnection() throws Exception{		//DB연결
//		Class.forName("com.mysql.jdbc.Driver");
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
//		String dbUser = "jspid";
//		String dbPass = "jsppass";
//		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		// p. 443 - 커넥션(연결정보) 풀(기억장소) 사용해서 DB연동
		// 데이터베이스와 연결된 Connection 객체를 미리 생성하여
		// 풀(Pool) 속에 저장해두고 필요할 때마다 풀에 접근해서 Connection객체를 사용
		// 작업이 끝나면 다시 반환
		
		
		// 톰캣에서 제공되는 CP(Connection Pool)를 위한
		// DBCP(DataBase Connection Pool) API를 사용해서 DB연동
		// WebContent/META-INF/context.xml - 서버가 start되면 DB가 연동됨
		Connection con = null;
		Context init = new InitialContext();
		// init.lookup("위치/jdbc/MysqlDB");
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}//getConnection()
	
	public void insertBoard(BoardBean bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//max(num) 구하기
			int num = 0;
			con = getConnection();
			//게시판 글이 하나도 없는 경우
			//max(num) 이 null로 나와서 rs.next()가 가능하다
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//게시판 글이 하나도 없는 경우 rs.getInt("max(num)") = null 이므로
				//num 에는 1이 들어간다
				num = rs.getInt("max(num)") + 1;
			}
			
			sql = "insert into board(num, name, pass, subject, content, readcount, date, file, re_ref, re_lev, re_seq) "
					+ "values(?,?,?,?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8, num);	// 댓글 그룹
			pstmt.setInt(9, 0);		// 댓글 레벨
			pstmt.setInt(10, 0);	// 댓글 순서

			//sql 구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
	}//insertBoard()
	
	// 답글 쓰기 함수
	public void reInsertBoard(BoardBean bb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			//max(num) 구하기
			int num = 0;
			con = getConnection();
			//게시판 글이 하나도 없는 경우
			//max(num) 이 null로 나와서 rs.next()가 가능하다
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//게시판 글이 하나도 없는 경우 rs.getInt("max(num)") = null 이므로
				//num 에는 1이 들어간다
				num = rs.getInt("max(num)") + 1;
			}
			// 답글을 달고자하는 글 아래에 답글이 있는 경우
			// 답글의 순서를 한 칸 아래로 재배치 필요 
			// => 쓰고자 하는 글 밑에 있는 답글.seq += 1
			// insert 할 때 re_seq 값을 들고온다
			// => 같은 그룹값이면서 and re_seq 값이 지금 들고온 값보다 크다면 + 1씩해줘야 함! 
			sql = "update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			pstmt.executeUpdate();
			
			// re_seq가 한 칸씩 미뤄졌으므로 답글을 제대로 넣을 수 있다
			sql = "insert into board(num, name, pass, subject, content, readcount, date, file, re_ref, re_lev, re_seq) "
					+ "values(?,?,?,?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// 글 번호
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8, bb.getRe_ref());	// 댓글 그룹 (그룹 번호는 그대로 사용)
			pstmt.setInt(9, bb.getRe_lev() + 1);// 댓글 레벨 (기존 레벨에서 + 1)
			pstmt.setInt(10, bb.getRe_seq() + 1);// 댓글 순서 (기존 순서에서 + 1)

			//sql 구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
	}//insertBoard()
	
	public List getBoardList(int startRow, int pageSize) {
		List boardList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			// re_ref 를 기준으로 내림 차순 - 최근글 맨처음 보이게한 다음
			// limit 시작행-1 부터, 몇개 글 가져오기
			String sql = "select * from board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);	// 시작하는 행은 포함을 안함(2번 행부터 가져옴)
			pstmt.setInt(2, pageSize);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				boardList.add(bb);
			}
			//sql 구문 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
		return boardList;
	} //getBoardList()
	
	public int getBoardCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = Integer.parseInt(rs.getString("count(*)"));
			}
			//sql 구문 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
		return count;
	}
	
	//조회수 증가 함수
	public void updateReadCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update board set readcount = (readcount + 1) where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
	}
	//게시글 가져오기

	public BoardBean getBoard(int num) {
		BoardBean bb = new BoardBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
		return bb;
	}//getBoard()
	
	public int updateBoard(BoardBean bb) {
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select *from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				String passdb = rs.getString("pass");
				if(passdb.equals(bb.getPass())){
					sql = "update board set name=?, subject=?, content=? where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getNum());
					pstmt.executeUpdate();
					check = 1;
				} else {
					check = 0;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
		return check;
	}//updateBoard()
	
	public int deleteBoard(BoardBean bb) {
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select *from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				String passdb = rs.getString("pass");
				if(passdb.equals(bb.getPass())){
					sql = "delete from board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					pstmt.executeUpdate();
					check = 1;
				} else {
					check = 0;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(con != null) try {con.close();} catch (SQLException e) {}
		}
		return check;
	}//deleteBoard()
	
}




































