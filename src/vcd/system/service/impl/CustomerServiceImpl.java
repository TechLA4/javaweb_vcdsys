package vcd.system.service.impl;

import vcd.system.dao.CustomerDao;
import vcd.system.dao.impl.CustomerDaoImpl;
import vcd.system.entity.*;
import vcd.system.service.CustomerService;

import java.util.List;



public class CustomerServiceImpl implements CustomerService {
    private CustomerDao dao=new CustomerDaoImpl();

    public boolean existsStuno(String stuno) {
        if(dao.queryByStuno(stuno)==null){
            return false;//表示不可以用
        }
        return true;//表示可以用

    }


    public List<Customer> findByMap(String stuno, String realname) {
        return dao.findByMap(stuno,realname);
    }

    
    public int queryCount() {
        return dao.queryCount();
    }

    
    public int update(Customer record) {
        return dao.update(record);
    }

   @Override
    public int delete(Integer id) {
        System.out.println("fuck");
        return dao.delete(id);
    }

    
    public Customer queryById(Integer id) {
        return dao.query(id);
    }

   
    public Customer findByStuno(String stuno) {
        return dao.queryByStuno(stuno);
    }


	public Customer login(String stuno, String pwd) {
		// TODO Auto-generated method stub
		return dao.queryByStunoAndPwd(stuno, pwd);
	}


    @Override
    public List<Customer> findAllByPage(PageTool pageTool) {
        return dao.findAllByPage(pageTool);
    }


    public int addCustomer(Customer record) {
		// TODO Auto-generated method stub
		return dao.save(record);
	}

	
}
