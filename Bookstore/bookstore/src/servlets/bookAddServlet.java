package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "servlets.bookAddServlet")
public class bookAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        PrintWriter out=response.getWriter();
        int bookId=Integer.parseInt(request.getParameter("bookId"));
        String bookName=request.getParameter("name");
        int booktypeId=Integer.parseInt(request.getParameter("type"));
        String price=request.getParameter("price");
        int booksum=Integer.parseInt(request.getParameter("booksum"));
        String img="../yunxiao/images/book/"+request.getParameter("imgfile");
        String context=request.getParameter("context");

        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String user = "root";
        String pwd = "password";
        try{

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, pwd);

            //String sql = "INSERT INTO bookinfo* VALUES (?,?,?,?,?,?,?,?,?,?)";

            String Nowtime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

            java.sql.Date mysqldate=java.sql.Date.valueOf(Nowtime);


            PreparedStatement ps = conn.prepareStatement("INSERT INTO bookinfo VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,bookId);
            ps.setString(2, bookName);
            ps.setInt(3, booktypeId);
            ps.setString(4,"ncu");
            ps.setString(5,"ncu");
            ps.setString(6,context);
            ps.setString(7,img);
            ps.setString(8, price);
            ps.setDate(9,mysqldate);
            ps.setInt(10, booksum);



            ps.executeUpdate();
            response.sendRedirect("/backStage/book/add_success.html");
            //request.getRequestDispatcher("/backStage/book/add_success.html").forward(request,response);


            ps.close();
            conn.close();
        }catch(Exception e){
            out.print("图书信息添加失败  " + e.toString());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
