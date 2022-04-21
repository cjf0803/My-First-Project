package com.neu.user.mapper;

import com.neu.user.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    //分页显示所有员工信息，传两个参数，index:当前页，size：每页显示条数
    //将参数封装到map中
    public List<User> findUser(Map<String,Object> map);
    //查询总记录数
    public int count();
    //根据id删除记录
    public boolean deleteUser(int userid);
    //根据id修改记录
    public void updateUser(User user);
    //根据id查找记录
    public User findById(int userid);
    //用户登陆
    public User login(@Param("uname")String uname,@Param("upwd") String upwd );
    //用户注册
    public boolean regist(User user);
    //模糊查询
    public List<User> findUserMo(Map<String,Object> map);

    //模糊查询总记录数
    public int countMo(Map<String,Object> map);

}
