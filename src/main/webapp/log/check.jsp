<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";
		
	String u_id = request.getParameter("u_id");
	
	String sql = "select*from user where u_id = '"+u_id+"';";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			response.sendRedirect("signUp.jsp");			
		}else{
			response.sendRedirect("signUp.jsp?u_id="+u_id);			
		}
		
		
	}catch(Exception e){
		System.out.println("접속 중 오류 발생: " + e);
	}finally{
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			System.out.println("접속 해제 중 오류 발생 : " + e);
		}
	}

%>
