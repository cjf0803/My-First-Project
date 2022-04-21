package com.neu.user.controller;

import com.neu.user.biz.UserBiz;
import com.neu.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

@Controller//声明该类是一个控制器
@RequestMapping("user") //映射请求，浏览器想要找到该控制器的方法需要先通过RequestMapping：http://localhost:8081/user

public class UserController {
   /* @RequestMapping(value="/index")//映射请求，浏览器想要找到该控制器的方法需要先通过RequestMapping：http://localhost:8081/user/index
    public String index(ModelMap map){//如果要返回一个视图，那么返回值类型必须为String
        map.put("hello","你好springboot");
        return "index";//返回的视图

    }*/
    @Autowired
    private UserBiz userBiz;
    @RequestMapping(value="/index")  //浏览器想要找到该控制器的方法要通过方法上requestMapping:http://localhost:8081/user/index
    public String index(ModelMap map,HttpSession session){  //如果要返回一个视图那么定义的返回值类型必须是String
        map.put("hello","你好springboot");
        String username=(String) session.getAttribute("username");
        return "index";  //返回的视图
    }

    @RequestMapping("/findUser")
    public String findUser(Integer index,ModelMap map){
        if (index==null){
            index=1;
        }
        int size=2;
        //调用分页的方法
        List<User> list =userBiz.findUser(index,size);
        //计算总记录数
        int count=userBiz.count();
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        //将list存入map作用域中
        map.put("list",list);
        map.put("index",index);
        map.put("totalPage",totalPage);
        map.put("count",count);
        return "userindex";

    }
    @RequestMapping("/findById")
    @ResponseBody//java对象转为json格式的数据
    public User findById(int userid){
        System.out.println(userid);
        User user=userBiz.findById(userid);
        return user;
    }
    @RequestMapping("/deleteUser")
    @ResponseBody
    public boolean deleteUser(int userid){
        System.out.println(userid);
        return userBiz.deleteUser(userid);

    }
    @RequestMapping("/updateUser")

    public String updateUser(int userid, String uname, String upwd, int type, int age, String money, Date time){
            User user =new User(userid ,uname,upwd,type,age ,money,time);
            System.out.println(userid);
            userBiz.updateUser(user);
            return "redirect:/user/findUser";

    }
    @RequestMapping(value="/login")
    @ResponseBody//将返回的数据转换为json型
    public User login(String uname, String upwd, HttpServletRequest request){//前台传后台参数，通过参数的自动绑定，前后台参数名一致
        //调用登录的方法
        User user=userBiz.login(uname,upwd);
        if(user!=null){
            String userName=user.getUname();
            request.getSession().setAttribute("username",userName);
        }
        return  user;


    }
    @RequestMapping(value = "/regist")
    @ResponseBody
    public boolean regist(String uname,String upwd,int type){
        User user= new User(uname,upwd,type);
        return userBiz.regist(user);
    }

    @RequestMapping(value = "/findUserMo")
    public  String findUserMo(Integer index,String uname,ModelMap map){
        if(index==null){
            index=1;

        }
        int size=2;
        List<User> list=userBiz.findUserMo(index,size,uname);
        //调用查询总记录的方法
        int count=userBiz.countMo(uname);
        //计算总页数
        int totalPage=count%size==0?count/size:count/size+1;
        map.put("list",list);
        map.put("index",index);
        map.put("uname",uname);
        map.put("totalPage",totalPage);
        return  "findUserMo";

    }
    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpSession session){
        //清除session 中的用户
        session.removeAttribute("username");
        //重定向到登录页面
        return "login";
    }


}
