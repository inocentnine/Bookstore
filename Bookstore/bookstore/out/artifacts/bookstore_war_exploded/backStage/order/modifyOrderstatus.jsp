<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/11/28
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<html>
<head>
    <title>查看全部订单</title>
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

<form id="cardForm" name="search" method="post" action="http://localhost:8080/SearchOrderServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input id="search"  name="ordernumber" type="text" placeholder="请输入订单号" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">查找订单</button></span>
        </div>
    </div>
</form>
<br><br>
<form  name="modify" method="post" action="http://localhost:8080/ModifyServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input   name="ordernum" type="text" placeholder="请输入希望修改的订单编号" class="form-control">
            <input   name="xsstatus" type="text" placeholder="请输入希望修改的订单状态" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">修改订单</button></span>
        </div>
    </div>
</form>
<br><br><br><br>
<form  name="search" method="post" action="http://localhost:8080/DeleteServlet">
    <br>
    <div class="col-lg-6 col-md-offset-3">
        <div class="input-group">
            <input   name="ordernum" type="text" placeholder="请输入希望删除的订单编号" class="form-control">
            <span class="input-group-btn"><button type="submit" class="btn btn-default">删除订单</button></span>
        </div>
    </div>
</form>
<br><br><br>

<form>
    <button class="btn btn-default" type="button" onClick="showall()">全部订单</button>
    <button class="btn btn-default" type="button" onClick="show0()">未处理</button>
    <button class="btn btn-default" type="button" onClick="show1()">已处理</button>
    <button class="btn btn-default" type="button" onClick="show3()">已收货</button>
</form>
<div id="orderDiv"></div>

<SCRIPT LANGUAGE="JavaScript">
    function showall(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/showOrdermain.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }

    function show0(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/showxsstatus0.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }

    function show1(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/showxsstatus1.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }

    function show2(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/showxsstatus2.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }

    function show3(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/showxsstatus3.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }

    function modify(){
        var xmlHttp=new XMLHttpRequest();
        xmlHttp.open("GET","/backStage/order/modify.jsp",true);
        xmlHttp.onreadystatechange=function(){
            if(xmlHttp.readyState==4){
                orderDiv.innerHTML=xmlHttp.responseText;
            }
        }
        xmlHttp.send();
    }
</SCRIPT>

</body>
</html>
