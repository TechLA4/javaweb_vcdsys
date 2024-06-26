package vcd.system.service.impl;

import vcd.system.dao.UserDao;
import vcd.system.dao.impl.UserDaoImpl;
import vcd.system.entity.*;
import vcd.system.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();
    @Override
    public Vcd queryById(Integer id) {
        return dao.queryById(id);
    }

    @Override
    public int addSubVcd(User record) {
        return dao.addSubVcd(record);
    }

    @Override
    public int queryCountByJy(String stuno) {
        return dao.queryCountByJy(stuno);
    }

    @Override
    public List<User> findMyJyxx(PageTool pageTool, String stuno) {
        return dao.findMyJyxx(pageTool,stuno);
    }

    @Override
    public List<User> findMyJyxxByid(String vcdNo, String vcdName, String stuno) {
        return dao.findMyJyxxByid(vcdNo,vcdName,stuno);
    }

    @Override
    public int queryCountByBuy(String stuno) {
        return dao.queryCountByBuy(stuno);
    }

    @Override
    public List<Buy> findBuyByPage(PageTool pageTool, String stuno) {
        return dao.findBuyByPage(pageTool,stuno);
    }

    @Override
    public List<Buy> findBuyByUser(String vcdNo, String vcdName) {
        return dao.findBuyByUser(vcdNo,vcdName);
    }

    @Override
    public int delete(int id, String stuno) {
        return dao.delete(id,stuno);
    }

    @Override
    public Customer findByStuno(String stuno) {
        return dao.findByStuno(stuno);
    }

    @Override
    public int buyVcd(Buy buy) {
        return dao.buyVcd(buy);
    }
}
