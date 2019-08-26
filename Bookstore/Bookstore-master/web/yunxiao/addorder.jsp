<%@ page import="dao.booklist" %>
<%@ page import="vo.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.User" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/11/18
  Time: 6:15 PM
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
    booklist books = new booklist();
    ArrayList<Cart> carts =  books.queryuser(userid);

    String sql = "INSERT INTO  ordermain(bookname,num,xsstatus,customerId) values";
    for (int i = 0; i < carts.size();i++) {
        sql += "('" + carts.get(i).getBookname() + "'," + carts.get(i).getBooknum() + "," +"'0'," +   userid +"),";

    }
    sql = (String) sql.subSequence(0,sql.length()-1);

    System.out.print(sql);
    try {
        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, "root", "password");
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sql);
    }catch (SQLException e){
        e.printStackTrace();
    }

    response.sendRedirect("clear.jsp");

%>

<html>
<head>
    <title>Addorder</title>
</head>
<body>

</body>
</html>
