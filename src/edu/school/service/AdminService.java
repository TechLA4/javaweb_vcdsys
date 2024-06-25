package edu.school.service;

import edu.school.entity.*;

import java.util.List;

public interface AdminService {
    public Admin login(String username, String pwd);//管理员登陆

    public int updateAdmin(Admin record);//修改管理员信息

    public Admin queryAdminByid(Integer id);//根据id查询管理员信息

}
