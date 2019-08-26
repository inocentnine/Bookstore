package dao;

import vo.BOOK;
import vo.Cart;
import vo.User;

import java.sql.*;
import java.util.ArrayList;

public class CartDao {
    public void set(Cart cart) throws Exception {
//        Connection conn=null;
        try {

            String sql1 = "insert into cart(bookId,custId,booknum,price,context,bookname) values( " + cart.getBookId() + "," + cart.getCustId() + "," + 1 + ",'" +
                   cart.getPrice() + "','" + cart.getContext() + "','" + cart.getBookname() + "')";

            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "password");
            Statement stmt = conn.createStatement();

//            String sql1 = "insert into cart(bookId,custId, scdate,booknum ) values( " + bookid + "," + userid + "," + 1 + ")";
            stmt.executeUpdate(sql1);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    public String  get(String id,String bd){
        try {

            String sql = "select bookId from cart where custId = " + id;

            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery(sql);
            while (rs.next()) {

                if(rs.getString("bookId").equals(bd))
                    return new String("no");
            }
        }catch (SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new String("ok");
    }

}
