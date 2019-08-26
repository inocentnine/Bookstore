package dao;

import vo.Order;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class OrderDao {


    public ArrayList<Order> queryuser(String userid,int num) throws Exception {

        ArrayList users = new ArrayList();
        Connection conn=null;
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String sql = "select bookname,orderNum , da , num from ordermain where customerId = " + userid + " and xsstatus  = " + num;
            conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                System.out.print(rs.getString("bookname"));
                Order cart = new Order( Integer.parseInt(rs.getString("orderNum")),rs.getString("bookname"),
                        df.format(rs.getTimestamp("da"))
                                , Integer.parseInt(rs.getString("num"))
                );
                users.add(cart);
            }
            rs.close();
            pstat.close();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
            }
        }
        return users;
    }


    public ArrayList<Order> queryuser(String userid) throws Exception {

        ArrayList users = new ArrayList();
        Connection conn=null;
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String sql = "select bookname,orderNum , da , num from ordermain where customerId = " + userid ;
            conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                System.out.print(rs.getString("bookname"));
                Order cart = new Order( Integer.parseInt(rs.getString("orderNum")),rs.getString("bookname"),
                        df.format(rs.getTimestamp("da"))
                        , Integer.parseInt(rs.getString("num"))
                );
                users.add(cart);
            }
            rs.close();
            pstat.close();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {
            }
        }
        return users;
    }



}
