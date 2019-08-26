<%@ page import="dao.OrderDao" %>
<%@ page import="vo.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.User" %><%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/10/18
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%
    HttpSession session1 = request.getSession();
    if(session1.getAttribute("user")==null){
        response.sendRedirect("/login.jsp");
        return;
    }
%>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo">Online Bookstore</div>
    <div id="navbar">
        <div class="userMenu">
            <ul>
                <li><a href="/index.jsp">首页</a></li>
                <li class="current"><a href="myorder.jsp">已发货订单</a></li>
                <li ><a href="wei.jsp">未发货订单</a></li>
                <li ><a href="his.jsp">历史订单</a></li>
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="/Servlet/LogoutServlet" onclick="logout()">注销</a></li>
            </ul>
        </div>
        <form method="get" name="search" action="">
            <%--搜索：<input class="input-text" type="text" name="keywords" /><input
                class="input-btn" type="submit" name="submit" value="" />--%>
        </form>
    </div>
</div>
<div id="content" class="wrap">
    <div class="list orderList">
        <table>
            <tr class="title">
                <th class="orderId">订单编号</th>
                <th class="userName">订单内容</th>
                <th class="userName">订单数量</th>
                <th class="userName">收货人</th>
                <th class="createTime">下单时间</th>
                <%--<th class="status">订单状态</th>--%>
                <th class="price">确认收货</th>
                <%--<th class="price">设为未处理订单</th>--%>

            </tr>

            <tbody id="tbid">
            <%
                HttpSession session1 = request.getSession();
                User user = (User) session1.getAttribute("user");
                if(session1.getAttribute("user")==null){
                    response.sendRedirect("/login.jsp");
                    return;
                }
                String userid = user.getId();
                OrderDao order  = new OrderDao();
                ArrayList<Order> orders =  order.queryuser(userid,1);
                for(int i = 0 ;i < orders.size();i++) {
                    out.print(" <tr> ");
                    out.print("<td > " +orders.get(i).getId() +" </td >");
                    out.print("<td class=\"thumb\" > " +orders.get(i).getBookname() + " </td > ");
                    out.print( "<td > "   + "" + orders.get(i).getNum()+ " </td >");
                    out.print( "<td > "   + user.getUsername()+ " </td >");

                    out.print( "<td >" + orders.get(i).getDate()+ " </td >");
//                    out.print("<td >" + "待收货" + " </td >");
                    out.print("<td> <a href=\"deleteorder.jsp?id=" + orders.get(i).getId() + "\">" + "确认收货" + " </a> </td >");
                    out.print(" <tr> ");
                }

            %>


           <%-- <tr>
                <td colspan="6" align="right">总计金额：￥99.99元
                    <button>确认收货</button>
                </td>
            </tr>--%>
            </tbody>
        </table>
       <%-- <div class="page-spliter">
            <a href="#">&lt;</a> <a href="/in">首页</a> <span class="current">1</span>
            <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <span>...</span>
            <a href="#">尾页</a> <a href="#">&gt;</a>
        </div>--%>
        <!-- <div class="button"><input class="input-gray" type="submit" name="submit" value="查看一个月前的订单" /><input class="input-gray" type="submit" name="submit" value="查看一个月前的订单" /></div> -->
    </div>
</div>
<div id="footer" class="wrap">网络工程161 &copy; 版权所有</div>

<script>
    $(function(){
        loadData(1);
    })
</script>




<script type="text/javascript">
    function change(num,state) {
//    function change(order){   //html不能传对象
        $.ajax({
            type:"post",
            url:"orders",
            data:{_method:"put",orderNum:num, state:state},
//			data:{_method:"put",order:order},
            dataType:"json",
            success:function(data){
                if(data.code===1){
//                    window.location.reload();
                    loadData(currentPage);
                }else{
                    alert(data.msg);
                }
            }
        })
    }
</script>

</body>
</html>
