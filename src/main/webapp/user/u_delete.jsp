<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";
	
	request.setCharacterEncoding("utf-8");
	String u_no = request.getParameter("u_no");
	String sql = "delete from user where u_no ="+u_no+";";
	String user = (String)session.getAttribute("user");
	String grade = (String)session.getAttribute("grade");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		if(user != null && grade.equals("1") ){
			response.sendRedirect("../index.jsp");
			session.invalidate();
		}else if(user != null && grade.equals("2")){
			response.sendRedirect("user.jsp");
		}
	}catch(Exception e){
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


