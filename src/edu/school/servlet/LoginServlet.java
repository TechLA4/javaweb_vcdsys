package edu.school.servlet;

import edu.school.entity.Admin;
import edu.school.entity.Student;
import edu.school.service.AdminService;

import edu.school.service.StudentService;
import edu.school.service.impl.AdminServiceImpl;
import edu.school.service.impl.StudentServiceImpl;


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
	private StudentService service=  new StudentServiceImpl();
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
				   Student student=service.login(username,pwd);
				   System.out.println(username+pwd+"type=1"+student);
				   if(student==null){
					   request.setAttribute("msg","学号不存在或者密码错误"); //绑定参数
					   request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
				   }else {
					   request.getSession().setAttribute("student", student);
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
