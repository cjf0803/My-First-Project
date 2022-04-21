package com.neu.user.biz.impl;


import com.neu.user.biz.UserBiz;
import com.neu.user.entity.User;
import com.neu.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userBiz")
public class UserBizImpl implements UserBiz {
    @Autowired //注解实现为成员变量自动装配
    private UserMapper userMapper;
     //覆盖一个方法进行重写
    @Override
    public List<User> findUser(int index, int size){
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("index",index);
        map.put("size",size);
        List<User>list =userMapper.findUser(map);
        return list;
    }

    @Override
    public  int count(){
        int count=userMapper.count();
        return  count;
    }

    @Override
    public boolean deleteUser(int userid) {
        return userMapper.deleteUser(userid);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public User findById(int userid) {
        return userMapper.findById(userid);
    }

    @Override
    public User login(String uname, String upwd) {
        User user =userMapper.login(uname,upwd);
        return user;
    }

    @Override
    public boolean regist(User user) {
        return userMapper.regist(user);
    }

    @Override
    public List<User> findUserMo(int index, int size, String uname) {
        Map<String,Object> map=new HashMap<String,Object>();
        //将参数传入map
        map.put("index",index);
        map.put("size",size);
        map.put("uname",uname);
        List<User> list=userMapper.findUserMo(map);

        return list;
    }

    @Override
    public int countMo(String uname) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("uname",uname);

        return  userMapper.countMo(map);
    }

}
