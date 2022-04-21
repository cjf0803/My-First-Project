package com.neu.user.entity;

import java.sql.Date;

public class User {
    private int userid;
    private String uname;
    private String upwd;
    private int type;
    private int age;
    private String money;
    private Date time;

    public User() {

    }

    public User(int userid, String uname, String upwd, int type, int age, String money, Date time) {
        this.userid = userid;
        this.uname = uname;
        this.upwd = upwd;
        this.type = type;
        this.age = age;
        this.money = money;
        this.time = time;
    }
    public User(String uname, String upwd, int type) {
        this.uname = uname;
        this.upwd = upwd;
        this.type = type;
    }

    public User(String uname, String upwd) {

        this.uname = uname;
        this.upwd = upwd;

    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
