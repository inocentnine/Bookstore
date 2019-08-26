package beans;

public class customerinfo {
    private int custId;
    private String custName;
    private String pwd;
    private String email;
    private String tel;
    private String sex;
    private int age;
    private int balance;
    private int wrong;

    public int getWrong() {
        return wrong;
    }

    public void setWrong(int wrong) {
        this.wrong = wrong;
    }


    public int getcustId(){
        return custId;
    }
    public void setcustId(int custId){
        this.custId=custId;
    }

    public String getcustName(){
        return custName;
    }
    public void setcustName(String custName){
        this.custName=custName;
    }

    public String getpwd(){
        return pwd;
    }
    public void setpwd(String pwd){
        this.pwd=pwd;
    }

    public String getemail(){
        return email;
    }
    public void setemail(String email){
        this.email=email;
    }

    public String gettel(){
        return tel;
    }
    public void settel(String tel){
        this.tel=tel;
    }


    public String getsex(){
        return sex;
    }
    public void setsex(String sex){
        this.sex=sex;
    }

    public int getage(){
        return age;
    }
    public void setage(int age){
        this.age=age;
    }


    public int getbalance(){
        return balance;
    }
    public void setbalance(int balance){
        this.balance=balance;
    }
}
