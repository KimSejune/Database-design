<%@ page contentType="text/html; charset=euc-kr" pageEncoding = "euc-kr"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="content-Type" content="text/html" charset="euc-kr"/>
   	<link rel="stylesheet" type="text/css" href="vcen5.css">
   	<title>프로젝트 출력</title>
	</head>
	<body class="vertical-container">
	
      <div class="projectForm">
      <table width="600" border="2" style="float: center">
	<p>총 프로젝트 관리</p>
	<tr align="center">
         <th colspan="7">총 프로젝트 관리</th>
      </tr>
      <tr align="center">
         <th width="100">Project_Number</th>
         <th width="100">Project_Name</th>
         <th width="100">Project_Startdate</th>
         <th width="100">Project_Enddate</th>
         <th width="100">Project_Order</th>
         <th width="100">Number_of_Person</th>
      </tr>
	
<%
	
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
		String userId = "class_a";
		String userPass = "delab";			
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
      String sql = "SELECT * FROM PROJECT ORDER BY PROJECT_NUMBER";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
         request.setCharacterEncoding("euc-kr");
         int project_number = rs.getInt("project_number");
         String project_name = rs.getString("project_name");
         Date project_startdate = rs.getDate("project_startdate");
         Date project_enddate = rs.getDate("project_enddate");
         String project_order = rs.getString("project_order");
         int number_of_person = rs.getInt("number_of_person");
      %>
      <tr align="center">
          <form name="Modify_Project" action="Modify_Project.jsp" method="post" >
         <td width="100"><input type="text" name="project_number" value=<%=project_number%>></td>
         <td width="100"><input type="text" name="project_name" value=<%=project_name%>></td>
         <td width="100"><input type="text" name="project_startdate" value=<%=project_startdate%>></td>
         <td width="100"><input type="text" name="project_enddate" value=<%=project_enddate%>></td>
         <td width="100"><input type="text" name="project_order" value=<%=project_order%>></td>
         <td width="100"><input type="text" name="number_of_person" value=<%=number_of_person%>></td>
         <td width="100"><input type="submit" value="Modify"></td>
         </form>
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
		<table border="6">
			<tr>
				<th colspan="2">총 프로젝트 수</th>
			</tr>
				
<%
	Connection conn2 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}		
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userId = "class_a";
		String userPass = "delab";			
		conn2 = DriverManager.getConnection(jdbcUrl, userId, userPass);

		String sql2 = "SELECT COUNT(project_number) count FROM Project";
		pstmt2 = conn2.prepareStatement(sql2);
		rs2 = pstmt2.executeQuery();

		while(rs2.next()) {
			int project_number = rs2.getInt("count");

%>
			<tr>
				<td width="100"><%=project_number%></td>
				
			</tr>

<% 
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs2 != null){
			rs2.close();
		}
		if(pstmt2 != null){
			pstmt2.close();
		}		
		conn2.close();
	}
%>
		</table>
	<button onclick="location.href='manage_2_add1.jsp'" class="insertBtn" >프로젝트 추가</button>
   	<button onclick="location.href='manage.jsp'" class="backBtn" >뒤로가기</button>
</div>
	</body>
</html>
