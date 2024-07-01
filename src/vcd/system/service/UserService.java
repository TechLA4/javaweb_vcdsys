package vcd.system.service;

import vcd.system.entity.*;

import java.util.List;

//UserService
public interface UserService {

    public Vcd queryById(Integer id);//根据id查询

    public int addSubVcd(User record);//添加借阅

    public int queryCountByJy(String stuno);

    public List<User> findMyJyxx(PageTool pageTool,String stuno);//条件查询

    public List<User> findMyJyxxByid(String vcdNo, String vcdName, String stuno);//条件查询

    public int queryCountByBuy(String stuno);

    public List<Buy> findBuyByPage(PageTool pageTool,String stuno);//分页

    public List<Buy> findBuyByUser(String vcdNo, String vcdName,String stuno);//条件查询

    public int delete(int id,String stuno);

    public Customer findByStuno(String stuno);

    public int buyVcd(Buy buy);

}
