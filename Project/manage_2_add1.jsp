<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" type="text/css" href="vcen8.css">
  <title>테이블 데이터 추가</title>
</head>
<body class="vertical-container">
   <div class="projectForm">  
      <button onclick="location.href='manage_2.jsp'" class="backBtn" >뒤로가기</button>
   </div>
   <table width="600" border="1" style="float:left" class="projectForm">

      
      <tr align="center">
         <td> 데이터를 넣을 테이블 선택 </td>
         <td>
            <select onchange="gourl(this.options[this.selectedIndex].value)">
   <%
   String[] PROJECT_PARTICIPATE = {"PROJECT_PARTICIPATE", "project_number", "project_name", "project_startdate", "project_enddate", "project_order", "number_of_person" };
   String[] PROJECT = {"PROJECT", "project_number", "project_name", "project_startdate", "project_enddate", "project_order", "number_of_person" };


   String[][] tableArray = {PROJECT_PARTICIPATE, PROJECT};   

   for (int i = 0; i < tableArray.length; i++) {
      %>
            <option value="manage_2_add2.jsp?table=<%=tableArray[i][0]%>"><%=tableArray[i][0]%></option>   
      <%
   }
      %>
         </td>
      </tr>
      </table>
   </select>
</body>
</html>
<script language="javascript">
function gourl(url)
{
   window.location.href = url;
}
</script>