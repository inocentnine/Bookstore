<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@page import="Servlet.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.booklist" %>
<%@ page import="vo.User" %>
<%@ page import="vo.Cart" %><%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/7/18
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    if(session1.getAttribute("user")==null){
        response.sendRedirect("/login.jsp");
        return;
    }

    String userid = user.getId();
%>










<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript">

        function submit() {
            window.location.href="http:www.baidu.com";
            alert("wocaonima")
        }


    </script>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo">网上书城</div>
    <div id="navbar">
        <div class="userMenu">
            <ul>
                <li><a href="/index.jsp">首页</a></li>
                <li><a href="myorder.jsp">我的订单</a></li>
                <li  class=><a href="his.jsp">历史订单</a></li>
                <li class="current"><a href="cart.jsp">购物车</a></li>

                <li><a href="/Servlet/LogoutServlet" onclick="logout()">注销</a></li>
            </ul>
        </div>
        <form method="get" name="search" action="">

        </form>
    </div>
</div>
<div id="content" class="wrap">
    <div class="list bookList">
        <form id="orderId" method="post" name="shoping" action="shopping-success.html" onsubmit="return false;">
            <table>
                <tr class="title" >

                    <th class="view">书名</th>
                    <th >内容</th>
                    <th class="nums">数量</th>
                    <th class="price">添加数量</th>
                    <th class="price">减少数量</th>
                    <th class="price">删除</th>

                </tr>

                <tbody id="tbid">


                <%
                    booklist books = new booklist();
                    ArrayList<Cart> carts =  books.queryuser(userid);
                    for (int i = 0; i < carts.size();i++) {
                        out.print(" <tr class=\"odd\">");
                        out.print("<td class=\"thumb\">" + carts.get(i).getBookname() + "</td>");
                        out.print("<td class=\"title\">" + carts.get(i).getContext() +"</td>");
                        out.print(" <td> <input class=\"input-text\" type=\"text\" name=\"nums\" value= \"" + carts.get(i).getBooknum()+ " \"/></td>");
                        out.print( "<td> <a href=\"add.jsp?bookid="  + carts.get(i).getBookId() +  "&" + "num=" +carts.get(i).getBooknum()+ "\"> 添加" + "</a></td>"+ "</a>");
                        out.print( "<td> <a href=\"sub.jsp?bookid="  + carts.get(i).getBookId() +  "&" + "num=" +carts.get(i).getBooknum()+ "\"> 减少" + "</a></td>"+ "</a>");
//                        out.print( "<td> <a href=\"sub.jsp?bookid="  + carts.get(i).getBookId() + "\"> 减少" + "</a></td>"+ "</a>");
//                        out.print("<td>￥<span>" + carts.get(i).getPrice() + "</span></td>");
                        out.print( "<td> <a href=\"delete.jsp?bookid="  + carts.get(i).getBookId() + "\"> 删除" + "</a></td>"+ "</a>");
                        out.print(" </tr>");
                    }
                %>

                </tbody>

            </table>
            <div class="button">
                <%

                   if( carts.size() == 0)
                       out.print("<a href=\"/index.jsp\"   style=\"font-size: 20px \">购物车是空的 选购图书 </a>");
                   else
                       out.print("<a href=\"addorder.jsp\"   style=\"font-size: 20px \">立即购买 </a>");
                %>


            </div>
        </form>
    </div>
</div>
<div id="footer" class="wrap">
   网络工程161班 &copy; 版权所有
</div>



</body>
</html>
