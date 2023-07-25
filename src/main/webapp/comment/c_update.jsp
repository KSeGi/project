<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>   
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 수정</title>
	</head>
	<body>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			String url = "jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			String sql = "update comment set c_text = ? where c_no = ?";
			
			request.setCharacterEncoding("utf-8");
			String ct = request.getParameter("ct");
			String c_no = request.getParameter("c_no");
			String b_no = request.getParameter("b_no");
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,ct);
				pstmt.setString(2, c_no);
				pstmt.execute();
				response.sendRedirect("../board/b_detail.jsp?b_no="+b_no);				
			}catch(Exception e){
				System.out.println("접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){
					System.out.println("접속 해제 중 오류 발생 : " + e);
				}
			}
			
			
		
		%>
		
	
	
	
	</body>
</html>