<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*" %>
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	
	
	String url = "jdbc:mysql://localhost:3306/iot";
	String db_id = "root";
	String db_pw = "1234";
	
	request.setCharacterEncoding("utf-8");

	String category = request.getParameter("b_category");
	String title = request.getParameter("b_title");
	String price = request.getParameter("b_price");
	String text = request.getParameter("b_text");
	String u_no = (String)session.getAttribute("user");
	String path = "/Users/gimdong-gyu/kim/eclipse/Iot/src/main/webapp/image";
	int size = 10*1024*1024;
	
	String sql = null;
	String sql2 = null;
	String b_no = null;
	switch(category){
		case "A":
			sql = "insert into board(u_no,b_title,b_trnc,b_price,b_category,b_text) ";
			sql += "values('"+u_no+"','"+title+"','1','"+price+"','"+category+"','"+text+"');";
			break;
		case "B":
			sql = "insert into board(u_no,b_title,b_category,b_text) ";
			sql += "values('"+u_no+"','"+title+"','"+category+"','"+text+"');";
			break;
		case "C":
			sql = "insert into board(u_no,b_title,b_category,b_text) ";
			sql += "values('"+u_no+"','"+title+"','"+category+"','"+text+"');";
			break;
	}
	
	
	
	
	
	
	try{
		conn = DriverManager.getConnection(url,db_id,db_pw);
		if(category.equals("A")){
			sql2 = "insert into img(b_no,i_name) value(?,?)";
			stmt = conn.createStatement();
			stmt.execute(sql);
			sql = "select*form board order by b_no";
			if(stmt != null) stmt.close();
			stmt =  conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			
			while(rs.next()){
				b_no = rs.getString(b_no);
			}
			
			
			
			MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());		
			StringBuffer sb = new StringBuffer();
			@SuppressWarnings("unchecked")
			Enumeration<String> files = mr.getFileNames();
			while(files.hasMoreElements()){
				String f = files.nextElement();
				String name = mr.getFilesystemName(f);
				sb.append(name).append(",");
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1,b_no);
			pstmt.setString(2,sb.toString());
			
			int result = pstmt.executeUpdate();
			
			if(result < 1){
				System.out.print("실행 실패");
				out.println("<script>");
				out.println("");
				out.println("</script>");
			}
			
			
			
		}else{
			
		}
		
		
		
	}catch(Exception e){
		System.out.println("접속 중 오류발생 : " + e);
		
	}finally{
		try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception ex){
			System.out.println("접속 해제 중 오류 발생 : " + ex);
		}
	}

%>   