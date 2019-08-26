package dao;


import bean.Ldf_GetBookInfo;

import java.sql.*;
import java.util.ArrayList;

public class Ldf_ConnectMysql {
    private String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    private String user = "root";
    private String password = "password";

    public ArrayList query( String s) throws Exception {
        ArrayList users = null;
        Connection conn=null;
        Ldf_GetBookInfo book = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String sql = "select bookId,bookName,author,price,booktypeId ,smallImg from bookinfo" +
                    " where booktypeId= ?";
            String categoryID = s;
            conn = DriverManager.getConnection(url,user,password);
            PreparedStatement pstat = conn.prepareStatement(sql);
            pstat.setString(1,categoryID);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                book.setBookName(rs.getString("bookName"));
                book.setBookId(rs.getString("bookId"));
                book.setSmallImg(rs.getString("smallImg"));
                book.setPrice(rs.getString("price"));
                book.setBooktypeId(rs.getString("booktypeId"));
                book.setAuthor(rs.getString("author"));
                users.add(book);
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
