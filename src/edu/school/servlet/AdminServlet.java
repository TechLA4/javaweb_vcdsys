package edu.school.servlet;

import edu.school.entity.*;
import edu.school.service.AdminService;
import edu.school.service.StudentService;
import edu.school.service.impl.AdminServiceImpl;
import edu.school.service.impl.StudentServiceImpl;
import edu.school.utils.WebUtils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private AdminService as=new AdminServiceImpl();
    private StudentService studentService=new StudentServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


    //跳转到管理员信息修改
    protected void toEditAdminInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
        int id= WebUtils.parseInt(request.getParameter("id"),0);
        Admin admin = as.queryAdminByid(id);
        request.setAttribute("admin" ,admin);
        request.getRequestDispatcher("/WEB-INF/books/edit_myinfobyadmin.jsp").forward(request,response);
    }

    //编辑管理员信息
    protected void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改

        int id= WebUtils.parseInt(request.getParameter("id"),0);
        String username=request.getParameter("username");
        String pwd=request.getParameter("pwd");
        String nickname=request.getParameter("nickname");
        Admin admin = new Admin();
        admin.setNickname(nickname);
        admin.setId(id);
        admin.setPwd(pwd);
        admin.setUsername(username);
        as.updateAdmin(admin);
        request.getRequestDispatcher("/WEB-INF/books/editadmin_success.jsp").forward(request,response);

    }

}
