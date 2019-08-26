package bean;

public class Ldf_GetBookInfo {
    private String bookId;
    private String bookName;
    private String context;
    private String price;
    private String author;
    private String booktypeId;
    private String booktypeName;
    private String smallImg;
    private String pbName;
    private String pbDate;
    private String booknum;

    public String getBookId(){
        return bookId;
    }
    public void setBookId(String bookId){
        this.bookId = bookId;
    }
    public String getBookName(){
        return bookName;
    }
    public void setBookName(String bookName){
        this.bookName = bookName;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBooktypeId() {
        return booktypeId;
    }

    public void setBooktypeId(String booktypeId) {
        this.booktypeId = booktypeId;
    }

    public String getBooktypeName() {
        return booktypeName;
    }

    public void setBooktypeName(String booktypeName) {
        this.booktypeName = booktypeName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }

    public String getPbName() {
        return pbName;
    }

    public void setPbName(String pbName) {
        this.pbName = pbName;
    }

    public String getPbDate() {
        return pbDate;
    }

    public void setPbDate(String pbDate) {
        this.pbDate = pbDate;
    }

    public String getBooknum() {
        return booknum;
    }

    public void setBooknum(String booknum) {
        this.booknum = booknum;
    }
}
