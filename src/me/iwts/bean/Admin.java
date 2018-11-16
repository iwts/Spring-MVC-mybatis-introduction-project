package me.iwts.bean;

public class Admin {
    private int id;
    private String account;
    private String passwd;

    public void setId(int id) {
        this.id = id;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getId() {
        return id;
    }
    public String getAccount() {
        return account;
    }
    public String getPasswd() {
        return passwd;
    }
}
