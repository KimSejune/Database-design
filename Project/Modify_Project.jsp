<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" type="text/css" href="vcen11.css">
   <body class="vertical-container">
   <title></title>
<%
   request.setCharacterEncoding("UTF-8");
   Connection conn = null;
   PreparedStatement stmt = null;
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

        String project_name = request.getParameter("project_name");
        String project_startdate = request.getParameter("project_startdate");
        String project_enddate = request.getParameter("project_enddate");
        String project_order = request.getParameter("project_order");
        int number_of_person = Integer.parseInt(request.getParameter("number_of_person"));
        int project_number = Integer.parseInt(request.getParameter("project_number"));

      String sql = "UPDATE PROJECT SET project_name=?, project_startdate=?, project_enddate=?, project_order=?, number_of_person=?  WHERE project_number=?";
      int result = 0;
      
      stmt = conn.prepareStatement(sql);
   	  
   	  
      stmt.setString(1,  project_name);
      stmt.setString(2,  project_startdate);
      stmt.setString(3,  project_enddate);
      stmt.setString(4,  project_order);
      stmt.setInt(5, number_of_person);
      stmt.setInt(6, project_number);
      
      result = stmt.executeUpdate();
      System.out.println("result : "+result);
      if (result < 1) {
      %>
      String err =e.getMessage().replaceAll("\""," ").replaceAll("\n"," ");
      out.println(err);            
      out.println(" <br><script> alert('"+ err +"'); history.back(); </script>");
      <%
      }else{
      %>
      
      <div class="projectForm">
      <button onclick="location.href='manage_2.jsp'" class="modifyBtn">수정완료</button>
      </div>
      <%
      
      }
   
      
   }catch(Exception e){
      String err = e.getMessage().replaceAll("\""," ").replaceAll("\n"," ");
      out.println(err);            
      out.println(" <br><script> alert('"+ err +"'); history.back(); </script>");

   }finally{
      if(rs != null){
         rs.close();
      }
      if(stmt != null){
         stmt.close();
      }      
      conn.close();
   }
%>

</body>
</html>