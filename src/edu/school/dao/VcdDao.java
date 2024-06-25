package edu.school.dao;

import edu.school.entity.*;

import java.util.List;

//vcd
public interface VcdDao {
    public int queryCount();//统计数量
    public List<Vcd> findAllByPage(PageTool pageTool);//分页
    public List<Vcd> findVcdByid(String vcdNo);//条件查询
    public int updateVcd(Vcd vcd);//修改
    public List<Vcd> findVcdByNameOrId(String vcdNo, String vcdName);//条件查询
    public int delete(int id);
    public int addVcd(Vcd vcd);//修改
    public List<User> findJhxx(PageTool pageTool);
    public int queryCountByUser();//统计数量

    public int updayeUser(int id);

    public int deleteUser(int id);
    public List<User> findJhxxByNameOrId(String vcdNo, String jyr);//条件查询

    public int queryCountByBuy();//统计数量

    public List<Buy> findBuy(PageTool pageTool);

    public List<Buy> findGmrByNameOrId(String vcdNo, String gmr);//条件查询

    public int deleteByBuy(int id);

    public List<VcdBuyRecord> findVcdBetween(String stime,String etime);
}
