package dao;

import bean.Ldf_GetBookInfo;

import java.sql.*;


public class Ldf_BookInfomation {
    private String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
    private String user = "root";
    private String password = "password";

    public Ldf_GetBookInfo bookinfo(String s) throws Exception {

        Connection conn=null;
        Ldf_GetBookInfo show = new Ldf_GetBookInfo();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String sql = "select * from bookinfo" +
                    " where bookId= ?";
            String bookID = s;
            conn = DriverManager.getConnection(url,user,password);
            PreparedStatement pstat = conn.prepareStatement(sql);
            pstat.setString(1,bookID);
            ResultSet rs = pstat.executeQuery();

            while (rs.next()) {
                show.setBookName(rs.getString("bookName"));
                show .setContext(rs.getString("context"));
                show.setBookId(rs.getString("bookId"));
                show.setPrice(rs.getString("price"));
                show.setBooktypeId(rs.getString("booktypeId"));
                show.setAuthor(rs.getString("author"));
                show.setPbName(rs.getString("pbName"));
                show.setPbDate(rs.getString("pbDate"));
                show.setBooknum(rs.getString("booknum"));
                show.setSmallImg(rs.getString("smallImg"));
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
        return show;
    }
}
