<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이 페이지</title>
	<link rel="stylesheet" href="../css/u_mypage.css" type="text/css">
	</head>
	
	<body>
		
		<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String u_no = (String) session.getAttribute("user");
	
		String url = "jdbc:mysql://localhost:3306/iot";
		String db_id = "root";
		String db_pw = "1234";
		String sql = "select*from user where u_no ='" + u_no + "';";
		int i=1,j=1;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String u_id = rs.getString("u_id");
				String u_pw = rs.getString("u_pw");
				String u_name = rs.getString("u_name");
				String u_nickname = rs.getString("u_nickname");
				String u_email = rs.getString("u_email");
				String u_tell = rs.getString("u_tel");
				String u_address = rs.getString("u_address");
				String u_joindate = rs.getString("u_joindate");
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
           <!-- 상단바 -->
			<h1>My page</h1>
			<div class="tabs">
				<input id="info" type="radio" name="tab" checked>
				<label	class="tab" for="info">내 정보</label>
				<input id="board" type="radio" name="tab">
				<label class="tab" for="board">내가 쓴 글</label>
				<input id="comment" type="radio" name="tab">
				<label class="tab" for="comment">내가 쓴 댓글</label>
				
				<!-- my_info 시작 -->
				<div class="content" id="my_info">
					<div>
						<p class="first">ID</p><span class="first"><%=u_id%></span>
					</div>
					<div>
						<p>PW</p><span><%=u_pw%></span>
					</div>
					<div>
						<p>이름</p><span><%=u_name%></span>
					</div>
					<div>
						<p>닉네임</p><span><%=u_nickname%></span>
					</div>
					<div>
						<p>Email</p><span><%=u_email%></span>
					</div>
					<div>
						<p>전화번호</p><span><%=u_tell%></span>
					</div>
					<div>
						<p>주소</p><span><%=u_address%></span>
					</div>
					<div>
						<p>가입날짜</p><span><%=u_joindate%></span>
					</div>
					<form action="u_update.jsp" method="post">
						<input type="hidden" name="u_no" value="<%=u_no%>">
						<input type="submit" value="수정하기">
					</form>
						<form action="u_delete.jsp" method="post">
						<input type="hidden" name="u_no" value="<%=u_no%>">
						<input type="submit" value="탈퇴하기">
					</form>
				</div>
				<!-- my_info -->
				
				<%
					} //my_info 끝
		
					if (rs != null)
					rs.close();
		
					//my_board 시작
					sql = "select*from board where u_no = '" + u_no + "';";
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						String b_no = rs.getString("b_no");
						String b_title = rs.getString("b_title");
						String b_trnc = rs.getString("b_trnc");
							if(b_trnc == null){
								b_trnc="자유게시판";
							}else if(b_trnc.equals("1")){
								b_trnc="거래중";
							}else{b_trnc="거래완료";}
						String b_joindate = rs.getString("b_joindate");
						b_joindate = b_joindate.substring(0,10);
						String b_category = rs.getString("b_category");
						String b_hit = rs.getString("b_hit");
				%>
	
				<!-- my_board -->
				<div class="content" id="my_board">
				
				<%
				if(i <= 1){
				%>
					<ul class="list">
						<li class="no">번호</li>
						<li class="title">제목</li>
						<li class="trnc">거래유무</li>
						<li class="date">작성날짜</li>
						<li class="hit">조회수</li>
						<li class="update">수정</li>
					</ul>
				<%
					}
				%>	
					<ul>
						<li class="no"><span><%=i %></span></li>
						<a href="../board/b_detail.jsp?b_no=<%=b_no %>">
						<li class="title"><span><%=b_title%></span></li>
						</a>
						<li class="trnc"><span><%=b_trnc%></span></li>
						<li class="date"><span><%=b_joindate%></span></li>
						<li class="hit"><span><%=b_hit%></span></li>
						<li>
							<form action="../board/b_update.jsp" method="post">
								<input type="hidden" name = "b_no" value="<%=b_no%>">
								<input type="hidden" name = "b_no" value="<%=b_category%>">
								<input type="submit" value="수정하기">
							</form>
						</li>
					</ul>
				</div>
				<!-- my_board -->
	
				<%
					i++;
					}
			//my_board 끝
					
			
		
			//my_comment 시작
					sql = "select*from comment where u_no = '" + u_no + "';";
					rs = stmt.executeQuery(sql);
		
	
						while (rs.next()) {
							String b_no = rs.getString("b_no");
							String c_no = rs.getString("c_no");
							String c_text = rs.getString("c_text");
							String c_joindate = rs.getString("c_joindate");
							c_joindate = c_joindate.substring(0,10);
				%>
	<!-- my_comment-->
				<div class="content" id="my_comment">
				<%
					if(j<= 1){
				%>
					<ul class=list>
						<li class="no">번호</li>
						<li class="text">내용</li>
						<li class="date">작성날짜</li>
						<li class="update">수정</li>
					</ul>
				<%
					}
				%>	
					<ul>
						<li class="no"><span><%=j %></span></li>
						<a href="../board/b_detail.jsp?b_no=<%=b_no %>">
						<li class="text"><span><%=c_text %></span></li>
						</a>
						<li class="date"><span><%=c_joindate %></span></li>
						<li >
							<form action="#" method="post">
								<input type="hidden" name ="c_no" value="<%=c_no%>">
								<input type="submit" value="수정하기">
							</form>
						</li>
					</ul>
				</div>
		<!-- my_comment 끝-->

				<%
					j++;
					}	
				%>
			</div>
			<!-- taps 끝 -->
		</div>
		<!-- wrap -->
	
	
		<%
			} catch (Exception e) {
				System.out.println("접속 중 오류 발생 : " + e);
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (rs != null)
						rs.close();
				} catch (Exception ex) {
					System.out.println("접속 해제 중 오류 발생 : " + ex);
				}
			}
		%>
	
	</body>
</html>