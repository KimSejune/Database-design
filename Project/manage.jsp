<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
			<link rel="stylesheet" type="text/css" href="vcen2.css">
		<title>manage</title>
	</head>
	<body class="vertical-container">

<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("µå¶óÀÌ¹ö ·Îµù ½ÇÆÐ");
	}		
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userId = "exam_b";
		String userPass = "delab";			
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
	
%>	<div class="manageForm">
		<button onclick="location.href='manage_1.jsp'" class="manageBtn">직원 관리</button>
		<button onclick="location.href='manage_2.jsp'" class="projectBtn">프로젝트 관리</button>
		<button onclick="location.href='login.jsp'" class="backBtn">뒤로가기</button>
	</div>

<%
	}catch(Exception e){			
		String err =e.getMessage().replaceAll("\""," ").replaceAll("\n"," ");
		out.println(err);				
		out.println(" <br><script> alert('"+ err +"'); history.back(); </script>");
		
	} finally {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException sqle) {
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException sqle) {
			}
		}
	}
%>

	</body>
</html>
