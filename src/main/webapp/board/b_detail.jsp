<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세 페이지</title>
		<link rel="stylesheet" href="../css/b_detail.css" type="text/css">
	</head>
	<body>
		<%
		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			request.setCharacterEncoding("utf-8");
			ArrayList<String> iarray = new ArrayList<String>();
			int a = 0;
			int i = 0; // 댓글 수
			int fn = 0; // form택 번호
			String b_no = request.getParameter("b_no");
			
			String su_no = (String)session.getAttribute("user");
			String u_no = null;
			String grade = (String)session.getAttribute("grade");
			
			String url = "jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			String driver = "com.mysql.cj.jdbc.Driver";
			String sql = "select*from board left outer join img on board.b_no =";
				   sql+=  "img.b_no left outer join user on board.u_no =";
				   sql+= "user.u_no where board.b_no =" +b_no+";";
			try{
				Class.forName(driver);
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);					
%>
				<div id = "wrap">
<% 				
				while(rs.next()){
					iarray.add(rs.getString("i_name"));
				}
				if(rs != null) rs.close();
				
				rs = stmt.executeQuery(sql);



				while(rs.next()){
					u_no = rs.getString("u_no");
					b_no = rs.getString("b_no");
					String b_title = rs.getString("b_title");
					String u_nickname = rs.getString("u_nickname");
					String b_price = rs.getString("b_price");
					String b_category = rs.getString("b_category");
					String b_text = rs.getString("b_text");
					String b_trnc = rs.getString("b_trnc");
					String b_joindate = rs.getString("b_joindate");
					String i_name = rs.getString("i_name");
					
					if(b_category.equals("A")){
%>
							<div><img alt="<%=i_name%>" src="../image/<%=i_name %>"></div>
<%
							if(a<iarray.size()-1){
								a++;
								continue;
							}
							if(b_trnc.equals("1")){
								b_trnc="거래중";
							}else{b_trnc="거래완료";}
%>
							<div class="detail">
								<div class="title">
									<%=b_title %>
									
									<span class="nk"><%=u_nickname %></span>
									
									<span class="trnc"><%=b_trnc%></span>
								</div>
								<div class="date"><%=b_joindate %></div>
								<div class="price"><%=b_price %>원</div>
								<div class="text"><%=b_text %></div>
							</div>

<% 							
						System.out.println(a);
					}else{
%>
						<div class="detail">
							<div class="title"><%=b_title %></div>
							<div class="text"><%=b_text %></div>
						</div>
<%											
					}
				}// while
				
				if(su_no.equals(u_no)){
%>
				<div id="upde">
					<form action="b_update.jsp" method ="get">
						<input type="submit" value="수정하기">
						<input type="hidden" name="b_no" value ="<%=b_no%>">
					</form>
	
					<form action="b_delete.jsp" method ="post">
						<input type="submit" value="삭제하기">
						<input type="hidden" name= "b_no" value ="<%=b_no%>">
					</form>
				</div>
<% 
				}

			if(rs != null) rs.close();

			sql = "select*from comment c, User u where c.u_no = u.u_no and c.b_no = "+b_no+" order by c_joindate desc;";
			rs = stmt.executeQuery(sql);
	
%>
			
		</div>
<%
		
		while(rs.next()){
		i++;
		}
%>
		<div class="comment">
			<h2>댓글<span id="count"><%=i%></span></h2>

			<form action="../comment/c_insert.jsp" method="post" id="comment">
			<input type="text" name = "c_text" class="ctext" placeholder="댓글을 입력해주세요">	
			<input type="hidden" name = "b_no" value="<%=b_no%>">
			<input type="submit" class ="c_input" value="작성">
			</form>
			
		
<% 			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String c_no = rs.getString("c_no");
				u_no = rs.getString("u_no");
				b_no = rs.getString("b_no");
				String c_text = rs.getString("c_text");
				String c_joindate = rs.getString("c_joindate");	
				String u_nickname = rs.getString("u_nickname");
				if(su_no.equals(u_no)|| grade.equals("2")){
%>
			
			<div class="cm">
				<p><%=u_nickname %></p>
					<form action="../comment/c_update.jsp" method="post" name="frm<%=fn%>">
			<ul>
				<li class="c_text">
					<input type="text" disabled='disabled' class="ct" value="<%=c_text %>" name="ct">
				</li>
				<li class="c_date"><%=c_joindate %></li>
						<li>
						<input type="hidden" name = "c_no" value="<%=c_no%>">
						<input type="hidden" name = "b_no" value="<%=b_no%>">
						<input type="button" value="수정" class="btn" onclick="update(<%=fn%>)">
						</li>
			</ul>
					</form>

				
					<form action="../comment/c_delete.jsp" method="post">
						<input type="hidden" name = "c_no" value="<%=c_no%>">
						<input type="hidden" name = "b_no" value="<%=b_no%>">
						<input type="submit" class="btn" value="삭제">
					</form>
			</div>		
					
							
<% 
			}else{
%>			
			<div class = "cm">	
				<p><%=u_nickname %></p>
					<form action="../comment/c_update.jsp" method="post" name="frm<%=fn%>">
			<ul>
				<li class="c_text">
					<input type="text" disabled='disabled' class="ct" value="<%=c_text %>" name="ct">
				</li>
				<li class="c_date"><%=c_joindate %></li>
						<li>
						<input type="hidden" name = "c_no" value="<%=c_no%>">
						<input type="hidden" name = "b_no" value="<%=b_no%>">
						<input type="hidden" value="수정" class="btn" onclick="update(<%=fn%>)">
						</li>
			</ul>
					</form>

				
					<form action="../comment/c_delete.jsp" method="post">
						<input type="hidden" name = "c_no" value="<%=c_no%>">
						<input type="hidden" name = "b_no" value="<%=b_no%>">
						<input type="hidden" class="btn" value="삭제">
					</form>
					
			</div>

		
<% 			
			} //if 끝
		fn++;
		}//while 끝
%>
		</div> 
<%
				
			}catch(Exception e){
				System.out.println("접속 중 오류 발생 : " + e);
			}finally{
				try{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}catch(Exception e){
					System.out.println("접속 해제 중 오류 방생 : " + e);
				}
			}
		
		
		%>
		<script>
			var i = <%=i%>;
			var btn = new Array();
			var c_target = new Array(); 
			var frm = new Array();
				for(var j = 0; j<i; j++){
					frm[j] = document.querySelectorAll("form[name ^= 'frm']")[j];
					btn[j] = frm[j].getElementsByTagName("input")[3];
					c_target[j] = document.getElementsByClassName("ct")[j];
				   	  btn[j].addEventListener("click", (function(j) {
				      return function() {
				        update(j);
				      };
				    })(j));
				}
		 	function update(s){
				c_target[s].disabled=false;
				btn[s].value="완료";
				btn[s].addEventListener("click",function(){
						sub(s);
				});
			}
		 
			
			function sub(j){
				frm[j].submit();
			}
		</script>
	</body>
</html>