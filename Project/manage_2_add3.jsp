<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" type="text/css" href="vcen10.css">
   <title></title>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   String[] PROJECT = {"PROJECT", "project_number", "project_name", "project_startdate", "project_enddate", "project_order", "number_of_person" };

   String[][] tableArray = {PROJECT};

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
   %>   
</head>
<body class="vertical-container">
<div class="projectForm">
   <%
      String tableName = request.getParameter("table");
      String sql;

      boolean sqlSuccess=false;
      Exception errorMSG=null;

      ArrayList inputData = new ArrayList();

      if(tableArray[0][0].equals(tableName)){
         try{
            int project_number = Integer.parseInt(request.getParameter(tableArray[0][1]));
            String project_name = request.getParameter(tableArray[0][2]);
            String project_startdate = request.getParameter(tableArray[0][3]);
            String project_enddate = request.getParameter(tableArray[0][4]);
            String project_order = request.getParameter(tableArray[0][5]);
            int number_of_person = Integer.parseInt(request.getParameter(tableArray[0][6]));

            sql = "INSERT INTO PROJECT VALUES(?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,project_number);
            pstmt.setString(2,project_name);
            pstmt.setString(3,project_startdate);
            pstmt.setString(4,project_enddate);
            pstmt.setString(5,project_order);
            pstmt.setInt(6,number_of_person);
            pstmt.executeUpdate();

            sqlSuccess=true;

            inputData.add(project_number);
            inputData.add(project_name);
            inputData.add(project_startdate);
            inputData.add(project_enddate);
            inputData.add(project_order);
            inputData.add(number_of_person);
         }catch(Exception e){
            sqlSuccess=false;
            errorMSG=e;
         }
      }
      if(sqlSuccess) {   //flag가 true일때(sql이 정상적으로 실행되었을때) table출력
      %>
      
      <button onclick="location.href='manage_2.jsp'" class="iText2" >프로젝트화면</button>
      <button onclick="location.href='manage_2_add1.jsp'" class="iText2" >뒤로가기</button>
      <br>
   <table width="600" border="6" style="float:left">

      <tr align="center">
         <th colspan="7">삽입된 데이터</th>
      </tr>
      <tr align="center">
         <th colspan="7"><%=tableName%></th>
      </tr>
      <tr align="center">
      <%
      for (int i=0; i < tableArray.length; i++){
         if(tableArray[i][0].equals(tableName)){   //테이블의 이름과 tableName변수의 내용이 같으면
            for (int j = 1; j < tableArray[i].length; j++){   //테이블 안의 attribute를 돌면서
         %>
         <th width="50"><%=tableArray[i][j]%></th> <!--table의 attribute 이름 출력-->
         <%
            }
            break;   //한번 들어왔으면 break로 for문 빠져나감(더이상 돌 필요가 없으므로)
         }
      }
      %>
      </tr>
      <tr align="center">
         <%
            for(int j=0; j<inputData.size(); j++){   //arraylist의 크기만큼 for문 돌기
            %>
            <td width="50"><%=inputData.get(j)%></td> <!--입력된 data출력-->
            <%
            }
         %>
      </tr>

      <%
      }
      else out.println(errorMSG);   //flag가 false일때(sql이 에러났을때) 에러메시지 출력
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

      </div>
</body>
</html>