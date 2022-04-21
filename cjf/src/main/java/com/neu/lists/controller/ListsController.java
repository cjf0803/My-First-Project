package com.neu.lists.controller;

import com.neu.cart.biz.CartBiz;

import com.neu.cart.entity.Cart;
import com.neu.lists.biz.ListsBiz;
import com.neu.lists.entity.Lists;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller//声明该类是一个控制器
@RequestMapping("lists") //映射请求，浏览器想要找到该控制器的方法需要先通过RequestMapping：http://localhost:8081/user
public class ListsController {

    @Autowired
    private ListsBiz listsBiz;
    @Autowired
    private CartBiz cartBiz;

    //添加到购物车
    @RequestMapping(value="/addLists")
    @ResponseBody
    public boolean addList(String uname,String uphone,String address,HttpServletRequest request){
        String uname1=(String) request.getSession().getAttribute("username");
        double totalsum=cartBiz.totalSum(uname1);
        Lists lists=new Lists(uname,uphone,address,totalsum);
        return listsBiz.addLists(lists);
  }
    @RequestMapping("/findLists")
    public String findLists(Integer index, ModelMap map){
        if (index==null){
            index=1;
        }
        int size=2;
        //调用分页的方法
        List<Lists> list=listsBiz.findLists(index,size);
        //计算总记录数
        int count=listsBiz.count();
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("count",count);
        map.put("totalPage",totalPage);
        return "ListsIndex";

    }
    @RequestMapping("/findByLid")
    @ResponseBody//java对象转为json格式的数据
    public Lists findByLid(int lid){
        System.out.println(lid);
       Lists lists=listsBiz.findByLid(lid);
        return lists;
    }
    @RequestMapping("/deleteLists")
    @ResponseBody
    public boolean deleteLists(int lid){
        return listsBiz.deleteLists(lid);

    }
    @RequestMapping("/updateLists")

    public String updateLists(int lid, String uname, String uphone, String address, double totalsum){
        Lists lists= new Lists(lid,uname,uphone,address,totalsum);
        System.out.println(lid);
        listsBiz.updateLists(lists);
        return "redirect:/lists/findLists";

    }
    @RequestMapping(value = "/findListsMo")
    public  String findListsMo(Integer index,String uname,ModelMap map){
        if(index==null){
            index=1;

        }
        int size=2;
        List<Lists> list=listsBiz.findListsMo(index,size,uname);
        //调用查询总记录的方法
        int count=listsBiz.countMo(uname);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        map.put("list",list);
        map.put("index",index);
        map.put("uname",uname);
        map.put("count",count);
        map.put("totalPage",totalPage);
        return  "ListsFindMo";

    }
    @RequestMapping(value = "/findByUname")
    public String findByUname(Integer index,String uname,ModelMap map){
        if (index==null){
            index=1;
       }
        int size=2;
        List<Cart> list=cartBiz.findCart(index,size,uname);
        Lists lists=listsBiz.findByUname1(uname);
        double totalsum=lists.getTotalsum();
        int count=cartBiz.count(uname);
        int totalPage=count%size==0?count/size:count/size+1;
        map.put("list",list);
        map.put("index",index);
        map.put("uname",uname);
        map.put("totalPage",totalPage);
        map.put("count",count);
        map.put("totalsum",totalsum);
        return "ListsFindByUname";
    }
    @RequestMapping("/findListsAllDetails")
    public String findListsAllDetails(Integer index, ModelMap map){
        if (index==null){
            index=1;
        }
        int size=5;
        //调用分页的方法
        List<Cart> list =listsBiz.findListsALLDetails(index,size);
        //计算总记录数
        int count=listsBiz.count1();
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count",count);
        return "ListsAllDetails";

    }
}
