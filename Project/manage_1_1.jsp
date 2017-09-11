<%@ page contentType="text/html; charset=utf-8" pageEncoding = "utf-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html> 
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="vcen4.css">
		<title>직원정보 확인</title>
	</head>
	<body class="vertical-container">


	<div class="manageForm">
		<table width="700" border="6">
			<tr>
				<th>Employee Number</th>
				<th>Id</th>
				<th>RRN</th>
				<th>phonenumber</th>
				<th>career</th>
				<th>Lastlevel</th>
				<th>Project Number</th>
				<th>Communication Score</th>
				<th>work Score</th>
			</tr>			


<%


		
request.setCharacterEncoding("utf-8");
String Employee_Name = request.getParameter("Employee_Name");


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}		
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userId = "system";
		String userPass = "delab2";			
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

		
		String sql = "SELECT E.Employee_Number, E.Employee_Id, E.Employee_RRN, E.Employee_Phonenumber, E.Employee_Career, E.Employee_Lastlevel,PE.Project_Number, PE.Communication_Score, PE.Work_Score FROM Employee E, Project_Evaluation PE WHERE E.Employee_Name = ? AND E.Employee_Number = PE.Employee_Number";     //sql문 수행
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Employee_Name);
		rs = pstmt.executeQuery();

		while(rs.next()){
			int Employee_Number = rs.getInt("Employee_Number");
			String Employee_Id = rs.getString("Employee_Id");
			String Employee_RRN = rs.getString("Employee_RRN");
			String Employee_Phonenumber = rs.getString("Employee_Phonenumber");
			String Employee_Career = rs.getString("Employee_Career");
			String Employee_Lastlevel = rs.getString("Employee_Lastlevel");
			int Project_Number = rs.getInt("Project_Number");
			int Communication_Score = rs.getInt("Communication_Score");
			int Work_Score = rs.getInt("Work_Score");

			
%>
			<tr>
				<td width="100"><%=Employee_Number%></td>
				<td width="100"><%=Employee_Id%></td>
				<td width="100"><%=Employee_RRN%></td>
				<td width="100"><%=Employee_Phonenumber%></td>
				<td width="100"><%=Employee_Career%></td>
				<td width="100"><%=Employee_Lastlevel%></td>
				<td width="100"><%=Project_Number%></td>
				<td width="100"><%=Communication_Score%></td>
				<td width="100"><%=Work_Score%></td>
			</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}		
		conn.close();
	}
%>
	</table>
	<button onclick="location.href='manage_1.jsp'" class="backBtn" >뒤로가기</button>

	</div>
</body>
</html>
