<%@ page import="dao.Ldf_ConnectMysql" %>
<%@ page import="bean.Ldf_GetBookInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.Ldf_BookInfomation"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection" %>

<%--
  Created by IntelliJ IDEA.
  User: 10177
  Date: 2018/11/15
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getBook</title>

</head>
<body >
<%
    String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    String user = "root";
    String password = "password";

    String categoryID = request.getParameter("id");

    Class.forName("com.mysql.jdbc.Driver");
    String sql = "select bookId,bookName,author,price,booktypeId ,smallImg from bookinfo" +
            " where booktypeId= ?";
    Connection conn = DriverManager.getConnection(url,user,password);
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    ResultSet rs = pstat.executeQuery();
    while (rs.next()) {
%>


<script>
    function add(){


        window.location.href="http://localhost:8080/AddCart";
        alert("wocaonima")
    }
</script>


    <div class="col-sm-9 col-md-3" style="height: 220px;">
        <div class="thumbnail">
            <img src="<%=rs.getString("smallImg")%>">
            <div class="caption" style="height: 200px;width: 320px">
                <h4><%=rs.getString("bookName")%></h4><br>
                <div class="text-des" style="height: 100px;">
                    作者：&nbsp&nbsp&nbsp&nbsp
                    <label ><%=rs.getString("author")%></label><br>
                    价格：&nbsp&nbsp&nbsp&nbsp
                    <label style="color: #f40;font-size: 20px">
                        <strong class="tb-rmb">¥</strong>
                        <%=rs.getString("price")%>
                    </label>
                </div>
                <div class="but-info" style="left: 70px;position: relative;">
                    <p style="">
                       <%-- <span class="btn btn-primary" role="button" onclick= "add()">加入购物车</span>
                        <input type="submit" onclick="add()" class="btn btn-primary" value="加入购物车">--%>
                        <a target="_blank" href='addcart.jsp?id=<%=rs.getString("bookId")%>' class="btn btn-default" role="button">加入购物车</a>
                        <a target="_blank" href='bookinfomation.jsp?bookid=<%=rs.getString("bookId")%>' class="btn btn-default" role="button">查看详情</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
<%
    }
%>
</body>
</html>
