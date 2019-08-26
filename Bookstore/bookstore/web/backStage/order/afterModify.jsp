<%@page import="java.util.List"%>
<%@page import="beans.ordermain"%><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/11/29
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改后的订单</title>
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

<table class="table table-bordered">
    <tr class="title">
        <th>订单号</th>
        <th>客户ID</th>
        <th>图书ID</th>
        <th>订购数量</th>
        <th>订单状态</th>
    </tr>
<%
    List<ordermain> orders=(List<ordermain>)request.getAttribute("orders");
    if(orders==null||orders.size()<1){
        out.print("没有数据");
    }else{
        for(ordermain ord:orders){
%>

    <tbody id="tbid">
    <tr>
        <td><%=ord.getorderNum()%></td>
        <td><%=ord.getcustomerId()%></td>
        <td><%=ord.getbookId()%></td>
        <td><%=ord.getnum()%></td>
        <td><%=ord.getxsstatus()%></td>
    </tr>
    </tbody>

<%
    }
    }
%>
</table>
<form id="cardForm" name="search" method="post" action="http://localhost:8080/backStage/order/modifyOrderstatus.jsp">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">确认</button></span>
        </div>
    </div>
</form>

</body>
</html>
