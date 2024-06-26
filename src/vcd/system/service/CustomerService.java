package vcd.system.service;

import vcd.system.entity.*;

import java.util.List;


public interface CustomerService {
    /*
     判断用户是否存在,返回true表示学生已经存在，返回false表示该学号可以用
    */
    public boolean existsStuno(String stuno);

    public List<Customer> findByMap(String stuno, String realname);//条件查询
    public int queryCount();
    public int update(Customer record);//修改
    public int addCustomer(Customer record);//修改
    public int delete(Integer id);//根据id数量
    public Customer queryById(Integer id);//根据id查询
    public Customer findByStuno(String stuno);//根据学号和
    public Customer login(String stuno, String pwd);//根据学号和密码来登录
    public List<Customer> findAllByPage(PageTool pageTool);//分页
}
