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

@WebServlet(name = "bookDeleteServlet")
public class bookDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //request.setCharacterEncoding("gb2312");
        //response.setContentType("text/html;charset=gb2312");
        //PrintWriter out=response.getWriter();
        String bookId=request.getParameter("bookId");



        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String user = "root";
        String pwd = "password";
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pwd);

            PreparedStatement ps = null;
            String sql = "delete from bookinfo where bookId=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,bookId);
            ps.executeUpdate();


            response.sendRedirect("/backStage/book/delete_success.html");//不能使用request.setAttribute("list",list);
            //request.getRequestDispatcher("/backStage/book/delete_success.html").forward(request, response);

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
