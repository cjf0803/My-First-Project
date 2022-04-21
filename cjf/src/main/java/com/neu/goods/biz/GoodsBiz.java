package com.neu.goods.biz;


import com.neu.goods.entity.Goods;

import java.util.List;

public interface GoodsBiz {
    //定义分页的接口并且传递两个参数，index,size
    public List<Goods> findGoods(int index, int size);
    public int count();

    public boolean deleteGoods(int gid);
    public void updateGoods(Goods goods);
    public Goods findById(int gid);
    public List<Goods> findGoodsMo(int index , int size, String gname);
    public int countMo(String gname);
    public List<Goods> findByGimage(String gimage);
    public boolean addGoods(Goods goods);

}
