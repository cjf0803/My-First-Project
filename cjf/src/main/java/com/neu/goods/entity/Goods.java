package com.neu.goods.entity;

import java.sql.Date;

public class Goods {
    private int gid;
    private String gimage;
    private String gname;
    private String gprice;
    private int count;
    private Date createtime;
    private String gdesc;

    public Goods() {

    }

    public Goods(int gid, String gimage, String gname, String gprice, int count, Date createtime, String gdesc) {
        this.gid = gid;
        this.gimage = gimage;
        this.gname = gname;
        this.gprice = gprice;
        this.count = count;
        this.createtime = createtime;
        this.gdesc = gdesc;
    }

    public Goods(String gimage, String gname, String gprice, int count, Date createtime, String gdesc) {
        this.gimage = gimage;
        this.gname = gname;
        this.gprice = gprice;
        this.count = count;
        this.createtime = createtime;
        this.gdesc = gdesc;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getGdesc() {
        return gdesc;
    }

    public void setGdesc(String gdesc) {
        this.gdesc = gdesc;
    }
}
