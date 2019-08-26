package dao;

import vo.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
public class UserDao {
    public ArrayList queryuser() throws Exception {
        ArrayList users = new ArrayList();
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://120.79.154.93:3306/bookstore?characterEncoding=utf8&useSSL=true";
            String sql = "select custName,pwd,custId from customerinfo" ;
             conn = DriverManager.getConnection(url, "root", "password");
            PreparedStatement pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                User use = new User(rs.getString("custName"), rs.getString("pwd"),rs.getString("custId"));
                users.add(use);
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
