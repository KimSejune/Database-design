<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" type="text/css" href="vcen9.css">
  <title></title>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   String[] PROJECT = {"PROJECT", "project_number", "project_name", "project_startdate", "project_enddate", "project_order", "number_of_person" };

   String[][] tableArray = {PROJECT};   
   %>
   </head>
   <body class="vertical-container">
   <div class="projectForm">
   <%
   String tableName = request.getParameter("table");   
   for (int i = 0; i < tableArray.length; i++) {      
      if(tableArray[i][0].equals(tableName)){         
   %>
         <%=tableArray[i][0]%><br>
      
      <form name="Insert_Data" method="post" action="manage_2_add3.jsp?table=<%=tableArray[i][0]%>">

      <%
         for (int j=1; j < tableArray[i].length; j++){   
         %>
         <%=tableArray[i][j]%><br>
         <input type="text" name="<%=tableArray[i][j]%>" class="iText"> <br>
         <%
         }
      %>
      <input type="submit" name="Submit" value="데이터삽입" class="iText2"><br>
      <button onclick="location.href='manage_2_add1.jsp'" class="iText2" >뒤로가기</button>
      </form>
   <%
      }
   }
%>
  
   </div>
</head>
<body>

</body>
</html>