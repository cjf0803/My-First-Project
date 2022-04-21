package com.neu.cart.biz;

import com.neu.cart.entity.Cart;

import java.util.List;


public interface CartBiz {
    public boolean addCart(Cart cart);
    public List<Cart> findCart( int index, int size, String uname);
    public int count(String uname);
    public boolean deleteCart(int gid);
    public boolean updateCart(String uname,int gid,int gnum,double sum);
    public Cart findByUname_Gid(String uname,int gid);
    public  double totalSum(String uname);
}
