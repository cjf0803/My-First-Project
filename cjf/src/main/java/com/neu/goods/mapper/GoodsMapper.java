package com.neu.goods.mapper;


import com.neu.goods.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface GoodsMapper {
    //分页显示所有员工信息，传两个参数，index:当前页，size：每页显示条数
    //将参数封装到map中
    public List<Goods> findGoods(Map<String,Object> map);
    //查询总记录数
    public int count();
    //根据id删除记录
    public boolean deleteGoods(int gid);
    //根据id修改记录
    public void updateGoods(Goods goods);
    //根据id查找记录
    public Goods findById(int gid);
    //模糊查询
    public List<Goods> findGoodsMo(Map<String,Object> map);

    //模糊查询总记录数
    public int countMo(Map<String,Object> map);
    //根据图片或者商品id查询商品
    public List<Goods> findByGimage(Map<String,Object> map);
    //添加商品
    public boolean addGoods(Goods goods);


}


