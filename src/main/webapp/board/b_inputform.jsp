<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 등록</title>
		<link rel="stylesheet" href="../css/b_inputform.css" type="text/css">
	</head>
	<body>
		<%
			String grade = (String)session.getAttribute("grade");		
		%>
		<div id ="wrap">
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
                 
                 
				<form action="b_insert.jsp" method="post" name="inputform">
					<div id = "category">
						<select name = "b_category" >
							<option value="A" selected >거래 게시판</option>
							<option value="B">자유 게시판</option>
							<%
							if(grade != null && grade.equals("2")){
							%>
								<option value ="C">공지 사항</option>
							<%
							}					
							%>
						</select>
					</div> <!-- category -->
					
					<div id = "content">
					<label class="file1-button" for="file1">
						<img alt="카메라" src="../image/camara.jpg" class="camara">
					</label>
						<input type ="file" name="file1" id="file1" class="file" onchange="imageChange(event);">
					<label class="file2-button" for="file2">
						<img alt="카메라" src="../image/camara.jpg" class="camara">
					</label>
						<input type ="file" name="file2" id="file2" class="file"  onchange="imageChange2(event);">
					<label class="file1-button" for="file3">
						<img alt="카메라" src="../image/camara.jpg" class="camara">
					</label>
						<input type ="file" name="file3" id="file3" class="file"  onchange="imageChange3(event);">
						
						 <br>
						 <div id="imageContainer" class="container"></div>
						 <div id="imageContainer2" class="container"></div>
						 <div id="imageContainer3" class="container"></div>
						 
						
						<input type="text" name = "b_title" class="title" placeholder="제목" >
						<input type="text" name = "b_price" class="price" placeholder="가격">
						
						
						<textarea cols="50" name = "b_text" class="text" rows="8">내용을 입력해 주세요.</textarea>
					</div>
					<div class="btn">
						<input type = "submit" value="등록하기">
						<input type = "reset" value="다시쓰기">
					</div>
					
					
			</form>
		</div>
		
		<script>
		var select = document.getElementsByName("b_category")[0];
		var price = document.getElementsByClassName("price");
		
		
		function change(){
			if(select.value === "B" || select.value === "C"){
				price[0].style.display = "none";
				price[1].style.display = "none";
			}else{
				price[0].style.display = "inline";
				price[1].style.display = "inline";
			}			
			
		}	

		select.addEventListener("change",change);
		
		
		//줄바꿈 처리
		function strReplace(subject, search, replace) {
		    return subject.split(search).join(replace);
		};
		 
		document.inputForm.content.value = strReplace(document.form.b_text.value , '\n', '');
		 
		document.inputForm.submit();
		
		
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