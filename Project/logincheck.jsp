<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
	<title>로그인 체크</title>

</head>
<body>
    
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
       

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
         // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
        String employee_id = request.getParameter("input_id");
        String employee_pw = request.getParameter("input_pw");
         
        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        //String sql = "SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID='" + employee_id + "' AND EMPLOYEE_PW='" + employee_pw + "'";
        //st.executeUpdate(sql);
        ResultSet rs = st.executeQuery("SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID='" + employee_id + "' AND EMPLOYEE_PW='" + employee_pw + "'");
        
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("id", employee_id); 
            session.setAttribute("pw", employee_pw);
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("login.jsp");    
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패"); history.go(-1); </script> <%            
        }
        
        
    } catch (Exception e) {       
        e.printStackTrace();
        out.println("DB 연동 실패");
    }
    %>

</body>
</html>