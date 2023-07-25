<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%
	Connection conn = null;
	Statement stmt = null;
	
	String db_id = "root";
	String db_pw = "1234";
	String url = "jdbc:mysql://localhost:3306/iot";
	
	request.setCharacterEncoding("utf-8");
	String b_no = request.getParameter("b_no"); 
	String c_no = request.getParameter("c_no"); 
	String c_text = request.getParameter("c_text");
	String u_no = (String)session.getAttribute("user");
	String sql = "insert into comment(b_no,u_no,c_text) values("+b_no+", "+u_no+", '"+c_text+"');";

			
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		stmt = conn.createStatement();
		if(c_text == ""){
			out.println("<script>");	
			out.println("alert('내용을 입력하세요');");	
			out.println("history.back();");	
			out.println("</script>");	
		}else{
			stmt.execute(sql);
			response.sendRedirect("../board/b_detail.jsp?b_no="+b_no);
		}
		
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