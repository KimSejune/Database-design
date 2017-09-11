<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	<link rel="stylesheet" type="text/css" href="vcen.css">
	<title>로그인 화면</title>
</head>
<body class="vertical-container">
	<%
	if(session.getAttribute("id")==null){
		%>
		<div class="loginForm">
			
				<form action="logincheck.jsp" method="post" class="box">
				<input class="iText" type="text" name="input_id"  placeholder="UserId">
				<input class="iText" type="password" name="input_pw"  placeholder="Password">
				<br>
				<button class="loginBtn">로그인</button>		 
				</form>
				<span class="right"><a onclick="location.href='register.jsp'">|회원가입|
		</div>
		<%		
	}else{

		%>
		<div class="loginForm">
			<form action="manage.jsp" method="post">
			<button class="manageBtn">경영진 화면</button>	
			<br>
			</form>
			<form action="logout.jsp" method="post" >
			<button class="logoutBtn">로그아웃</button>	
			</form>
			<button onclick="location.href='changeprofile.jsp'" class="changeBtn" >개인정보 변경</button>
			</div>
		<%
	}
%>


</body>
</html>