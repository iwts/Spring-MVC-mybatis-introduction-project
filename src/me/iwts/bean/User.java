package me.iwts.bean;

import org.hibernate.validator.constraints.Email;
import javax.validation.constraints.Size;

public class User {
    //账号、密码、手机号、邮箱（可选）、用户名（可选，不选则用账号代替）、是否为会员、会员截止日期
    @Size(min = 6,max = 16,message = "账号不能为空，位数要为6-16位")
    private String account;
    @Size(min = 6,max = 16,message = "密码不能为空，位数要为6-14位")
    private String passwd;
    @Size(min = 11,max = 11,message = "手机不能为空，手机号码格式错误")
    private String phone;
    @Email(message = "邮箱格式错误")
    private String email;
    @Size(min = 0,max = 10,message = "昵称不能大于10位")
    private String userName;

    public User(){ }
    public User(String account,String passwd,String phone,String email,String userName){
        this.account = account;
        this.passwd = passwd;
        this.email = email;
        this.phone = phone;
        this.userName = userName;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }
    public String getAccount() {
        return account;
    }
    public String getPasswd() {
        return passwd;
    }
    public String getPhone() {
        return phone;
    }
    public String getUserName() {
        return userName;
    }
}

