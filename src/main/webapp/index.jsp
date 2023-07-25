<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>메인</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    	<%
    		if(session.getAttribute("user") != null){
    			response.sendRedirect("page.jsp");
    		}
    	
    		
    	
    	%>
        <div id ="top"></div>
        <div id="warp">
            <div id="box">  
                <div class="mainimg">
                    <span>버려진 값진 물건을 얻을 수 있는 곳</span>
                    <img src="image/logoblack.jpg" alt="로고">
                    <span>방문을 환영합니다</span>
                </div>
                <div>
                    <div class="login">
                        <ul>
                            <li><a href="log/loginform.jsp">로그인</a></li>
                            <li><a href="log/signUp.jsp">회원가입</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>