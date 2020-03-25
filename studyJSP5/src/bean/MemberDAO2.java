package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO2 {
	public void insertMember2(MemberBean2 mb) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
		String dbUser = "jspid";
		String dbPass = "jsppass";
		
		String name = mb.getName();
		String id = mb.getId();
		int age = mb.getAge();
		
		try {
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			String sql = "insert into member(name, id, age) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setInt(3, age);
			pstmt.executeUpdate();
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		
		
	}
}
