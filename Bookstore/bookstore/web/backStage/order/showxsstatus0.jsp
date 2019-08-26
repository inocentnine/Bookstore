<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/11/29
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未处理订单</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>

<table class="table table-bordered">
    <tr class="title">
        <th>订单号</th>
        <th>客户ID</th>
        <th>图书ID</th>
        <th>订购数量</th>
        <th>订单状态</th>
    </tr>
<%

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "password";
    //运行SQL语句
    String sql="select orderNum, customerId, bookId, num, xsstatus from ordermain where xsstatus='0';";
    Connection conn = DriverManager.getConnection(url,user,password);
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
%>

    <tbody id="tbid">
    <tr>
        <td><%=rs.getInt("orderNum")%></td>
        <td><%=rs.getInt("customerId")%></td>
        <td><%=rs.getInt("bookId")%></td>
        <td><%=rs.getInt("num")%></td>
        <td><%=rs.getString("xsstatus")%></td>
    </tr>
    </tbody>
<%
    }
    stat.close();
    conn.close();
%>
</table>
</body>
</html>
