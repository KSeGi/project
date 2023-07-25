<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색 결과</title>
		<style>
			#wrap{
				width:1000px;
				margin: 200px auto;
			}
			ul{
				list-style: none;
				text-decoration: none;
			}
			
			li{
				border:1px solid black;
				width:200px;
				text-align: center;
				font-weight: normal;
				line-height:25px;
				float:left; 
			}
			
			
			ul:last-child:after{
				content:"";
				display:block;
				clear:both
			}			
			
		
		</style>
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
			String option = request.getParameter("option");
			String search = request.getParameter("search");
			String sql = null;
			int i = 1;
			switch(option){
				case "b_title":
					sql = "select*from board where "+option+" like '%"+search+"%' ;"; 
					break;
				case "b_text":
					sql = "select*from board where "+option+" like '%"+search+"%' ;"; 
					 break;
				default:
					break;
			}
			
			
			try{			
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
		%>		
			<div id ="wrap">
			
			<div class ="b_list">
				<ul>
					<li>게시글 번호</li>
					<li>제목</li>
					<li>내용</li>
					<li>조회수</li>
				</ul>
		<% 		
				while(rs.next()){
					String b_title = rs.getString("b_title");
					String b_trnc = rs.getString("b_trnc");
					String b_price = rs.getString("b_price");
					String b_category = rs.getString("b_category");
					String b_text = rs.getString("b_text");
					String b_hit = rs.getString("b_hit");
		%>	
					<ul>
							<li><%=i++ %></li>
							<li><%=b_title%></li>
		<% 
					if(b_text.length() > 13){
		%>
							<li><%=b_text.substring(0,13)%></li>
		<%
					}else{
		%>
							<li><%=b_text%>	
		<%
					}
		%>
							<li><%=b_hit%></li>
					</ul>
		<% 		
				}
		%>
				</div>								
			</div>	
		<% 	
			}catch(Exception e){
				System.out.println("접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}catch(Exception ex){
					System.out.println("접속 해제 중 오류 발생 : " + ex);
				}
			}
			
			
		
		%>
		
		
		
		
	</body>
</html>