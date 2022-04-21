package com.neu.cart.mapper;

import com.neu.cart.entity.Cart;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {
    //添加购物车
    public boolean addCart(Cart cart);
    //将参数封装到map中
    public List<Cart> findCart(int index,int size,String uname);
    //查询总记录数
    public int count(String uname);
    //根据id删除记录
    public boolean deleteCart(int gid);
    // 如果同一个用户重复添加同一个商品那么修改cart表中gnum字段(即修改gum+1),以及sum字段
    public boolean updateCart(String uname,int gid,int gnum,double sum);
    //根据uname 和gid 查找记录
    public Cart findByUname_Gid(String uname,int gid);
    //计算订单总价
    public double totalSum(String uname);
}
