<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/12
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理订单</title>
</head>
<body>

<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "password";
    //运行SQL语句
    String sql="update ordermain set xsstatus='3';";
    Connection conn = DriverManager.getConnection(url,user,password);
    PreparedStatement stat = conn.prepareStatement(sql);
    stat.executeUpdate();
    String sql1="select * from ordermain;";
    ResultSet rs = stat.executeQuery(sql1);
    while (rs.next()) {
%>


</body>
</html>
