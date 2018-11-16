package me.iwts.bean;

public class TourismOrder {
    private String id;
    private String account;
    private int tourismId;

    public TourismOrder(){ }
    public TourismOrder(String id,String account,int tourismId){
        this.id = id;
        this.account = account;
        this.tourismId = tourismId;
    }

    public void setId(String id) {
        this.id = id;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public void setTourismId(int tourismId) {
        this.tourismId = tourismId;
    }

    public String getId() {
        return id;
    }
    public String getAccount() {
        return account;
    }
    public int getTourismId() {
        return tourismId;
    }
}
