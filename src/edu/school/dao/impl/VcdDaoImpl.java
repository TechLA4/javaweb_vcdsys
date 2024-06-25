package edu.school.dao.impl;

import edu.school.dao.VcdDao;
import edu.school.entity.*;
import edu.school.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VcdDaoImpl implements VcdDao {

    private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());
    @Override
    public int queryCount() {
        String sql="select count(*) from vcd";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Vcd> findAllByPage(PageTool pageTool) {
        String sql="select * from vcd limit ?,?";
        List<Vcd> vcds=null;
        try {
            vcds=runner.query(sql,new BeanListHandler<Vcd>(Vcd.class),pageTool.getStartIndex(),pageTool.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vcds;
    }

    @Override
    public List<Vcd> findVcdByid(String vcdNo) {
        String sql="select * from vcd where 1=1 ";
        List<Vcd> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (vcdNo != "") {

            sql += " and vcdNo like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + vcdNo + "%");
        }
        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params, new BeanListHandler<Vcd>(Vcd.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updateVcd(Vcd vcd) {
        try {//执行更改
            runner.update("update vcd set vcdNo=?, vcdName=?,profile=?,creatTime=?,price=? where id=?",
                    vcd.getVcdNo(),vcd.getVcdName(),vcd.getProfile(),vcd.getCreatTime(),vcd.getPrice(),vcd.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
        return 1;
    }

    @Override
    public List<Vcd> findVcdByNameOrId(String vcdNo, String vcdName) {
        String sql="select * from vcd where 1=1 ";
        List<Vcd> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (vcdNo != "") {

            sql += " and vcdNo like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + vcdNo + "%");
        }
        if (vcdName != "") {
            //如果用户输入的name不为空，那需要进行字符串拼接
            sql += " and vcdName like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + vcdName + "%");
        }
        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params, new BeanListHandler<Vcd>(Vcd.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(int id) {
        try {
            //执行删除的sql
            runner.update("delete from vcd where id=? ",id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }

    @Override
    public int addVcd(Vcd vcd) {
        try {
            //执行插入sql
            runner.update("insert into vcd(vcdNo,vcdName,profile,creatTime,price,stock) values (?,?,?,?,?,?)",
                    vcd.getVcdNo(),vcd.getVcdName(),vcd.getProfile(),vcd.getCreatTime(),vcd.getPrice(),vcd.getStock());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;
    }

    @Override
    public List<User> findJhxx(PageTool pageTool) {
        String sql="select * from user limit ?,?";
        List<User> users=null;
        try {
            users=runner.query(sql,new BeanListHandler<User>(User.class),pageTool.getStartIndex(),pageTool.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public int queryCountByUser() {
        String sql="select count(*) from user";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updayeUser(int id) {
        try {//执行更改
            runner.update("update user set flag = 1 where id=?",id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
        return 1;
    }

    @Override
    public int deleteUser(int id) {
        try {
            //执行删除的sql
            runner.update("delete from User where id=? ",id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }

    @Override
    public List<User> findJhxxByNameOrId(String vcdNo, String jyr) {
        String sql="select * from user where 1=1 ";
        List<User> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (vcdNo != "") {

            sql += " and vcdNo like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + vcdNo + "%");
        }
        if (jyr != "") {
            //如果用户输入的name不为空，那需要进行字符串拼接
            sql += " and jyr like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + jyr + "%");
        }
        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params, new BeanListHandler<User>(User.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int queryCountByBuy() {
        String sql="select count(*) from buy";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler());
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Buy> findBuy(PageTool pageTool) {
        String sql="select * from buy limit ?,?";
        List<Buy> users=null;
        try {
            users=runner.query(sql,new BeanListHandler<Buy>(Buy.class),pageTool.getStartIndex(),pageTool.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<Buy> findGmrByNameOrId(String vcdNo, String gmr) {
        String sql="select * from buy where 1=1 ";
        List<Buy> list=null;
        //todo 使用JavaBean对象的list集合的实现类 BeanListHandler类封装
        List<String> list1 = new ArrayList<String>();
        if (vcdNo != "") {

            sql += " and vcdNo like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + vcdNo + "%");
        }
        if (gmr != "") {
            //如果用户输入的name不为空，那需要进行字符串拼接
            sql += " and gmr like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + gmr + "%");
        }
        Object[] params = list1.toArray();
        try {
            list=runner.query(sql, params, new BeanListHandler<Buy>(Buy.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int deleteByBuy(int id) {
        try {
            //执行删除的sql
            runner.update("delete from buy where id=? ",id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }

    @Override
    public List<VcdBuyRecord> findVcdBetween(String stime, String etime) {


        return null;
    }
}
