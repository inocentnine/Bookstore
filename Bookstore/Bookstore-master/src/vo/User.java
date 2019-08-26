package vo;

public class User {
    private String username;
    private String password;
    private String userid;

    public User(String username, String password, String userid) {
        this.username=username;
        this.password=password;
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setId(String userid) { this.userid = userid;   }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    public String getId() {
        return userid;
    }
}