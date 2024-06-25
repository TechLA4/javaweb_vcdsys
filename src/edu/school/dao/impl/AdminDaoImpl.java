package edu.school.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.school.dao.AdminDao;
import edu.school.entity.*;
import edu.school.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class AdminDaoImpl implements AdminDao {

	private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

	
	//根据用户名和密码查询
	public Admin queryByUsernameAndPwd(String username, String pwd) {
		 try {
	            return runner.query("select * from admin where username=? and pwd=?", new BeanHandler<Admin>(Admin.class),username,pwd);
	        } catch (SQLException e) {
	            throw new RuntimeException(e);//抛出运行异常
	        }
	}


	@Override
	public Admin queryByUsername(String username) {
		try {
			return runner.query("select * from admin where username=? ", new BeanHandler<Admin>(Admin.class),username);
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}
	}


	public int updateAdmin(Admin admin) {//更改管理员信息
		try {//执行更改
			runner.update("update admin set username=?,pwd=?,nickname=? where id=?",
					admin.getUsername(),admin.getPwd(),admin.getNickname(),admin.getId());
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}
		return 1;
	}

	@Override
	public Admin queryAdminByid(Integer id) {
		try {//返回查询的信息
			return runner.query("select * from admin where id=?",new BeanHandler<Admin>(Admin.class),id);
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}
	}

}
