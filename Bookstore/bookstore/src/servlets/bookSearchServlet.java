package servlets;

import beans.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "bookSearchServlet")
public class bookSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");
        //PrintWriter out=response.getWriter();

        String bookName=request.getParameter("bookName");


        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String user = "root";
        String pwd = "password";
        try{

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, pwd);
            //Statement stat=conn.createStatement();

            PreparedStatement ps=null;
            if (bookName==""){
                String sql="select bookId,bookName,booktypeId,price,booknum from bookinfo";
                ps=conn.prepareStatement(sql);
            }
            if (bookName!=""){
                String sql="select bookId,bookName,booktypeId,price,booknum from bookinfo where bookName=?";
                ps=conn.prepareStatement(sql);
                ps.setString(1,bookName);
            }
            ResultSet rs=ps.executeQuery();
            List<Book> list=new ArrayList<Book>();
            while (rs.next()){
                Book book=new Book();
                book.setId(rs.getString("bookId"));
                book.setName(rs.getString("bookName"));
                book.setType(rs.getString("booktypeId"));
                book.setPrice(rs.getString("price"));
                book.setBooksum(rs.getString("booknum"));
                list.add(book);
            }

            request.setAttribute("list",list);

            //response.sendRedirect("/backStage/book/book_detail.jsp");不能使用
            request.getRequestDispatcher("/backStage/book/book_detail.jsp").forward(request,response);

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
