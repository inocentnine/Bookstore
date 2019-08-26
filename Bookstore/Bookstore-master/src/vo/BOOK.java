package vo;

public class BOOK {


    private String name;
    private String price;
    private String context;
    public BOOK(String name, String context, String price){
        this.name = name;
        this.price = price;
        this.context = context;
    }

    public String getContext() {
        return context;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }


}
