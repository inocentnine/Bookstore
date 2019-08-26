<%@ page import="java.sql.*" %>

<%--
  Created by IntelliJ IDEA.
  User: 10177
  Date: 2018/11/18
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册ID</title>
</head>
<body>
<%
    String getid =request.getParameter("id");
    String getpwd =request.getParameter("pwd");
    String getmail = request.getParameter("mail");

    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url,"root","password");
    Statement stat = conn.createStatement();
    String sql = "select custName from customerinfo where custName = ?";
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,getid);
    ResultSet rs = pstat.executeQuery();
    if (rs.next()){
        out.println("<script language='javascript'>alert('该用户名已存在！');window.location.href='register.html';</script>");
    }else {
        PreparedStatement tmt = conn.prepareStatement("Insert into customerinfo(custName, pwd, email) values( '" + getid + "','"+getpwd+ "','"+ getmail + "')" );
        int a = tmt.executeUpdate();
        if (a!=0){
            out.println("<script language='javascript'>alert('注册成功！');window.location.href='index.jsp';</script>");
        }else {
            out.println("<script language='javascript'>alert('注册失败！');window.location.href='register.html';</script>");
        }
    }

    stat.close();
    conn.close();
%>
</body>
</html>
+