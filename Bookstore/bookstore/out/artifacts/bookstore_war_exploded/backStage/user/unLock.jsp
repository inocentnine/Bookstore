<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/5
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>解锁用户</title>
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>

<table class="table table-bordered">
    <tr class="title"><td><button type="submit" class="btn btn-default" onclick="unlock()">解锁</button></td></tr>
    <tr class="title">
        <th>客户ID</th>
        <th>客户姓名</th>
        <th>密码</th>
        <th>邮箱</th>
        <th>电话号码</th>
        <th>性别</th>
        <th>年龄</th>
        <th>余额</th>
        <th>错误次数</th>
        <th></th>
        <th></th>
    </tr>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "password";
    //运行SQL语句
    String sql="update customerinfo set wrong=0 where wrong=3;";
    Connection conn = DriverManager.getConnection(url,user,password);
    PreparedStatement stat = conn.prepareStatement(sql);
    stat.executeUpdate();
    String sql1="select * from customerinfo;";
    ResultSet rs = stat.executeQuery(sql1);
    while (rs.next()) {
%>
    <tbody id="tbid">
      <tr>
        <td><%=rs.getInt("custId")%></td>
        <td><%=rs.getString("custName")%></td>
        <td><%=rs.getString("pwd")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("tel")%></td>
        <td><%=rs.getString("sex")%></td>
        <td><%=rs.getInt("age")%></td>
        <td><%=rs.getInt("balance")%></td>
        <td><%=rs.getInt("wrong")%></td>
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
