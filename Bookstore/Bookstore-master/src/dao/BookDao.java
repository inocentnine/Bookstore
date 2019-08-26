package dao;

import vo.BOOK;
import vo.User;

import java.sql.*;
import java.util.ArrayList;

public class BookDao {

    public BOOK queryuser(String id) throws Exception {
        ArrayList users = new ArrayList();
        Connection conn = null;
        BOOK book1 = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String sql = "select bookName,context,price from    bookinfo where bookid = " + id;
            conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                BOOK book = new BOOK(rs.getString("bookName"), rs.getString("context"), rs.getString("price"));
//                users.add(use);
                book1 = book;
                return book;
            }
            rs.close();
            pstat.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book1;
    }
}
