package Servlet;

import dao.UserDao;
import vo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
@WebServlet(name = "LoginServlet",urlPatterns = "/Servlet/LoginServlet")
public class LoginServlet extends HttpServlet {

    UserDao userdao=new UserDao();
    ArrayList users=null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        String code=request.getParameter("code");
        String username = request.getParameter("id");
        String password = request.getParameter("pwd");
        HttpSession session=request.getSession();
        String randStr=(String)session.getAttribute("randStr");
        session.removeAttribute("randStr");


        try {
            users = userdao.queryuser();
        }
       catch (Exception ex){

       }
       if(code.equals(randStr)){
           HttpSession session1 = request.getSession();
           if(session1.getAttribute("user")==null){
               for(int i=0;i<users.size();i++){

                   User user=(User)users.get(i);
                   if(user.getUsername().equals(username)&& user.getPassword().equals(password)){
                       //登陆成功，把user存入session域对象中

                       session1.setAttribute("user", user);
//                       session1.setAttribute("userid", user);
                       //重定向到index.jsp
                       out.print(" <script>\n" +
                               "   timer=window.setTimeout(\"fun1()\",\"1000\");\n" +
                               "  alert(\"登陆成功\");\n" +
                               "   function fun1(){\n" +
                               "      window.location.href=\"/index.jsp\";\n" +
                               "   }\n" +
                               "   </script>");

                       return;
                   }
               }
               //登陆失败
               out.print("<script>\n" +
                       "   timer=window.setTimeout(\"fun1()\",\"1000\");\n" +
                       "  alert(\"账号或密码错误\");\n" +
                       "   function fun1(){\n" +
                       "      window.location.href=\"/login.jsp\";\n" +
                       "   }\n" +
                       "   </script>");
           }
           else{
               out.print(" <script>\n" +
                       "   timer=window.setTimeout(\"fun1()\",\"1000\");\n" +
                       "  alert(\"不能重复登录\");\n" +
                       "   function fun1(){\n" +
                       "      window.location.href=\"/login.jsp\";\n" +
                       "   }\n" +
                       "   </script>");
           }
           }

       else{
           out.print(" <script>\n" +
                   "   timer=window.setTimeout(\"fun1()\",\"1000\");\n" +
                   "  alert(\"验证码错误\");\n" +
                   "   function fun1(){\n" +
                   "      window.location.href=\"/login.jsp\";\n" +
                   "   }\n" +
                   "   </script>");
       }
       }

    }

