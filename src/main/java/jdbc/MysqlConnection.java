package jdbc;
import java.sql.*;
public class MysqlConnection {
	
	public static Connection connect() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/iot";
		String id = "root";
		String pw = "1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("연결 성공");
			
		}catch(Exception e){
			System.out.println("오류발생 : " + e);
		}
		return conn;
	}

	public static void close(Connection conn,PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			System.out.println("connection.close 에서 오류 발생 : " + e);
		}
	}

	public static void close(Connection conn,PreparedStatement pstmt,ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			System.out.println("connection.close 에서 오류 발생 : " + e);
		}
	}

}
