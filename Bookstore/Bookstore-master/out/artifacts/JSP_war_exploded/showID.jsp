<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDao" %>
<%@ page import="vo.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 10177
  Date: 2018/12/5
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    UserDao userdao=new UserDao();
    ArrayList users=null;
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=GBK");
    String username = request.getParameter("id");
    String password = request.getParameter("pwd");
    try {
        users = userdao.queryuser();
    }
    catch (Exception ex){

    }
    for(int i=0;i<users.size();i++){
        User user=(User)users.get(i);
        if(user.getUsername().equals(username)&& user.getPassword().equals(password)){
            //登陆成功，把user存入session域对象中
            request.getSession().setAttribute("user", user);
            //重定向到index.jsp
            response.sendRedirect("index.jsp");
            return;
        }
    }
    //登陆失败
    out.print("登录失败：用户名或密码错误<br>");
    out.println("<a href=index.jsp>返回登陆界面<a/>");
%>
</body>
</html>
