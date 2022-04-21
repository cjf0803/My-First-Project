package com.neu.goods.controller;


import com.neu.cart.biz.CartBiz;
import com.neu.goods.biz.GoodsBiz;
import com.neu.goods.entity.Goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.List;

@Controller//声明该类是一个控制器
@RequestMapping("goods") //映射请求，浏览器想要找到该控制器的方法需要先通过RequestMapping：http://localhost:8081/user

public class GoodsController {
    @Autowired
    private GoodsBiz goodsBiz;
    @Autowired
    private CartBiz cartBiz;
    @RequestMapping("/findGoods")
    public String findGoods(Integer index, ModelMap map){
        if (index==null){
            index=1;
        }
        int size=2;
        //调用分页的方法
        List<Goods> list =goodsBiz.findGoods(index,size);
        //计算总记录数
        int count=goodsBiz.count();
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count",count);
        return "goodsindex";

    }
    @RequestMapping("/findGoodsAllDetails")
    public String findGoodsAllDetails(Integer index, ModelMap map){
        if (index==null){
            index=1;
        }
        int size=2;
        //调用分页的方法
        List<Goods> list =goodsBiz.findGoods(index,size);
        //计算总记录数
        int count=goodsBiz.count();
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        return "goodsdetails_all";

    }
    @RequestMapping("/customerFindGoods")
    public String customerFindGoods(Integer index, ModelMap map, HttpServletRequest request){
        if (index==null){
            index=1;
        }
        int size=3;
        //调用分页的方法
        List<Goods> list =goodsBiz.findGoods(index,size);
        //计算总记录数
        int count=goodsBiz.count();
        //购物车商品数量
        String uname=String.valueOf(request.getSession().getAttribute("username"));
        int count1=cartBiz.count(uname);
        request.getSession().setAttribute("count",count1);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count1",count1);
        return "customerIndex";

    }
    @RequestMapping("/findById")
    @ResponseBody//java对象转为json格式的数据
    public Goods findById(int gid){
        System.out.println(gid);
        Goods goods=goodsBiz.findById(gid);
        return goods;
    }
    @RequestMapping("/deleteGoods")
    @ResponseBody
    public boolean deleteGoods(int gid){
        return goodsBiz.deleteGoods(gid);

    }
    @RequestMapping("/updateGoods")

    public String updateGoods(int gid, String gimage, String gname, String gprice, int count,  Date createtime,String gdesc){
       Goods goods= new Goods(gid,gimage,gname,gprice,count,createtime,gdesc);
        System.out.println(gid);
        goodsBiz.updateGoods(goods);
        return "redirect:/goods/findGoods";

    }

    @RequestMapping(value = "/findGoodsMo")
    public  String findGoodsMo(Integer index,String gname,ModelMap map){
        if(index==null){
            index=1;

        }
        int size=2;
        List<Goods> list=goodsBiz.findGoodsMo(index,size,gname);
        //调用查询总记录的方法
        int count=goodsBiz.countMo(gname);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        map.put("list",list);
        map.put("index",index);
        map.put("gname",gname);
        map.put("totalPage",totalPage);
        return  "findGoodsMo";

    }
    @RequestMapping(value = "/customerFindGoodsMo")
    public  String customerFindGoodsMo(Integer index,String gname,ModelMap map,HttpServletRequest request){
        if(index==null){
            index=1;

        }
        int size=2;
        List<Goods> list=goodsBiz.findGoodsMo(index,size,gname);
        //调用查询总记录的方法
        int count=goodsBiz.countMo(gname);
        //购物车商品数量
        String uname=String.valueOf(request.getSession().getAttribute("username"));
        int count1=cartBiz.count(uname);
        request.getSession().setAttribute("count",count1);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        map.put("list",list);
        map.put("index",index);
        map.put("gname",gname);
        map.put("totalPage",totalPage);
        return  "customerFindGoodsMo";

    }
    @RequestMapping(value = "/findByGimage")
    public String findByGimage(String gimage,ModelMap map){
        List<Goods> list=goodsBiz.findByGimage(gimage);
        map.put("list",list);
        map.put("gimage",gimage);
        return "findGoodsByGimage";
    }
    @RequestMapping(value = "/customerFindByGimage")
    public String customerFindByGimage(String gimage,ModelMap map,HttpServletRequest request){
        System.out.println(gimage);
        //购物车商品数量
        String uname=String.valueOf(request.getSession().getAttribute("username"));
        int count1=cartBiz.count(uname);
        request.getSession().setAttribute("count",count1);
        List<Goods> list=goodsBiz.findByGimage(gimage);
        map.put("list",list);
        map.put("gimage",gimage);
        return "customerGoodsDetails";
    }
    @RequestMapping(value = "/addGoods")
    @ResponseBody
    public boolean addGoods(String gimage,String gname,String gprice,int count,Date createtime,String gdesc){
        Goods goods=new Goods(gimage,gname,gprice,count,createtime,gdesc);
        return goodsBiz.addGoods(goods);
    }

}
