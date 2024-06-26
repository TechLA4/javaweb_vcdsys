package vcd.system.service.impl;


import vcd.system.dao.AdminDao;
import vcd.system.dao.impl.AdminDaoImpl;
import vcd.system.entity.*;
import vcd.system.service.AdminService;

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
