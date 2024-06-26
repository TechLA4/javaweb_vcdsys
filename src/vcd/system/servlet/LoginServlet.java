package vcd.system.servlet;

import vcd.system.entity.Admin;
import vcd.system.entity.Customer;
import vcd.system.service.AdminService;

import vcd.system.service.CustomerService;
import vcd.system.service.impl.AdminServiceImpl;
import vcd.system.service.impl.CustomerServiceImpl;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * 处理登录得请求
 */
public class LoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService service=  new CustomerServiceImpl();
	private AdminService as=new AdminServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    //登录操作
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//处理登录
        String username = request.getParameter("username").trim();//接收学号/工号
        String pwd = request.getParameter("pwd").trim();
        int type=Integer.parseInt(request.getParameter("type").trim());
	       switch (type) {
	       case 1:
				   Customer customer =service.login(username,pwd);
				   System.out.println(username+pwd+"type=1"+ customer);
				   if(customer ==null){
					   request.setAttribute("msg","帐号不存在或者密码错误"); //绑定参数
					   request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
				   }else {
					   request.getSession().setAttribute("customer", customer);
					   request.getSession().setAttribute("type", 1);
					   request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request,response);
				   }
				   break;
			 case 2:
				 Admin admin=as.login(username,pwd);
				   System.out.println(username+pwd+"type=1"+username);
				   if(admin==null){
					   request.setAttribute("msg","管理员工号不存在或者密码错误"); //绑定参数
					   request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
				   }else {
					   request.getSession().setAttribute("admin", admin);
					   request.getSession().setAttribute("type", 2);
					   request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request,response);
				   }
				   break;

	       }
    }
    
  //首页
  	protected void toConsole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
          request.getRequestDispatcher("/WEB-INF/views/console.jsp").forward(request,response);
  	}

  	//注销登录
  	 protected void loginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//退出
  	      request.getSession().invalidate();
  	      request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
  	  }
	//去登录
	protected void toLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//退出
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
	}
}
