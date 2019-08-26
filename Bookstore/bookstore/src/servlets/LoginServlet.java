package servlets;

import beans.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String adminname=request.getParameter("adminname");
        String password=request.getParameter("password");

        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String user = "root";
        String pwd = "password";

        try{

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, pwd);
            //Statement stat=conn.createStatement();

            PreparedStatement ps=null;

            String sql="select * from sysadmin where pwd=?";

            ps=conn.prepareStatement(sql);
            ps.setString(1,password);

            ResultSet rs=ps.executeQuery();
           // List<Book> list=new ArrayList<Book>();

            if (rs.next()){
                response.sendRedirect("/backStage/backstage.html");
               // response.sendRedirect("/backStage/loginfail.html");
            }
            else{
                response.sendRedirect("/backStage/loginfail.html");
               // response.sendRedirect("/backStage/backstage.html");
            }

            //rs.close();
            //stat.close();
            ps.close();
            conn.close();

        }catch(Exception e){

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
