package beans;

public class ordermain {
    private int orderNum;
    private int customerId;
    private int bookId;
    private int num;
    private String xsstatus;

    public int getorderNum(){
        return orderNum;
    }
    public void setorderNum(int orderNum){
        this.orderNum=orderNum;
    }

    public int getcustomerId(){
        return customerId;
    }
    public void setcustomerId(int customerId){
        this.customerId=customerId;
    }

    public int getbookId(){
        return bookId;
    }
    public void setbookId(int bookId){
        this.bookId=bookId;
    }

    public int getnum(){
        return num;
    }
    public void setnum(int num){
        this.num=num;
    }

    public String getxsstatus(){
        return xsstatus;
    }
    public void setxsstatus(String xsstatus){
        this.xsstatus=xsstatus;
    }

}
