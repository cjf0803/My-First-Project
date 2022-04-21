package com.neu.cart.entity;

public class Cart {
    private String uname;
    private int gid;
    private String gimage;
    private String gname;
    private String gprice;
    private double sum;
    private int gnum;

    public Cart() {

    }

    public Cart(String uname, int gid, String gimage, String gname, String gprice, double sum, int gnum) {
        this.uname = uname;
        this.gid = gid;
        this.gimage = gimage;
        this.gname = gname;
        this.gprice = gprice;
        this.sum = sum;
        this.gnum = gnum;
    }

    public Cart(String uname, int gid, String gimage, String gname, String gprice) {
        this.uname = uname;
        this.gid = gid;
        this.gimage = gimage;
        this.gname = gname;
        this.gprice = gprice;
    }


    public int getGnum() {
        return gnum;
    }

    public void setGnum(int gnum) {
        this.gnum = gnum;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGimage() {
        return gimage;
    }

    public void setGimage(String gimage) {
        this.gimage = gimage;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGprice() {
        return gprice;
    }

    public void setGprice(String gprice) {
        this.gprice = gprice;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }
}
