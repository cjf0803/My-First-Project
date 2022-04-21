package com.neu.lists.biz.impl;

import com.neu.cart.entity.Cart;
import com.neu.goods.entity.Goods;
import com.neu.lists.biz.ListsBiz;
import com.neu.lists.entity.Lists;
import com.neu.lists.mapper.ListsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("listsBiz")
public class ListsBizImpl implements ListsBiz {
    @Autowired
    private ListsMapper listsMapper;
    @Override
    public boolean addLists(Lists lists) {
        return listsMapper.addLists(lists);
    }

    @Override
    public List<Lists> findLists(int index, int size) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("index", index);
        map.put("size", size);
        List<Lists> list = listsMapper.findLists(map);
        return list;
    }

    @Override
    public int count() {
        return listsMapper.count();
    }

    @Override
    public int count1() {
        return listsMapper.count1();
    }

    @Override
    public boolean deleteLists(int lid) {
        return listsMapper.deleteLists(lid);
    }

    @Override
    public void updateLists(Lists lists) {
        listsMapper.updateLists(lists);
    }

    @Override
    public Lists findByLid(int lid) {
        return listsMapper.findByLid(lid);
    }

    @Override
    public List<Lists> findListsMo(int index, int size, String uname) {
        Map<String,Object> map=new HashMap<String,Object>();
        //将参数传入map
        map.put("index",index);
        map.put("size",size);
        map.put("uname",uname);
        List<Lists> list=listsMapper.findListsMo(map);

        return list;
    }

    @Override
    public int countMo(String uname) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("uname",uname);
        return listsMapper.countMo(map);
    }

    @Override
    public List<Cart> findByUname(String uname) {
        return listsMapper.findByUname(uname);
    }

    @Override
    public List<Cart> findListsALLDetails(int index, int size) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("index", index);
        map.put("size", size);
        return listsMapper.findListsAllDetails(map);
    }

    @Override
    public Lists findByUname1(String uname) {
        return listsMapper.findByUname1(uname);
    }
}
