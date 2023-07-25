<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래 게시판</title>
		<link rel="stylesheet" href="../css/t_boardstyle.css" type="text/css">
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url ="jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			String sql = "select*from board inner join user on board.u_no = user.u_no where b_category = 'A' order by b_no desc;";	
			int i = 1;
			
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
		%>
				<div id="wrap">
				 <div id="menu">
				 	<ul class="mainmenu">
				 		<li><a href="../page.jsp"><img src="../image/logo.jpg" alt="로고" class="logo"></a></li>
                        <li><a href="../board/t_board.jsp">거래게시판</a></li>
                        <li><a href="../board/f_board.jsp">자유게시판</a></li>
                        <li><a href="../board/a_board.jsp">공지사항</a></li>
                        <li><a href="../user/mypage.jsp">마이페이지</a></li>
                        <li><a href="../board/b_inputform.jsp">글쓰기</a></li>
                    </ul>
                 </div>
                 
				<h1>거래게시판</h1>
					<div id ="t_boardlist">
						<ul id="top">
							<li class="no">번호</li>
							<li class="title">제목</li>
							<li class="trnc">상태 </li>
							<li class="nk">작성자</li>
							<li class="date">작성 날짜</li>
							<li class="hit">조회수</li>
						</ul>
		<% 		
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					String b_no = rs.getString("b_no");
					String b_title = rs.getString("b_title");
					String b_trnc = rs.getString("b_trnc");
					String u_nk = rs.getString("u_nickname");
					String b_price =rs.getString("b_price");
					String b_joindate = rs.getString("b_joindate");
					String b_hit = rs.getString("b_hit");
					
		%>
				<ul>
					<li class="no"><%=b_no %></li>
					<a href="b_detail.jsp?b_no=<%=b_no %>">
					<li class="title"><%=b_title %></li>
					</a>
					
		<%
					if(b_trnc.equals("1")){
						
		%>
					<li class="trnc">거래중</li>
		<% 
					}else{
						
		%>	
					<li class="trnc">거래완료</li>
		<%
					}
		
		%>
					<li class="nk"><%=u_nk %></li>
					<li class="date"><%=b_joindate %></li>
					<li class="hit"><%=b_hit %></li>
				</ul>
		
					
		<% 			
				i++;
				}
		%>
					</div>
					
				<ul class="page">
					<li><a class="pprev" href="1"><<</a></li>
					<li><a class="prev" href="2"><</a></li>
					<li><a href="#">1</a></li>
					<li><a href="1">2</a></li>
					<li><a href="2">3</a></li>
					<li><a href="3">4</a></li>
					<li><a href="4">5</a></li>
					<li><a class="next" href="5">></a></li>
					<li><a class="nnext" href="6">>></a></li>
				</ul>

				</div>
				
				
				
		<%		
			}catch(Exception e){
				System.out.println("접속 중 오류 발생 :"+ e);
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