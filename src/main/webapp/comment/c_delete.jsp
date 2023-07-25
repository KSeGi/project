<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	Connection conn = null;
	Statement stmt = null;
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";

	
	String c_no = request.getParameter("c_no");
	String b_no = request.getParameter("b_no");
	
	
	String sql = "delete from comment where c_no = "+c_no+";";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	 	conn = DriverManager.getConnection(url,db_id,db_pw);
	 	stmt = conn.createStatement();
		stmt.executeUpdate(sql);		
		response.sendRedirect("../board/b_detail.jsp?b_no="+b_no);
		
		
		
	}catch(Exception e){
		System.out.println("접속 중 오류 발생 : " + e);
	}finally{
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			System.out.println("접속 해제 중 오류 발생 : " + e);		
			
		}
	}
	
	
	
	
	
		


%>