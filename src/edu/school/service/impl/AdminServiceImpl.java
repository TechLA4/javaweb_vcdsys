package edu.school.service.impl;


import edu.school.dao.AdminDao;
import edu.school.dao.impl.AdminDaoImpl;
import edu.school.entity.*;
import edu.school.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
	private AdminDao dao=new AdminDaoImpl();


	public Admin login(String username, String pwd) {
		// TODO Auto-generated method stub
		return dao.queryByUsernameAndPwd(username, pwd);
	}

	public int updateAdmin(Admin record) {
		return dao.updateAdmin(record);
	}

	@Override
	public Admin queryAdminByid(Integer id) {
		return dao.queryAdminByid(id);
	}

}
