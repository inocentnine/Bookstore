<%@ page import="vo.User" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/11/18
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    if(session1.getAttribute("user")==null){
        response.sendRedirect("/login.jsp");
        return;
    }

    String userid = user.getId();
%>

<%
    String userID = request.getParameter("userid");
//    out.print(bookID);
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String sql = "delete from cart where custId = " + userid ;
        Connection conn = DriverManager.getConnection(url, "root", "password");
        Statement stmt = conn.createStatement();

//            String sql1 = "insert into cart(bookId,custId, scdate,booknum ) values( " + bookid + "," + userid + "," + 1 + ")";
        stmt.executeUpdate(sql);

    }catch (SQLException e){
        e.printStackTrace();
    }
    response.sendRedirect("myorder.jsp");


%>



<html>
<head>
    <title>Delete</title>
</head>
<body>

</body>
</html>

