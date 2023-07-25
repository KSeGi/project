<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	<body>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";
	
	request.setCharacterEncoding("utf-8");
	String id =request.getParameter("uid");
	String pw =request.getParameter("upw");
	
	String sql = "select*from user where u_id = '"+ id +"'and u_pw = '"+pw+"';";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		out.println("<script>");
		if(rs.next()){
			String u_no = rs.getString("u_no");
			String u_nickname = rs.getString("u_nickname");
			id = rs.getString("u_id");
			pw = rs.getString("u_pw");
			String u_grade = rs.getString("u_grade");
			session.setAttribute("user", u_no);
			session.setAttribute("nickname", u_nickname);
			session.setAttribute("grade",u_grade);
//			session.setMaxInactiveInterval(60*5);
			out.print("alert('로그인 성공');");
			out.print("location.href='../page.jsp';");
			}else{
				out.println("alert('계정 정보가 다릅니다.');");
				out.println("location.href='loginform.jsp';");
			}
			out.println("</script>");
	}catch(Exception e){
		System.out.println("접속중 오류 발생 : " + e);
	}finally{
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception ex){
			System.out.println("접속해제 중 오류 발생 : " + ex);
		}
	}
%>
	</body>
</html>
