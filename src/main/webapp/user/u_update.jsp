<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
		<link rel="stylesheet" href="../css/u_update.css">
	</head>
	<body>
		<% 
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		request.setCharacterEncoding("utf-8");
		String u_no = request.getParameter("u_no");
		
		String url = "jdbc:mysql://localhost:3306/iot";
		String db_id = "root";
		String db_pw = "1234";
		String sql = "select*from user where u_no ="+u_no+";";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url,db_id,db_pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	%>
		 <div id = "wrap">
		 	<h1>내 정보 수정</h1>
	<%
			if(rs.next()){
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
				<form action="u_updateaction.jsp" method="post">
	<%
					if(grade.equals("2")){
						
	%>											
					<span>회원 번호:</span><input type="text" name = "u_no" value="<%=u_no %>" readonly>
					<span>등급:</span><input type="text" name = "u_grade" value=<%=grade %> required>
					<span>ID</span><input type="text" name = "u_id" id ="u_id" value="<%=id %>" readonly >
					<span>PW</span><input type="text" name = "u_pw" value=<%=pw %> required >
					<span>이름</span><input type="text" name = "u_nm" value=<%=name %> required >
					<span>닉네임</span><input type="text" name = "u_nk" value=<%=nk %> required >
					<span>Email</span><input type="text" name = "u_em" value=<%=em %> required >
					<span>연락처</span><input type="text" name = "u_tel" value=<%=tel %> required >
					<span>주소</span><input type="text" name = "u_ad" value=<%=ad %> required >
					<span>가입날짜</span><input type="text" name = "u_join" id ="u_join" value=<%=join %> readonly>
					<input type="submit" value="수정하기" class="btn"> 
					<input type="reset" value ="다시쓰기" class="btn">
	<%
					}else{
	%>				
					<input type="hidden" name = "u_no" value="<%=u_no %>" readonly>
					<input type="hidden" name = "u_grade" value=<%=grade %> required>
					<span>ID</span><input type="text" name = "u_id" id ="u_id" value="<%=id %>" readonly >
					<span>PW</span><input type="text" name = "u_pw" value=<%=pw %> required >
					<span>이름</span><input type="text" name = "u_nm" value=<%=name %> required >
					<span>닉네임</span><input type="text" name = "u_nk" value=<%=nk %> required >
					<span>Email</span><input type="text" name = "u_em" value=<%=em %> required >
					<span>연락처</span><input type="text" name = "u_tel" value=<%=tel %> required >
					<span>주소</span><input type="text" name = "u_ad" value=<%=ad %> required >
					<span>가입날짜</span><input type="text" name = "u_join" id ="u_join" value=<%=join %> readonly>
					<input type="submit" value="수정하기" class="btn"> 
					<input type="reset" value ="다시쓰기" class="btn">
				</form>	
	
	<%		
					}
			}
 	%>
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