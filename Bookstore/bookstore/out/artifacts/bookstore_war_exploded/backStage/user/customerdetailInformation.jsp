<%@page import="java.util.List"%>
<%@page import="beans.customerinfo"%><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/11/28
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>指定用户信息</title>
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>
<ul class="nav nav-pills">
    <a href="/backStage/backstage.html" class="navbar-brand">Home</a>
    <li role="presentation"><a href="/backStage/book/bookManage.jsp">图书管理</a></li>
    <li role="presentation"><a href="/backStage/order/modifyOrderstatus.jsp">订单管理</a></li>
    <li role="presentation"><a href="/backStage/user/showCustomerInformation.jsp">用户管理</a></li>
</ul>

<%
    List<customerinfo> customers=(List<customerinfo>)request.getAttribute("customers");
    if(customers==null||customers.size()<1){
        out.print("没有数据");
    }else{
        for(customerinfo cust:customers){
%>
<table class="table table-bordered">
    <tr class="title">
        <th>客户ID</th>
        <th>客户姓名</th>
        <th>密码</th>
        <th>邮箱</th>
        <th>电话号码</th>
        <th>性别</th>
        <th>年龄</th>
        <th>余额</th>
    </tr>
    <tbody id="tbid">
    <tr>
        <td><%=cust.getcustId()%></td>
        <td><%=cust.getcustName()%></td>
        <td><%=cust.getpwd()%></td>
        <td><%=cust.getemail()%></td>
        <td><%=cust.gettel()%></td>
        <td><%=cust.getsex()%></td>
        <td><%=cust.getage()%></td>
        <td><%=cust.getbalance()%></td>
    </tr>
    </tbody>
</table>
<%
    }
    }
%>

<form id="cardForm" name="search" method="post" action="http://localhost:8080/backStage/user/showCustomerInformation.jsp">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">返回</button></span>
        </div>
    </div>
</form>

</body>
</html>
