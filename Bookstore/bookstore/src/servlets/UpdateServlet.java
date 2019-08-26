package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.ordermain;

@WebServlet(name = "UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status=request.getParameter("status");
        String ordernumber=request.getParameter("ordernumber");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String user = "root";
            String password = "password";
            //运行SQL语句
            String sql="update ordermain set xsstatus=? where orderNum=?;";
            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement stat = conn.prepareStatement(sql);
            stat.setString(1,status);
            stat.setInt(2,Integer.parseInt(ordernumber));
            stat.executeUpdate();
            String sql1="select * from ordermain where orderNum="+ordernumber+";";
            ResultSet rs = stat.executeQuery(sql1);
            List<ordermain> orders=new ArrayList<ordermain>();
            while (rs.next()){
                ordermain order=new ordermain();
                order.setorderNum(rs.getInt("orderNum"));
                order.setcustomerId(rs.getInt("customerId"));
                order.setxsstatus(rs.getString("xsstatus"));
                order.setbookId(rs.getInt("bookId"));
                order.setnum(rs.getInt("num"));
                orders.add(order);
            }
            request.setAttribute("orders",orders);
            rs.close();
            stat.close();
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("backStage/order/afterModify.jsp").forward(request, response);
    }
}
