package com.neu.cart.biz.impl;

import com.neu.cart.biz.CartBiz;
import com.neu.cart.entity.Cart;
import com.neu.cart.mapper.CartMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartBiz")
public class CartBizImpl implements CartBiz {
    @Autowired //注解实现为成员变量自动装配
    private CartMapper cartMapper;

    @Override
    public boolean addCart(Cart cart) {
        return cartMapper.addCart(cart);
    }

    @Override
    public List<Cart> findCart(int index, int size,String uname) {

        List<Cart> list=cartMapper.findCart(index,size,uname);
        return  list;
    }

    @Override
    public int count(String uname) {
        return cartMapper.count(uname);
    }

    @Override
    public boolean deleteCart(int gid) {
        return cartMapper.deleteCart(gid);
    }

    @Override
    public boolean updateCart(String uname,int gid,int gnum,double sum) {
        return cartMapper.updateCart(uname,gid,gnum,sum);
    }

    @Override
    public Cart findByUname_Gid(String uname,int gid) {
        return cartMapper.findByUname_Gid(uname,gid);
    }

    @Override
    public double totalSum(String uname) {
        return cartMapper.totalSum(uname);
    }
}
