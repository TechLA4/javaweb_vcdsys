package edu.school.service.impl;

import edu.school.dao.VcdDao;
import edu.school.dao.impl.VcdDaoImpl;
import edu.school.entity.Buy;
import edu.school.entity.PageTool;
import edu.school.entity.User;
import edu.school.entity.Vcd;
import edu.school.service.VcdService;

import java.util.List;

public class VcdServiceImpl implements VcdService {

    private VcdDao dao = new VcdDaoImpl();
    @Override
    public int queryCount() {
        return dao.queryCount();
    }

    @Override
    public List<Vcd> findAllByPage(PageTool pageTool) {
        return dao.findAllByPage(pageTool);
    }

    @Override
    public List<Vcd> findVcdByid(String vcdNo) {
        return dao.findVcdByid(vcdNo);
    }

    @Override
    public int updateVcd(Vcd vcd) {
        return dao.updateVcd(vcd);
    }

    @Override
    public List<Vcd> findVcdByNameOrId(String vcdNo, String vcdName) {
        return dao.findVcdByNameOrId(vcdNo,vcdName);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public int addVcd(Vcd vcd) {
        return dao.addVcd(vcd);
    }

    @Override
    public List<User> findJhxx(PageTool pageTool) {
        return dao.findJhxx(pageTool);
    }

    @Override
    public int queryCountByUser() {
        return dao.queryCountByUser();
    }

    @Override
    public int updayeUser(int id) {
        return dao.updayeUser(id);
    }

    @Override
    public int deleteUser(int id) {
        return dao.deleteUser(id);
    }

    @Override
    public List<User> findJhxxByNameOrId(String vcdNo, String jyr) {
        return dao.findJhxxByNameOrId(vcdNo,jyr);
    }

    @Override
    public int queryCountByBuy() {
        return dao.queryCountByBuy();
    }

    @Override
    public List<Buy> findBuy(PageTool pageTool) {
        return dao.findBuy(pageTool);
    }

    @Override
    public List<Buy> findGmrByNameOrId(String vcdNo, String gmr) {
        return dao.findGmrByNameOrId(vcdNo,gmr);
    }

    @Override
    public int deleteByBuy(int id) {
        return dao.deleteByBuy(id);
    }
}
