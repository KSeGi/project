<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 페이지</title>
		<link rel="stylesheet" href="../css/signup.css">
		<%--  <script src="js/signup.js"></script> --%>
	</head>
	<body>
		  <div id="wrap">
            <img src="../image/logo_remove.png" alt="로고">
            <form action="../user/u_insert.jsp" method="post">
                <div id="main">
                    <div class="sign">
                        <span class="required">아이디</span>
                        	<input type="text" id="u_id" name="u_id" placeholder="아이디 입력해주세요(4~10자)" required>
                        	<input type="hidden" name="comfirm" id = "cf" value = "">
                    	<!-- <button>중복 검사</button>-->
                    </div>
                    <div class="sign">
                        <span class="required">비밀번호</span>
                        <input type="password" id="u_pw" name="u_pw" placeholder="비밀번호 입력해주세요" required>
                    </div>
                    <div class="sign">
                        <span>이름</span>
                        <input type="text" id="u_name" name="u_name" placeholder="이름을 입력해주세요">
                    </div>
                    <div class="sign">
                        <span>닉네임</span>
                        <input type="text" id="u_nnm" name = "u_nnm" placeholder="닉네임을 입력해주세요">
                    </div>
                    <div class="sign">
                        <span>전화번호</span>
                        <input type="tel" id="u_tel" name="u_tel" pattern="(010|016|017|){3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000">
                    </div>
                    <div class="sign">
                        <span>이메일</span>
                        <input type="email" id="u_email" name = "u_email" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="sign">
                        <span>주소</span>
                        <input type="text" id="u_address" name = "u_address" placeholder="주소를 입력해주세요">
                    </div>
                </div>
                    <input type="submit" value="가입하기" class="btn" id="su">
                    <input type="reset" value="가입취소" class="btn">
            </form>
        </div>
	</body>
		<script>
			var btn = document.getElementsByTagName("button")[0];
			
			
			btn.addEventListener("click",function check(){
				var uid = document.getElementById("u_id").value;
				if(uid.trim() === "" ){
					alert("아이디를 입력해주세요");
				}else{
					location.href="check.jsp?u_id="+uid;
				}
			});
			
			
		
		
		</script>
	
	
	
	
</html>