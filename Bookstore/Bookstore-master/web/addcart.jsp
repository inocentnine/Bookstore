<%--
  Created by IntelliJ IDEA.
  User: jackdu
  Date: 12/10/18
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Servlet.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="dao.UserDao" %>
<%@ page import="vo.User" %>
<%@ page import="vo.BOOK" %>
<%@ page import="dao.BookDao" %>
<%@ page import="java.awt.print.Book" %>
<%@ page import="dao.CartDao" %>
<%@ page import="vo.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddCart</title>
</head>
<body>



<%
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    if(session1.getAttribute("user")==null){
        response.sendRedirect("/login.jsp");
        return;
    }

    String userid = user.getId();
    System.out.print( "Id :" + user.getId()   );
    String bookid = request.getParameter("id");
    UserDao userdao=new UserDao();
    ArrayList users = userdao.queryuser();
    BookDao bookdao = new BookDao();
    BOOK book = bookdao.queryuser(bookid);
//    System.out.print("book" + book.getContext());
    Cart cart = new Cart(1,bookid,userid,book.getPrice(),book.getContext(),book.getName());
    CartDao cartdao = new CartDao();
    String bid = cartdao.get(userid,bookid);

    if(bid.equals("ok")) {
        cartdao.set(cart);
    }else {

    }
    response.sendRedirect("/yunxiao/cart.jsp");
%>




</body>
</html>
