<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 조회</title>
		<style>
			#wrap{
				width: 1500px;
				margin: 100px auto;
			}
			
			table{
				border-spacing: 0;
			}	


			th,td {
				width:180px;
				border:1px solid black;
				text-align:center;
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
		String sql = "select*from user";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,db_id,db_pw);
			stmt = conn.createStatement();
		 	rs = stmt.executeQuery(sql);
	%>
		 <div id = "wrap">
			<table>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>주소</th>
					<th>등급</th>
					<th>가입날짜</th>
					<th>수정/삭제</th>
				</tr>	
	<%
			while(rs.next()){
				String no =rs.getString("u_no");
				String id =rs.getString("u_id");
				String pw =rs.getString("u_pw");
				String name = rs.getString("u_name");
				String nk =rs.getString("u_nickname");
				String em =rs.getString("u_email");
				String tel =rs.getString("u_tel");
				String ad =rs.getString("u_address");
				String grade =rs.getString("u_grade");
				String join =rs.getString("u_joindate");
	%>		
				<tr>
					<td><%=no %></td>
					<td><%=id %></td>
					<td><%=pw %></td>
					<td><%=name %></td>
					<td><%=nk %></td>
					<td><%=em %></td>
					<td><%=tel %></td>
					<td><%=ad %></td>
					<td><%=grade %></td>
					<td><%=join %></td>
					<td>
						<form action="u_update.jsp" method="post">
							<input type="hidden" name ="u_no" value="<%=no %>">
							<input type="submit" value="수정">
						</form>
						<form action="u_delete.jsp" method="post">
							<input type="hidden" name ="u_no" value="<%=no %>">
							<input type="submit" value="삭제">
						</form>
					</td>
				</tr>
	<%		
			}
 	%>
			</table>
		</div>	
	
	<%
		}catch(Exception e){
			System.out.println("접속 중 오류발생 : " + e);
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