package com.neu.cart.controller;

import com.neu.cart.biz.CartBiz;
import com.neu.cart.entity.Cart;
import com.neu.goods.biz.GoodsBiz;
import com.neu.goods.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

@Controller//声明该类是一个控制器
@RequestMapping("cart") //映射请求，浏览器想要找到该控制器的方法需要先通过RequestMapping：http://localhost:8081/user

public class CartController {
    @Autowired
    private GoodsBiz goodsBiz;
    @Autowired
    private CartBiz cartBiz;
    //添加到购物车
    @RequestMapping(value="/addCart")
    @ResponseBody
    public boolean addCart(int gid, HttpServletRequest request){

        String uname=String.valueOf(request.getSession().getAttribute("username"));
        Cart cart1=cartBiz.findByUname_Gid(uname,gid);
        if(cart1!=null){
            int gnum=cart1.getGnum();
            int gnum1=gnum+1;
            String gprice=cart1.getGprice();
            double sum=Double.parseDouble(gprice)*gnum1;
            boolean so=cartBiz.updateCart(uname,gid,gnum1,sum);
            return so;
        }else{
            Goods goods = goodsBiz.findById(gid);
            String gimage = goods.getGimage();
            String gname = goods.getGname();
            String gprice = goods.getGprice();
            double sum=Double.parseDouble(gprice)*1;
            int gnum=1;
            Cart cart = new Cart(uname, gid, gimage, gname, gprice,sum,gnum);
            boolean bo = cartBiz.addCart(cart);
            return bo;
        }
    }
    @RequestMapping("/findCart")
    public String findCart(Integer index, ModelMap map,HttpServletRequest request){
        if (index==null){
            index=1;
        }
        int size=2;
        String uname=(String)request.getSession().getAttribute("username");
        //调用分页的方法
        List<Cart> list =cartBiz.findCart(index,size,uname);
        //计算总记录数
        int count=cartBiz.count(uname);
        //request.getSession().setAttribute("count",count);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count",count);
        return "shopCart";

    }
    @RequestMapping("/findCart1")
    public String findCart1(Integer index, ModelMap map,HttpServletRequest request){
        if (index==null){
            index=1;
        }
        int size=2;
        String uname=(String)request.getSession().getAttribute("username");
        //调用分页的方法
        List<Cart> list =cartBiz.findCart(index,size,uname);
        //计算总记录数
        int count=cartBiz.count(uname);
        //request.getSession().setAttribute("count",count);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //计算订单总价
        double totalSum=cartBiz.totalSum(uname);
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count",count);
        map.put("totalSum",totalSum);
        return "payMoney";

    }
    @RequestMapping("/deleteCart")
    @ResponseBody
    public boolean deleteCart(int gid){
        return cartBiz.deleteCart(gid);

    }
}
