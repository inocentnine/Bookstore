package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutServlet",urlPatterns = "/Servlet/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=GBK");
//从request中获取。
        HttpSession session1 = request.getSession();
        PrintWriter out = response.getWriter();
        if(session1.getAttribute("user")==null){
            response.sendRedirect("/index.jsp");
            return;
        }
        session1.removeAttribute("user");
        //从定向到index.jsp
        out.print(" <script>\n" +
                "   timer=window.setTimeout(\"fun1()\",\"1000\");\n" +
                "  alert(\"注销成功\");\n" +
                "   function fun1(){\n" +
                "      window.location.href=\"/index.jsp\";\n" +
                "   }\n" +
                "   </script>");
    }
}
