package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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

@WebServlet(name = "SearchOrderServlet")
public class SearchOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ordernumber=request.getParameter("ordernumber");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String user = "root";
            String password = "password";
            //运行SQL语句
            String sql="select orderNum, customerId, bookId, num, xsstatus from ordermain where orderNum="+ordernumber+";";
            Connection conn = DriverManager.getConnection(url,user,password);
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
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
        request.getRequestDispatcher("backStage/order/orderdetailInformation.jsp").forward(request, response);
    }
}
