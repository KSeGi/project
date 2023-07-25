<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			
			String url = "jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			request.setCharacterEncoding("utf-8");
			String u_no = request.getParameter("u_no");
			String u_id = request.getParameter("u_id");
			String u_pw = request.getParameter("u_pw");
			String u_nm = request.getParameter("u_nm");
			String u_nk = request.getParameter("u_nk");
			String u_em = request.getParameter("u_em");
			String u_tel = request.getParameter("u_tel");
			String u_ad = request.getParameter("u_ad");
			String u_grade = (String)(session.getAttribute("grade"));
			
			
			String sql = "update user set u_id='"+u_id+"',u_pw ='"+u_pw+"',u_name ='"+u_nm+"',";
				   sql += "u_nickname ='"+u_nk+"', u_email ='"+u_em+"', u_tel='"+u_tel+"', u_address='"+u_ad+"',u_grade='"+u_grade+"'";	
				   sql += "where u_no ="+u_no+";";	
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				if(u_grade.equals("1")){
					response.sendRedirect("mypage.jsp");
				}else if(u_grade.equals("2")){
					response.sendRedirect("user.jsp");
				}
			}catch (Exception e){
				System.out.println("접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
 				}catch(Exception ex){
					System.out.println("접속 해제 중 오류 발생 : " + ex);
				}
			}
			
			
		%>
	
	
	
	
	
	
	
	</body>
</html>