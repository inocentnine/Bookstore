<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/11/27
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息查询</title>
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>

<ul class="nav nav-pills">
    <a href="../backstage.html" class="navbar-brand">Home</a>
    <li role="presentation"><a href="../book/bookManage.jsp">图书管理</a></li>
    <li role="presentation"><a href="/backStage/order/modifyOrderstatus.jsp">订单管理</a></li>
    <li role="presentation"><a href="/backStage/user/showCustomerInformation.jsp">用户管理</a></li>
</ul>

<form name="search" method="post" action="http://localhost:8080/FindServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input id="search" name="customerName" type="text" placeholder="请输入用户名" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">查找用户</button></span>
        </div>
    </div>
</form>
<br>
<form name="lock" method="post" action="http://localhost:8080/LockServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input  name="customername" type="text" placeholder="请输入用户名" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">锁定用户</button></span>
        </div>
    </div>
</form>
<br>
<form  name="delete" method="post" action="http://localhost:8080/DeletecustomerServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input  name="customername" type="text" placeholder="请输入用户名" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">删除用户</button></span>
        </div>
    </div>
</form>
<br><br><br><br>

<div id="isLocked">
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
        </tr>

<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "password";
    //运行SQL语句
    String sql="select custId, custName, pwd, email, tel, sex, age, balance, wrong from customerinfo;";
    Connection conn = DriverManager.getConnection(url,user,password);
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
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
</div>

<script language="JavaScript">
    function unlock(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/user/unLock.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                isLocked.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }
</script>
</body>
</html>
