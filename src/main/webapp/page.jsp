<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인 페이지</title>
		<link rel="stylesheet" href="css/pagestyle.css">	
	</head>
	
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String url = "jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			String sql = "select b.b_no,im.i_name,b.b_title,b.b_price,b.b_trnc,b.b_joindate from board b,img im where b.b_no = im.b_no order by b_joindate DESC;";
			String preb_no = null; 
			String user = (String)session.getAttribute("user");
			String grade = (String)session.getAttribute("grade");
			String nickname = (String)session.getAttribute("nickname");
			
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				int k = 0;
				
		%>
		<div id="warp">
		
            <div id="box">
                <header>
					<a href="page.jsp" id="logo"><img src="image/logoblack.jpg" alt="로고" class="logo"></a>
                    <div id="box1">
						 
                                        
        <% 
        				if(user == null){
        					
        %>           
                        <div class="SignUp"><a href="log/signUp.jsp">회원가입</a></div>
                        <div class="login"><a href="log/loginform.jsp">로그인</a></div>
        <%
        				}else  if(user != null && grade != null && grade.equals("1")){ 
        %>	
						<div class="SignUp"><a href ="log/logout.jsp">로그 아웃</a></div>     
						<div class="login"><%=session.getAttribute("nickname")%>님 <br>환영합니다.</div>   
        <%
        				}else if(user != null && grade != null && grade.equals("2")){
        					
        %>
						<div class="member"><a href ="user/user.jsp">회원 조회/수정</a></div>
						<div class="SignUp"><a href ="log/logout.jsp">로그 아웃</a></div>     
						<div class="login"><%=session.getAttribute("nickname")%>님 환영합니다.</div>   
        <%
        				}
        %>
     
                        <div class="search">
                            <form action="search.jsp" method="post">
                                <select name="option">
                                    <option value ="b_title">제목</option>
                                    <option value="b_text">내용</option>
                                </select>
                                <input type="text" name ="search" placeholder="검색어" id="b">
                                <input type="submit" value="검색" id="A">
                            </form>
                        </div>
                  </div>
                  
                        <div id="menu">
                            <ul class="mainmenu">
                                <li><a href="board/t_board.jsp">거래게시판</a></li>
                                <li><a href="board/f_board.jsp">자유게시판</a></li>
                                <li><a href="board/a_board.jsp">공지사항</a></li>
                                <li><a href="user/mypage.jsp">마이페이지</a></li>
                                <li><a href="board/b_inputform.jsp">글쓰기</a></li>
                            </ul>
                        </div>
                   
                </header>
                <div>
                <h1>최신 물품</h1>
		<% 
				while(rs.next()){
					String b_no = rs.getString("b.b_no");
					String i_name = rs.getString("im.i_name");
					String title = rs.getString("b_title");
					String price = rs.getString("b.b_price");
					String trnc = rs.getString("b.b_trnc");
					if(preb_no != null && b_no.equals(preb_no)){
						continue;
					}else{
						preb_no = b_no;
					}
					
		%>
					<div class="box3">
					
                        <ul>
        <%
						if(k < 9){
        %>                 
                            <li class="img"><a href = "board/b_detail.jsp?b_no=<%=b_no%>"> 
                            <img src="image/<%=i_name %>" alt="<%=i_name%>"></a></li>
        <%
        					if(trnc.equals("1")){
        %>                    
                            <li class="check">거래 상태 : 거래중</li>
        <% 
        					}else{
        %>
                            <li class="check">거래 상태 : 거래완료</li>
        <%
        					}
        %>
                            <li class="name">제목 : <%=title %></li>
                            <li class="tags"><span>가격 : <%=price%>원</span></li>
                        </ul>
        				<input type ="hidden" value = "<%=b_no%>">
                    </div> <!-- box3 -->
        <% 
						}
        
        %>            
       
		
		<% 		
				     k++;
				}
				
					
			}catch(Exception e){
				System.out.println("접속 중 오류발생 : " + e);
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null)stmt.close();
					if(conn != null) conn.close();
				}catch(Exception ex){
					System.out.println("접속 해제 중 오류 발생: " + ex);
				}
			}
		%>
		
             	 </div>  
            </div> <!-- box -->        
        </div> <!-- wrap -->
	</body>
</html>