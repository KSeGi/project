<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";
	
	request.setCharacterEncoding("utf-8");
	
	
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	String u_nm = request.getParameter("u_name");
	String u_nk = request.getParameter("u_nnm");
	String u_em = request.getParameter("u_email");
	String u_tel = request.getParameter("u_tel");
	String u_ad = request.getParameter("u_address");
	
	String sql = "insert into user";
		   sql += "(u_id,u_pw,u_name,u_nickname,u_email,u_tel,u_address) values(";
		   sql += "'"+u_id+"','"+u_pw+"','"+u_nm+"','"+u_nk+"','"+u_em+"','"+u_tel+"','"+u_ad+"');";
		   
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		stmt = conn.createStatement();
		stmt.execute(sql);
		response.sendRedirect("../index.jsp");
	}catch(Exception e){
	 	System.out.println("접속 중 오류 발생 : " + e);
	}finally{
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception ex){
	 		System.out.println("접속 해제 오류 발생 : " + ex);
			
		}
	}
	


%>

