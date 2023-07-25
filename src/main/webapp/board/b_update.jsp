<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수정하기</title>
		<link rel="stylesheet" href="../css/b_update.css" type="text/css">
	</head>
	<body>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			request.setCharacterEncoding("utf-8");
			String b_no = request.getParameter("b_no");

			String url = "jdbc:mysql://localhost:3306/iot";
			String db_id = "root";
			String db_pw = "1234";
			
			String sql = "select*from board left outer join img on board.b_no = img.b_no and img.b_no =";
				   sql += b_no+" where board.b_no ="+b_no+";";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url,db_id,db_pw);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
			
		%>
					<div id = "wrap">
					<form action="b_updateaction.jsp" method="post" name="updateform">
					
						<label class="file1-button" for="file1">
						<img alt="카메라" src="../image/camara.jpg">
						</label>
							<input type ="file" name="file1" id="file1" class="file" onchange="imageChange(event);">
						<label class="file2-button" for="file2">
							<img alt="카메라" src="../image/camara.jpg">
						</label>
							<input type ="file" name="file2" id="file2" class="file"  onchange="imageChange2(event);">
						<label class="file1-button" for="file3">
							<img alt="카메라" src="../image/camara.jpg">
						</label>
							<input type ="file" name="file3" id="file3" class="file"  onchange="imageChange3(event);">
						
						 <br>
						 
						 <div id="imageContainer" class="container"></div>
						 <div id="imageContainer2" class="container"></div>
						 <div id="imageContainer3" class="container"></div>
						 
						 <br>
			<% 			 
				if(rs.next()){
					String b_title = rs.getString("b_title");
					String b_price = rs.getString("b_price");
					String b_trnc = rs.getString("b_trnc");
					String b_text = rs.getString("b_text");
					String b_category = rs.getString("b_category");
					String i_name = rs.getString("i_name");
					if(b_category.equals("A")){
			%>			
						<span>제목</span>
						<select name = "b_trnc">
									<option  value = "1" selected>거래중</option>
									<option value = "2">거래완료</option>
								</select><br>
						<input type="text" name = "b_title" class="title" value="<%=b_title%>"><br>
			
								
						<span>가격</span><input type="text" name = "b_price" class="price" value = "<%=b_price%>"><br>
						
						<textarea cols="50" name = "b_text" class="text" rows="8"><%=b_text%></textarea>
						<input type="submit" value = "수정">
					</form>
					 </div>	
		<%					
					}else{
		%>
					<div id = "wrap">
					<form action="b_updateaction.jsp" method="post" name="updateform">
					<span>제목 :</span><input type="text" name = "b_title" value="<%=b_title%>"><br>
					<textarea cols="50" name = "b_text" class="text" rows="8"><%=b_text%></textarea>
					<input type="submit" value = "수정">
					</form>
					</div>
	
		<% 				
					}
				}
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
		
	
	<script>
	//줄바꿈 처리
	function strReplace(subject, search, replace) {
	    return subject.split(search).join(replace);
	};
	 
	document.updateform.content.value = strReplace(document.form.b_text.value , '\n', '');
	 
	document.updateform.submit();
	
	
	//img미리보기
		function imageChange(event){
	        let img = document.createElement("img");
	        const reader = new FileReader();
	        reader.onload = function(event){
	            img.setAttribute("src", event.target.result);
	        }
	        reader.readAsDataURL(event.target.files[0]);  
	        document.querySelector("#imageContainer").appendChild(img);
		}
		function imageChange2(event){
	        let img = document.createElement("img");
	        const reader = new FileReader();
	        reader.onload = function(event){
	            img.setAttribute("src", event.target.result);
	        }
	        reader.readAsDataURL(event.target.files[0]);  
	        document.querySelector("#imageContainer2").appendChild(img);
		}
		function imageChange3(event){
	        let img = document.createElement("img");
	        const reader = new FileReader();
	        reader.onload = function(event){
	            img.setAttribute("src", event.target.result);
	        }
	        reader.readAsDataURL(event.target.files[0]);  
	        document.querySelector("#imageContainer3").appendChild(img);
		}
	</script>
	
	
	
	</body>
</html>