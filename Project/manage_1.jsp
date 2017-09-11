<%@ page contentType="text/html; charset=utf-8" pageEncoding = "utf-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<link rel="stylesheet" type="text/css" href="vcen3.css">
		<title>직원 관리</title>
	</head>
	<body class="vertical-container">

		<div class="manageForm">
			<div class="box">
				<form action="manage_1_1.jsp" method="post">
				<input type="text" name="Employee_Name" class="iText" placeholder="Please Input Employee_Name"></p>		
				<button class="searchBtn">검색</button>
				</form>
				<span class="right"><a onclick="location.href='manage.jsp'">|뒤로가기|
			</div>
		</div>
	</body>
</html>
