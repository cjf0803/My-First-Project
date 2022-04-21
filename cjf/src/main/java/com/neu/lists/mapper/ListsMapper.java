package com.neu.lists.mapper;


import com.neu.cart.entity.Cart;
import com.neu.lists.entity.Lists;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ListsMapper {

    //添加到订单
    public boolean addLists(Lists lists);
    //分页显示所有员工信息，传两个参数，index:当前页，size：每页显示条数
    //将参数封装到map中
    public List<Lists> findLists(Map<String,Object> map);
    //查询订单总记录数
    public int count();
    //查询购物车总记录数
    public int count1();
    //根据id删除记录
    public boolean deleteLists(int lid);
    //根据id修改记录
    public void updateLists(Lists lists);
    //根据id查找记录
    public Lists findByLid(int lid);
    //根据uname查找记录
    public Lists findByUname1(String uname);
    //模糊查询
    public List<Lists> findListsMo(Map<String,Object> map);

    //模糊查询总记录数
    public int countMo(Map<String,Object> map);
    //根据用户名查询订单
    public List<Cart> findByUname(String uname);
    //查询所有购买记录
    public List<Cart> findListsAllDetails(Map<String,Object> map);



}
