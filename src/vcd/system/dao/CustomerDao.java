package vcd.system.dao;

import java.util.List;


import vcd.system.entity.*;

public interface CustomerDao {
    public Customer queryByStuno(String stuno);//根据编号查询
    public Customer queryByStunoAndPwd(String stuno, String pwd);//根据编号和密码来登录
    public int save(Customer customer);//保存学生信息
    public Customer query(Integer id);
    public int update(Customer customer);
    public List<Customer> findByMap(String stuno, String realname);//条件查询
    public int delete(Integer id);//根据id数量
    public int queryCount();//统计数量
    public List<Customer> findAllByPage(PageTool pageTool);//分页
}
