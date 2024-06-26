package vcd.system.dao;


import vcd.system.entity.*;

public interface AdminDao {
    public Admin queryByUsernameAndPwd(String username, String pwd);//根据管理员账号和密码来登录
    public Admin queryByUsername(String username);//根据用户名查询
    public int updateAdmin(Admin admin);

    public Admin queryAdminByid(Integer id);//根据id查询管理员信息
}
