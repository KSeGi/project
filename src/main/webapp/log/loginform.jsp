<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
		<link rel="stylesheet" href="../css/loginform.css" type="text/css">
	</head>
	
	<body>
		<%
			if(session.getAttribute("user") != null){
				response.sendRedirect("../page.jsp");
			}
		%>	
	
		<div id="wrap">
            <div id= "login">
				<form action="login.jsp" method="post">
	                <img src="../image/logoblack.jpg" alt="로고">
	                <fieldset>
	                    <legend>로그인</legend>
	                    <div id="id">
	                        <span>아이디 </span>
	                        <input type="text" name="uid">
	                    </div>
	                    <div id="pw">
	                        <span>비밀번호 </span>
	                        <input type="password" name="upw">
	                    </div>
	                    <div id="log">
	                        <input type="submit" value="로그인" class="lbtn">
	                        <a href="signUp.jsp">회원가입</a>
	                    </div>
	                </fieldset>
				</form>
            </div>
        </div>
	</body>
</html>