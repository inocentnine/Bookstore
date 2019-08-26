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

import beans.customerinfo;

@WebServlet(name = "FindServlet")
public class FindServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName=request.getParameter("customerName");
        //String username=new String(customerName.getBytes("ISO-8859-1"),"utf-8");
        try{
            //获取连接
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String user = "root";
            String password = "password";
            Connection conn=DriverManager.getConnection(url,user,password);
            //运行SQL语句
            String sql="select custId, custName, pwd, email, tel, sex, age, balance from customerinfo where custName='"+customerName+"';";
            Statement stat=conn.createStatement();
            ResultSet rs=stat.executeQuery(sql);
            List<customerinfo> customers=new ArrayList<customerinfo>();
            while(rs.next()){
                customerinfo customer=new customerinfo();
                customer.setcustId(rs.getInt("custId"));
                customer.setcustName(rs.getString("custName"));
                customer.setpwd(rs.getString("pwd"));
                customer.setemail(rs.getString("email"));
                customer.settel(rs.getString("tel"));
                customer.setsex(rs.getString("sex"));
                customer.setage(rs.getInt("age"));
                customer.setbalance(rs.getInt("balance"));
                customers.add(customer);
            }
            request.setAttribute("customers",customers);
            rs.close();
            stat.close();
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("backStage/user/customerdetailInformation.jsp").forward(request, response);
    }
}
