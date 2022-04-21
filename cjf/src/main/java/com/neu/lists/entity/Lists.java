package com.neu.lists.entity;

public class Lists {
    private int lid;
    private String uname;
    private String uphone;
    private String address;
    private double totalsum;

    public Lists() {

    }

    public Lists(int lid, String uname, String uphone, String address, double totalsum) {
        this.lid = lid;
        this.uname = uname;
        this.uphone = uphone;
        this.address = address;
        this.totalsum = totalsum;
    }

    public Lists(String uname, String uphone, String address) {
        this.uname = uname;
        this.uphone = uphone;
        this.address = address;
    }

    public Lists(String uname, String uphone, String address, double totalsum) {
        this.uname = uname;
        this.uphone = uphone;
        this.address = address;
        this.totalsum = totalsum;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotalsum() {
        return totalsum;
    }

    public void setTotalsum(double totalsum) {
        this.totalsum = totalsum;
    }
}
