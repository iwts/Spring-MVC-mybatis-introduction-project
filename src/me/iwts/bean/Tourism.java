package me.iwts.bean;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Future;
import java.util.Date;

public class Tourism {
    private int id;
    @NotBlank(message = "团名不能为空")
    private String name;
    @NotBlank(message = "出发地不能为空")
    private String fromAddress;
    @NotBlank(message = "目的地不能为空")
    private String toAddress;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future(message = "必须为未来的日期")
    private Date beginTime;
    private double price;
    private String imageUrl;
    private boolean hot;

    public Tourism(){ }
    public Tourism(int id,String name,String fromAddress,String toAddress,Date beginTime,double price,String imageUrl){
        this.id = id;
        this.name = name;
        this.fromAddress = fromAddress;
        this.toAddress = toAddress;
        this.beginTime = beginTime;
        this.price = price;
        this.imageUrl = imageUrl;
    }
    public Tourism(String name,String fromAddress,String toAddress,Date date, double price){
        this.id = id;
        this.name = name;
        this.fromAddress = fromAddress;
        this.toAddress = toAddress;
        this.beginTime = beginTime;
        this.price = price;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }
    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }
    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public void setHot(boolean hot) {
        this.hot = hot;
    }

    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getFromAddress() {
        return fromAddress;
    }
    public String getToAddress() {
        return toAddress;
    }
    public Date getBeginTime() {
        return beginTime;
    }
    public double getPrice() {
        return price;
    }
    public String getImageUrl() {
        return imageUrl;
    }
    public boolean getHot(){
        return hot;
    }
}
