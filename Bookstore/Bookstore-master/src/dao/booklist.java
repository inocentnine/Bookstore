package dao;

import vo.Cart;
import vo.User;

import java.sql.*;
import java.util.ArrayList;

public class booklist {

    public ArrayList<Cart> queryuser(String userid) throws Exception {
        ArrayList users = new ArrayList();
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String sql = "select bookname,booknum,cartId, price,context from cart where custId = " + userid ;
            conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart( Integer.parseInt(rs.getString("booknum")), rs.getString("cartId"), null,rs.getString("price"), rs.getString("context"),rs.getString("bookname"));
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
