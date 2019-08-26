<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.Ldf_GetBookInfo" %>
<%@ page import="dao.Ldf_BookInfomation" %>

<%--
  Created by IntelliJ IDEA.
  User: 10177
  Date: 2018/12/5
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详情</title>
    <style>
        body{background: url("images/bookinfomationbg.jpg");background-size: 100% 1000px;padding: -3px}
        img{width: 400px;height: 400px}
        #body{background-color:lightyellow;height: 1200px;width: 1200px;top: 50px;left: 300px;position: absolute}

        .textinfo{width: 100%;position: relative;}
        .picture{text-align: center;top: 10px;position: relative;}

        .td1{font-size: 20px;font-family: 宋体;font-weight: 800;line-height: 60px;width: 150px;text-align: center;}
        .td2{font-size: 26px;font-family: 新宋体;font-weight: 500;padding-left: 10px;position: relative;}
        .num{color: red;font-size: 30px;}

    </style>
</head>
<body>
<%
    String bookID = request.getParameter("bookid");
    Ldf_BookInfomation book = new Ldf_BookInfomation();
    Ldf_GetBookInfo getbook = book.bookinfo(bookID);
%>
    <div id="all">
        <div id="body">
            <div class="picture">
                <img src="<%=getbook.getSmallImg()%>">
            </div>
            <div class="textinfo">
                <table >
                    <tr>
                        <td class="td1">书&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                        <td class="td2"><%=getbook.getBookName()%></td>
                    </tr>
                    <tr>
                        <td class="td1">作&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
                        <td class="td2"><%=getbook.getAuthor()%></td>
                    </tr>
                    <tr>
                        <td class="td1">出 版 社：</td>
                        <td class="td2"><%=getbook.getPbName()%></td>
                    </tr>
                    <tr>
                        <td class="td1">出版时间：</td>
                        <td class="td2"><%=getbook.getPbDate()%></td>
                    </tr>
                    <tr>
                        <td class="td1">简&nbsp;&nbsp;&nbsp;&nbsp;介：</td>
                        <td class="td2"><%=getbook.getContext()%></td>
                    </tr>
                    <tr>
                        <td class="td1">售&nbsp;&nbsp;&nbsp;&nbsp;价：</td>
                        <td class="td2">
                            <strong class="rmb">¥</strong>&nbsp;
                            <label class="num"><%=getbook.getPrice()%></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">库&nbsp;&nbsp;&nbsp;&nbsp;存：</td>
                        <td class="td2"><%=getbook.getBooknum()%>件</td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
<%
%>
</body>
</html>
