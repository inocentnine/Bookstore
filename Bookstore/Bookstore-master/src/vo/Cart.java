package vo;

public class Cart {

    private  String bookId;
    private String custId;
    private String price;
    private String context ;
    private String bookname;
    private int booknum;

    public Cart(int booknum,String bookId, String custId, String price, String context, String bookname){
        this.booknum = booknum;
        this.bookId = bookId;
        this.custId = custId;
        this.price = price;
        this.context = context;
        this.bookname = bookname;
    }

    public int getBooknum() {
        return booknum;
    }
    public String getPrice() {
        return price;
    }

    public String getContext() {
        return context;
    }

    public String getBookId() {
        return bookId;
    }

    public String getBookname() {
        return bookname;
    }

    public String getCustId() {
        return custId;
    }
}
