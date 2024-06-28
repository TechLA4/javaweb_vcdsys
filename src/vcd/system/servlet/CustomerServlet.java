package vcd.system.servlet;

import vcd.system.entity.*;
import vcd.system.service.AdminService;
import vcd.system.service.CustomerService;
import vcd.system.service.impl.AdminServiceImpl;
import vcd.system.service.impl.CustomerServiceImpl;
import vcd.system.utils.WebUtils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CustomerServlet extends BaseServlet {
    private CustomerService service=new CustomerServiceImpl();

    private AdminService as=new AdminServiceImpl();
		
	//添加学生信息
    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加
        String stuno=request.getParameter("stuno");
        String realname=request.getParameter("realname");
        String pwd=request.getParameter("pwd");
        String sex=request.getParameter("sex");
        //String major=request.getParameter("major");
        String phone=request.getParameter("phone");
        Date nowtime=new Date();
        if(service.existsStuno(stuno)){
            request.setAttribute("msg","该账号已存在");
            request.setAttribute("stuno",stuno);
            request.setAttribute("realname",realname);
//            request.setAttribute("major",major);
            request.setAttribute("phone",phone);
            request.setAttribute("pwd",pwd);
            request.getRequestDispatcher("/WEB-INF/customer/edit_customer.jsp").forward(request,response);//返回到登陆界面
        }else {
            try {
                SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
                String createDate=simpleDateFormat.format(nowtime);
                System.out.println("已到达"+createDate);
                service.addCustomer(new Customer(null,stuno,realname,pwd,phone,sex,createDate));
            }catch(Exception e) {};
            response.sendRedirect(request.getContextPath()+"/CustomerServlet?action=list");//重定向防止重复提交哦

        }
    }
    //学生注册
    protected void registe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加
        String stuno=request.getParameter("stuno");
        String realname=request.getParameter("realname");
        String pwd=request.getParameter("pwd");
        String type=request.getParameter("type");
//        String sex=request.getParameter("sex");
//        String major=request.getParameter("major");
        String phone=request.getParameter("phone");

        Date nowtime=new Date();
        System.out.println(stuno);
        System.out.println(realname);
        System.out.println(pwd);
        System.out.println(phone);
        System.out.println(type);
        System.out.println(nowtime);
        if(service.existsStuno(stuno)){
            request.setAttribute("msg","该账号已存在");
            request.setAttribute("stuno",stuno);
            request.setAttribute("realname",realname);
            request.getRequestDispatcher("/WEB-INF/views/registe.jsp").forward(request,response);//返回到登陆界面
        }else {
            try {
                SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
                String createDate=simpleDateFormat.format(nowtime);
                System.out.println("已到达"+createDate);
                service.addCustomer(new Customer(null,stuno,realname,pwd,phone,type,createDate));
            }catch(Exception e) {};
            request.getRequestDispatcher("/WEB-INF/views/registe_success.jsp").forward(request,response);//返回到登陆界面
        }
    }

    	//根据id查询
     protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
         int id=WebUtils.parseInt(request.getParameter("id"),0);
         Customer customer =service.queryById(id);
         request.setAttribute("customer", customer);
       
         request.getRequestDispatcher("/WEB-INF/customer/edit_customer.jsp").forward(request,response);
    }



    //编辑学生信息
    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改

        int id= WebUtils.parseInt(request.getParameter("id"),0);
        String stuno=request.getParameter("stuno");
        String realname=request.getParameter("realname");
        String pwd=request.getParameter("pwd");
        String sex=request.getParameter("sex");
//        String major=request.getParameter("major");
        String phone = request.getParameter("phone");
        String type=request.getParameter("type");
        if (type.equals("1")) {
            service.update(new Customer(id,stuno,realname,pwd,phone,sex,null));
            request.getRequestDispatcher("/WEB-INF/customer/edit_success.jsp").forward(request,response);
            //response.sendRedirect(request.getContextPath()+"/StudentServlet?action=findMyInfo&stuno="+stuno);//重定向防止重复提交哦
        }else {
            service.update(new Customer(id,stuno,realname,pwd,phone,sex,null));
            response.sendRedirect(request.getContextPath()+"/CustomerServlet?action=list");//重定向防止重复提交哦
        }



    }

    //分页查询学生信息
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
        int totalCount=service.queryCount();
        //2.获取的当前页码,这个是从页面获取的
        String currentPage = request.getParameter("currentPage");
        PageTool pageTool=new PageTool(totalCount, currentPage);

        List<Customer> customerList =service.findAllByPage(pageTool);
        //2.存储到域对象中
        request.setAttribute("customerList", customerList);
        //将分页信息存储
        request.setAttribute("pageTool", pageTool);
        //将模糊查询的结构存储起来

        //3.通过请求转发
        request.getRequestDispatcher("/WEB-INF/customer/customer_list.jsp").forward(request, response);

    }
    //删除学生信息
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
        int id=WebUtils.parseInt(request.getParameter("id"),0);
        System.out.println("id:"+id);
        service.delete(id);
        System.out.println("meizhixing");
        response.sendRedirect(request.getContextPath()+"/CustomerServlet?action=list"); //重定向防止重复提交哦
    }
    //根据编号和姓名查询
    protected void findByMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String stuno=request.getParameter("stuno");
        String realname=request.getParameter("realname");
        List<Customer> list=service.findByMap(stuno,realname);
        if(null == list || list.size() ==0 ){
            request.setAttribute("msg" ,"无此信息");
            request.getRequestDispatcher("/WEB-INF/customer/list_customer.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("list" ,list);
            request.getRequestDispatcher("/WEB-INF/customer/list_customer.jsp").forward(request, response);
        }
    }
    
  //跳转到添加学生界面
    protected void toAddCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/customer/edit_customer.jsp").forward(request,response);
    }
    //跳转到注册学生界面
    protected void toRegiste(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/views/registe.jsp").forward(request,response);
    }

    //跳转到学生信息修改
    protected void toEditCustomerInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        request.getRequestDispatcher("/WEB-INF/customer/edit_myinfo.jsp").forward(request,response);
    }

}
