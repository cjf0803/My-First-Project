package com.neu.user.biz;

import com.neu.user.entity.User;


import java.util.List;

public interface UserBiz {
    //定义分页的接口并且传递两个参数，index,size
    public List<User> findUser(int index, int size);
    public int count();
    public boolean deleteUser(int userid);
    public void updateUser(User user);
    public User findById(int userid);
    public User login(String uname,String upwd);
    public boolean regist(User user);
    public List<User> findUserMo(int index ,int size, String uname);
    public int countMo(String uname);
}
