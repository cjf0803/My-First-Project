package com.neu.lists.biz;



import com.neu.cart.entity.Cart;
import com.neu.lists.entity.Lists;

import java.util.List;

public interface ListsBiz {
    public boolean addLists(Lists lists);
    //定义分页的接口并且传递两个参数，index,size
    public List<Lists> findLists(int index, int size);
    public int count();
    public int count1();
    public boolean deleteLists(int lid);
    public void updateLists(Lists lists);
    public Lists findByLid(int lid);
    public List<Lists> findListsMo(int index,int size, String uname);
    public int countMo(String uname);
    public List<Cart> findByUname(String uname);
    public List<Cart> findListsALLDetails(int index, int size);
    public Lists findByUname1(String uname);
}
