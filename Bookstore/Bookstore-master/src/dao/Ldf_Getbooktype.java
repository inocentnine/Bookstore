package dao;

import bean.Ldf_GetBookInfo;

import java.sql.*;
import java.util.ArrayList;

public class Ldf_Getbooktype {
    private String url = "jdbc:mysql://120.79.154.93:3306/bookstore";
    private String user = "root";
    private String password = "password";

    public ArrayList book() throws Exception {
        Connection conn = null;
        ArrayList bookty = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            Statement stat = conn.createStatement();
            String sql = "select bookTypeId,bookTypeName from booktype";
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                Ldf_GetBookInfo booktype = new Ldf_GetBookInfo();
                booktype.setBooktypeId(rs.getString("bookTypeId"));
                booktype.setBooktypeName(rs.getString("bookTypeName"));
                bookty.add(booktype);
            }
            rs.close();
            pstat.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                    conn = null;
                }
            } catch (Exception ex) {

            }
        }
        return bookty;
    }
}
