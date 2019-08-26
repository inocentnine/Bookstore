package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ModifyServlet")
public class ModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ordernum=request.getParameter("ordernum");
        String xsstatus=request.getParameter("xsstatus");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String user = "root";
            String password = "password";
            //运行SQL语句
            String sql="update ordermain set xsstatus=? where orderNum=?";
            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1,xsstatus);
            stat.setString(2,ordernum);
            stat.executeUpdate();
            stat.close();
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("backStage/order/modifyOrderstatus.jsp").forward(request, response);
    }
}