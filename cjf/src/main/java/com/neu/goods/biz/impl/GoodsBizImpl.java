package com.neu.goods.biz.impl;


import com.neu.goods.biz.GoodsBiz;
import com.neu.goods.entity.Goods;
import com.neu.goods.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("goodsBiz")
public class GoodsBizImpl implements GoodsBiz {
    @Autowired //注解实现为成员变量自动装配

    private GoodsMapper goodsMapper;
    //覆盖一个方法进行重写
    @Override
    public List<Goods> findGoods(int index, int size) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("index", index);
        map.put("size", size);
        List<Goods> list = goodsMapper.findGoods(map);
        return list;
    }

    @Override
    public int count() {
        int count = goodsMapper.count();
        return count;
    }

    @Override
    public boolean deleteGoods(int gid) {
        return goodsMapper.deleteGoods(gid);
    }

    @Override
    public void updateGoods(Goods goods) {
        goodsMapper.updateGoods(goods);
    }

    @Override
    public Goods findById(int gid) {
        return goodsMapper.findById(gid);
    }

    @Override
    public List<Goods> findGoodsMo(int index, int size, String gname) {
        Map<String,Object> map=new HashMap<String,Object>();
        //将参数传入map
        map.put("index",index);
        map.put("size",size);
        map.put("gname",gname);
        List<Goods> list=goodsMapper.findGoodsMo(map);

        return list;
    }

    @Override
    public int countMo(String gname) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("gname",gname);

        return  goodsMapper.countMo(map);
    }

    @Override
    public List<Goods> findByGimage(String gimage) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("gimage",gimage);
        List<Goods> list=goodsMapper.findByGimage(map);
        return list;
    }

    @Override
    public boolean addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }


}