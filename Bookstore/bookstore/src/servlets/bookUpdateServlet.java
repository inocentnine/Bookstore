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

@WebServlet(name = "bookUpdateServlet")
public class bookUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //request.setCharacterEncoding("gb2312");
        //response.setContentType("text/html;charset=gb2312");
        //PrintWriter out=response.getWriter();
        String bookId01=request.getParameter("bookId01");
        String bookId02=request.getParameter("bookId02");
        String bookName=request.getParameter("name");
        String bookType=request.getParameter("type");
        String bookPrice=request.getParameter("price");
        String bookSum=request.getParameter("booksum");



        String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
        String user = "root";
        String pwd = "password";
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pwd);

            PreparedStatement ps = null;
            if (bookId02==null){
                String sql = "select bookId,bookName,booktypeId,price,booknum from bookinfo where bookId=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1,bookId01);
                ResultSet rs=ps.executeQuery();
                List<Book> booklist=new ArrayList<Book>();
                while (rs.next()){
                    Book book=new Book();
                    book.setId(rs.getString("bookId"));
                    book.setName(rs.getString("bookName"));
                    book.setType(rs.getString("booktypeId"));
                    book.setPrice(rs.getString("price"));
                    book.setBooksum(rs.getString("booknum"));
                    booklist.add(book);
                }
                request.setAttribute("booklist",booklist);
                request.getRequestDispatcher("/backStage/book/book_update.jsp").forward(request, response);
            }


            if (bookId02!=null){
                String sql_update = "update bookinfo set bookId=?,bookName=?,booktypeId=?,price=?,booknum=? where bookId=?";
                ps = conn.prepareStatement(sql_update);
                ps.setString(1,bookId02);
                ps.setString(2,bookName);
                ps.setString(3,bookType);
                ps.setString(4,bookPrice);
                ps.setString(5,bookSum);
                ps.setString(6,bookId01);
                ps.executeUpdate();
                response.sendRedirect("/backStage/book/delete_success.html");//不能使用request.setAttribute("list",list);
            }
            //response.sendRedirect("/backStage/book/delete_success.html");//不能使用request.setAttribute("list",list);
            //request.getRequestDispatcher("/backStage/book/book_update.jsp").forward(request, response);

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
