<%@ page import="beans.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 13414
  Date: 2018/12/1
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加图书</title>
    <style>
        label.error{
            color:red;
        }
    </style>
    <script src="/js/jquery-1.12.2.min.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
    <script src="/js/jquery.form.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!--	 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>

<ul class="nav nav-pills">

    <a class="navbar-brand" href="../backStage/backstage.html">Home</a>

    <li role="presentation" class="active"><a href="../backStage/book/bookManage.jsp">图书管理</a></li>

    <li role="presentation"><a href="/backStage/order/modifyOrderstatus.jsp">订单管理</a></li>

    <li role="presentation"><a href="/backStage/user/showCustomerInformation.jsp">用户管理</a></li>

</ul>


<br><br><br>
<div id="upload" style="width: 960px; margin-left: auto; margin-right: auto;">

    <form action="/Servlet/bookUpdateServlet" id="myform" role="form" method="post" >
        <%
            //String bookId01=request.getParameter("bookId01");

        %>
    <%
        List<Book> list=(List<Book>)request.getAttribute("booklist");

        for (Book book:list){
    %>

    <div class="form-group">
        <label>原始书号:<input name="bookId01" type="number" class="form-control" placeholder="请输入原始书籍号码"></label>
        修改为：
        <input name="bookId02" type="number" class="form-control" placeholder="请输入书籍号码">
    </div>
    <div style="min-height:10px;"></div>

    <div class="form-group">
        <label>书名:<%=book.getName()%></label>
        修改为：
        <input name="name" type="text" class="form-control" placeholder="请输入书籍名称">
    </div>
    <div style="min-height:10px;"></div>

    <div class="form-group">
        <label>类型:<%=book.getType()%></label>
        修改为：
        <input name="type" type="text" class="form-control" placeholder="请输入书籍类型">
    </div>
    <div style="min-height:10px;"></div>

    <div class="form-group">
        <label>价格:<%=book.getPrice()%></label>
        修改为：
        <input name="price" type="number" class="form-control" placeholder="请输入书籍单价">
    </div>
    <div style="min-height:10px;"></div>

    <div class="form-group">
        <label>库存:<%=book.getBooksum()%></label>
        修改为：
        <input name="booksum" type="number" class="form-control" placeholder="请输入书籍库存">
    </div>
    <div style="min-height:10px;"></div>


    <%
        }
    %>
        <center>
               <span>
				   <input name="submit" type="submit" value="提交修改" class="btn btn-primary">
			   </span>
        </center>

    </form>
</div>
</body>
</html>
