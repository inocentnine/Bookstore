<%@ page import="beans.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 13414
  Date: 2018/11/28
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看图书</title>
    <script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!--	 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</head>
<body>

<ul class="nav nav-pills">

    <a class="navbar-brand" href="../backstage.html">Home</a>

    <li role="presentation" class="active"><a href="bookManage.jsp">图书管理</a></li>

    <li role="presentation"><a href="/backStage/order/modifyOrderstatus.jsp">订单管理</a></li>

    <li role="presentation"><a href="/backStage/user/showCustomerInformation.jsp">用户管理</a></li>

</ul>

<div class="col-lg-6 col-md-offset-3">
    <div class="input-group">
        <span class="input-group-btn">

            <form action="/Servlet/bookSearchServlet" method="post">
                <input id="search" type="text" class="submit form-control" placeholder="请输入书名" name="bookName">
                <input class="btn btn-default" type="submit" value="查找图书">
                <button class="btn btn-danger" type="submit" onclick=window.open("book_add.html")>添加图书</button>
            </form>

        </span>
    </div><!-- /input-group -->
</div><!-- /.col-lg-6 -->

<!--<div class="col-lg-6 col-md-offset-3">
    <div class="input-group">
        <input id="search" type="text" class="submit form-control" placeholder="请输入书名">
        <span class="input-group-btn">
    <button class="btn btn-default" type="submit" onclick=find($("#search").val())>查找图书</button>
        <button class="btn btn-danger" type="submit" onclick=window.open("add_book.html")>添加图书</button>
</span>
    </div><!-- /input-group -->
</div><!-- /.col-lg-6 -->

<br><br><br>

<center>
    <div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>序号</th>
                <th>书籍编号</th>
                <th class="price">书名</th>
                <th class="store">类型</th>
                <th class="view">价格</th>
                <th>修改</th>
                <th>删除</th>
            </tr>
            </thead>

            <%
                List<Book> list=(List<Book>)request.getAttribute("list");
                if (list==null){
            %>
            <tbody id="tbid">
            <tr>
                <td class="title">无</td>
                <td>无</td>
                <td>无</td>
                <td>无</td>
                <td>无</td>
                <td>无</td>
                <td>无</td>
            </tr>
            </tbody>

            <%
            }
            else {
                int i=0;
                for (Book book:list){

                    i+=1;
            %>
            <tbody id="tbid">
            <tr>
                <td><%=i%></td>
                <td class="title"><%=book.getId()%></td>
                <td><%=book.getName()%></td>
                <td><%=book.getType()%></td>
                <td><%=book.getPrice()%></td>
                <td>删除按钮</td>
                <td>修改按钮</td>
            </tr>
            </tbody>
            <%
                    }
                }
            %>
        </table>
    </div>

    </form>
</center>

</body>
</html>
