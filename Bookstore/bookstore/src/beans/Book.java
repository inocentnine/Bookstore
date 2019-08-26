package beans;

public class Book {
    private String id;
    private String name;
    private String type;
    private String author;
    private String pbName;
    private String context;
    private String img;
    private String price;
    private String pbdate;
    private String booksum;

    public void setId(String id){
        this.id=id;
    }
    public String getId(){
        return id;
    }

    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }

    public void setType(String type){
        this.type=type;
    }
    public String getType(){
        return type;
    }

    public void setAuthor(String author){
        this.author=author;
    }
    public String getAuthor(){
        return author;
    }

    public void setPbName(String pbName){
        this.pbName=pbName;
    }
    public String getPbName(){
        return pbName;
    }

    public void setContext(String context){
        this.context=context;
    }
    public String getContext(){
        return context;
    }

    public void setImg(String img){
        this.img=img;
    }
    public String getImg(){
        return img;
    }

    public void setPrice(String price){
        this.price=price;
    }
    public String getPrice(){
        return price;
    }

    public void setPbdate(String pbdate){
        this.pbdate=pbdate;
    }
    public String getPbdate(){
        return pbdate;
    }

    public void setBooksum(String booksum){
        this.booksum=booksum;
    }
    public String getBooksum(){
        return booksum;
    }
}
