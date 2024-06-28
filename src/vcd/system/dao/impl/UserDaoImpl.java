package vcd.system.dao.impl;

import vcd.system.dao.UserDao;
import vcd.system.entity.*;
import vcd.system.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

    @Override
    public Vcd queryById(Integer id) {
        try {//返回查询的信息
            return runner.query("select * from vcd where id=?", new BeanHandler<Vcd>(Vcd.class),id);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
    }

    @Override
    public int addSubVcd(User user) {
        try {
            //执行插入sql
            runner.update("insert into user(vcdNo,vcdName,jyr,ghsj,jysj,note,userNo,flag) values (?,?,?,?,?,?,?,?)",
                    user.getVcdNo(),user.getVcdName(),user.getJyr(),user.getGhsj(),user.getJysj(),user.getNote(),user.getStuno(),user.getFlag());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;
    }

    @Override
    public int queryCountByJy(String stuno) {
        String sql="select count(*) from user where userNo = ?";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler(),stuno);
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> findMyJyxx(PageTool pageTool, String stuno) {
        String sql="select * from user where userNo=? limit ?,?";
        List<User> list=null;
        try {
            list=runner.query(sql,new BeanListHandler<User>(User.class),stuno,pageTool.getStartIndex(),pageTool.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public List<User> findMyJyxxByid(String vcdNo, String vcdName, String stuno) {
        String sql="select * from user where  flag = 0  ";
        List<User> list=null;
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

        if (stuno != "") {
            //如果用户输入的name不为空，那需要进行字符串拼接
            sql += " and userNo like  ? ";
            //将用户输入的参数添加到集合
            list1.add("%" + stuno + "%");
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
    public int queryCountByBuy(String stuno) {
        String sql="select count(*) from buy where stuno = ?";
        try {
            Long count =  (Long) runner.query(sql, new ScalarHandler(),stuno);
            //将long的类型转成int类型
            return count.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Buy> findBuyByPage(PageTool pageTool, String stuno) {
        String sql="select * from buy where stuno=? limit ?,?";
        List<Buy> buys=null;
        try {
            buys=runner.query(sql,new BeanListHandler<Buy>(Buy.class),stuno,pageTool.getStartIndex(),pageTool.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return buys;
    }

    @Override
    public List<Buy> findBuyByUser(String vcdNo, String vcdName) {
        String sql="select * from buy where 1=1 ";
        List<Buy> list=null;
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
            list=runner.query(sql, params, new BeanListHandler<Buy>(Buy.class));
            System.out.println(list.size());
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(int id,String stuno) {
        try {
            //执行删除的sql
            runner.update("delete from buy where id=? and stuno = ?",id,stuno);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }

        return 1;//删除成功返回1表示结束
    }

    @Override
    public Customer findByStuno(String stuno) {
        try {//返回查询的信息
            return runner.query("select * from customer where stuno=?", new BeanHandler<Customer>(Customer.class),stuno);
        } catch (SQLException e) {
            throw new RuntimeException(e);//抛出运行异常
        }
    }

    @Override
    public int buyVcd(Buy buy) {
        try {
            //执行插入sql
            runner.update("insert into buy(vcdNo,gmr,stuno,vcdName,creatTime,price) values (?,?,?,?,?,?)",
                    buy.getVcdNo(),buy.getGmr(),buy.getStuNo(),buy.getVcdName(),buy.getCreatTime(),buy.getPrice());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 1;
    }
}
