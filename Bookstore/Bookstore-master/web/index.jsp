<%@ page import="bean.Ldf_GetBookInfo" %>
<%@ page import="dao.Ldf_Getbooktype" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: 10177
  Date: 2018/11/7
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <title>网上书店</title>
  </head>
  <body onload="initAJAX()" >
    <script src="js/jquery.min.js" ></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/commons.js"></script>
    <script src="js/background.js"></script>

    <div class="header" >
      <div class="container">
        <div class="row" >
          <div class="login span4" >
            <h1><a href="" > 欢迎来到<strong>我的</strong>书店</a>
              <span class="red">.</span></h1>
          </div>
              <div class="links span8">
              <a class="login" href="login.jsp" rel="tooltip" data-
                 placement="bottom" data-toggle="modal" data-target="#myModal"></a>
              <a class="register" href="register.html" rel="tooltip" data_placement="bottom"
                 data-toggle="modal" data-target="#myModal"></a>
          </div>
        </div>
      </div>
      <div id="navbar" style="color:#fff; background:lightgray; padding:9px; line-height:15px; text-align:right;">
          <div id="userMenu" style="float:left;top: 25px;position: relative; ">
                <ul >
                    <li id="current" style="font-size: 20px;float:left; margin:0px 10px; list-style: none"><a href="index.jsp" >首页</a></li>
                    <li style="font-size: 20px;float:left; margin:0px 10px; list-style: none"><a href="yunxiao/myorder.jsp">我的订单</a></li>
                    <li style="font-size: 20px;float:left; margin:0px 10px; list-style: none"><a href="yunxiao/cart.jsp">购物车</a></li>
                    <li style="font-size: 20px;float:left; margin:0px 10px; list-style: none"><a href="Servlet/LogoutServlet" onclick="logout()">注销</a></li>
                </ul>
          </div>
          <form method="get" name="search" action="">
                <span style="font-size: 19px;color: black">搜索：</span><input class="input-text" type="text" name="keywords" style="margin-right:5px;color: black ;vertical-align:middle; border:1px solid #ccc;"/><input class="input-btn" type="submit" name="submit" value="" style="border:none; background:url(images/timg.jpg); height:40px; width:40px;background-size:40px 40px;"/>
          </form>
      </div>
    </div> <%--header--%>

    <div class="row" > <%--下方左右div控制--%>
        <div class="col-md-3" > <%--左侧菜单div控制--%>
            <ul class="nav nav-list">
                <li class="nav-header" >书籍类型</li>
                <%
                    Ldf_Getbooktype type = new Ldf_Getbooktype();
                    ArrayList booktype = type.book();
                    for (int i =0;i<booktype.size();i++){
                        Ldf_GetBookInfo getbook =(Ldf_GetBookInfo) booktype.get(i);
                %>
                <li style="float: none;margin-top: 25px">
                    <a href='javascript:showBook("<%=getbook.getBooktypeId()%>")'><%=getbook.getBooktypeName()%></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div><%--左侧菜单div控制--%>

        <div class="col-md-9" id="book" style="height: 1000px;float: left"><%--书籍局部控制 --%>
            <script language="JavaScript">
                function showBook(Cotyid) {
                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState == 4) {
                            if(xmlHttp.status == 200) {
                                var data = xmlHttp.responseText;
                                document.getElementById("book").innerHTML = data;
                            }
                        }
                    }
                    xmlHttp.open("GET", "getBook.jsp?id="+Cotyid, true);
                    xmlHttp.send();
                }
            </script>
        </div><%--书籍局部控制 --%>
    </div><%--下方左右div控制--%>


    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"></div>
                <div class="modal-body"></div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

  </body>
</html>
