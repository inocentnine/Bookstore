package vo;

import java.util.Date;

public class Order {
    private int id;
    private String bookname;
    private String date;
    private int num;
    public Order(int id, String bookname, String date, int num){
        this.id = id;
        this.bookname = bookname;
        this.date = date;
        this.num = num;
    }

    public String getBookname() {
        return bookname;
    }

    public String getDate() {
        return date;
    }

    public int getId() {
        return id;
    }

    public int getNum() {
        return num;
    }
}
