package edu.school.servlet;

import edu.school.entity.*;
import edu.school.service.UserService;
import edu.school.service.VcdService;
import edu.school.service.impl.UserServiceImpl;
import edu.school.service.impl.VcdServiceImpl;
import edu.school.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;


/**
 * vcd
 */
public class VcdServlet extends BaseServlet {

	private VcdService service = new VcdServiceImpl();
	private UserService userService = new UserServiceImpl();

	//分页查询vcd信息
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
		int totalCount=service.queryCount();
		//2.获取的当前页码,这个是从页面获取的
		String currentPage = request.getParameter("currentPage");
		PageTool pageTool=new PageTool(totalCount, currentPage);
		List<Vcd> vcdList=service.findAllByPage(pageTool);
		//2.存储到域对象中
		request.setAttribute("vcdList", vcdList);
		//将分页信息存储
		request.setAttribute("pageTool", pageTool);
		//将模糊查询的结构存储起来
		//3.通过请求转发
		request.getRequestDispatcher("/WEB-INF/vcd/vcdList.jsp").forward(request, response);
	}

	//查看编号
	protected void findVcdByid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
		String vcdNo = request.getParameter("vcdNo");
		List<Vcd> list = service.findVcdByid(vcdNo);
		if (null == list || list.size() == 0) {
			request.setAttribute("msg", "无此信息");
			request.getRequestDispatcher("/WEB-INF/vcd/vcdListById.jsp").forward(request, response);
		} else {
			request.removeAttribute("msg");
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/vcd/vcdListById.jsp").forward(request, response);
		}
	}

	//分页查询vcd
	protected void vcdList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到注册界面
		int totalCount=service.queryCount();
		//2.获取的当前页码,这个是从页面获取的
		String currentPage = request.getParameter("currentPage");
		PageTool pageTool=new PageTool(totalCount, currentPage);
		List<Vcd> vcdList=service.findAllByPage(pageTool);
		//2.存储到域对象中
		request.setAttribute("vcdList", vcdList);
		//将分页信息存储
		request.setAttribute("pageTool", pageTool);
		//将模糊查询的结构存储起来
		//3.通过请求转发
		request.getRequestDispatcher("/WEB-INF/vcd/vcd_list.jsp").forward(request, response);
	}

	//根据id查询vcd
	protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
		int id=WebUtils.parseInt(request.getParameter("id"),0);
		Vcd vcd=userService.queryById(id);
		request.setAttribute("vcd",vcd);

		request.getRequestDispatcher("/WEB-INF/vcd/edit_vcd.jsp").forward(request,response);
	}


	protected void updateVcd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//更改

		int id= WebUtils.parseInt(request.getParameter("id"),0);
		String vcdNo=request.getParameter("vcdNo");
		String vcdName=request.getParameter("vcdName");
		Double price=Double.parseDouble(request.getParameter("price"));
		String creatTime=request.getParameter("creatTime");
		String profile=request.getParameter("profile");
		Integer stock=Integer.parseInt(request.getParameter("stock"));
		Vcd vcd = new Vcd();
		vcd.setId(id);
		vcd.setVcdNo(vcdNo);
		vcd.setVcdName(vcdName);
		vcd.setPrice(price);
		vcd.setCreatTime(creatTime);
		vcd.setProfile(profile);
		vcd.setStock(stock);
		service.updateVcd(vcd);
		response.sendRedirect(request.getContextPath()+"/VcdServlet?action=vcdList");//重定向防止重复提交哦
	}

	//根据编号查询
	protected void findVcdByNameOrId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
		String vcdNo=request.getParameter("vcdNo");
		String vcdName=request.getParameter("vcdName");
		String buytime = request.getParameter("createtime");
		List<Vcd> list=service.findVcdByNameOrId(vcdNo,vcdName);
		if(null == list || list.size() ==0 ){
			request.setAttribute("msg" ,"无此信息");
			request.getRequestDispatcher("/WEB-INF/books/vcd_list2.jsp").forward(request, response);
		}else {
			request.removeAttribute("msg");
			request.setAttribute("list" ,list);
			request.getRequestDispatcher("/WEB-INF/vcd/vcd_list2.jsp").forward(request, response);
		}
	}

	//删除vcd信息
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
		int id= WebUtils.parseInt(request.getParameter("id"), 0);
		service.delete(id);
		response.sendRedirect(request.getContextPath()+"/VcdServlet?action=vcdList"); //重定向防止重复提交哦
	}

	//跳转到添加界面
	protected void toAddVcd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//跳转到添加用户界面
		request.getRequestDispatcher("/WEB-INF/vcd/add_vcd.jsp").forward(request,response);
	}

	//添加
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//添加
		String vcdNo=request.getParameter("vcdNo");
		String vcdName=request.getParameter("vcdName");
		String creatTime=request.getParameter("creatTime");
		String profile=request.getParameter("profile");
		Double price=Double.parseDouble(request.getParameter("price"));
		Integer stock = Integer.parseInt(request.getParameter("stock"));
		Date nowtime=new Date();
		try {
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String createDate=simpleDateFormat.format(nowtime);
			Vcd vcd = new Vcd();
			vcd.setProfile(profile);
			vcd.setCreatTime(creatTime);
			vcd.setPrice(price);
			vcd.setVcdName(vcdName);
			vcd.setVcdNo(vcdNo);
			vcd.setStock(stock);
			service.addVcd(vcd);
		}catch(Exception e) {};
		response.sendRedirect(request.getContextPath()+"/VcdServlet?action=vcdList");//重定向防止重复提交哦
	}

	//查看编号查看借阅信息
	protected void findJhxx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalCount=service.queryCountByUser();
		//2.获取的当前页码,这个是从页面获取的
		String currentPage = request.getParameter("currentPage");
		PageTool pageTool=new PageTool(totalCount, currentPage);
		List<User> vcdList=service.findJhxx(pageTool);
		//2.存储到域对象中
		request.setAttribute("vcdList", vcdList);
		//将分页信息存储
		request.setAttribute("pageTool", pageTool);
		//将模糊查询的结构存储起来
		//3.通过请求转发
		request.getRequestDispatcher("/WEB-INF/vcd/jyList.jsp").forward(request, response);
	}

	//归还操作
	protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=WebUtils.parseInt(request.getParameter("id"),0);
		service.updayeUser(id);
		//3.通过请求转发
		request.getRequestDispatcher("/WEB-INF/vcd/returnSuccess.jsp").forward(request, response);
	}

	protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=WebUtils.parseInt(request.getParameter("id"),0);
		service.deleteUser(id);
		//3.通过请求转发
		response.sendRedirect(request.getContextPath()+"/VcdServlet?action=findJhxx");//重定向防止重复提交哦
	}

	//查看编号查看借阅信息
	protected void findJhxxByNameOrId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vcdNo=request.getParameter("vcdNo");
		String jyr=request.getParameter("jyr");
		List<User> list=service.findJhxxByNameOrId(vcdNo,jyr);
		if(null == list || list.size() ==0 ){
			request.setAttribute("msg" ,"无此信息");
			request.getRequestDispatcher("/WEB-INF/vcd/jyList2.jsp").forward(request, response);
		}else {
			request.removeAttribute("msg");
			request.setAttribute("list" ,list);
			request.getRequestDispatcher("/WEB-INF/vcd/jyList2.jsp").forward(request, response);
		}
	}

	protected void queryBuyVcd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
		int totalCount=service.queryCountByBuy();
		//2.获取的当前页码,这个是从页面获取的
		String currentPage = request.getParameter("currentPage");
		PageTool pageTool=new PageTool(totalCount, currentPage);
		List<Buy> vcdList=service.findBuy(pageTool);
		//2.存储到域对象中
		request.setAttribute("vcdList", vcdList);
		//将分页信息存储
		request.setAttribute("pageTool", pageTool);
		//将模糊查询的结构存储起来
		//3.通过请求转发
		request.getRequestDispatcher("/WEB-INF/vcd/buyList.jsp").forward(request, response);
	}

	//查看编号查看购买信息
	protected void findBuyByNameOrId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vcdNo=request.getParameter("vcdNo");
		String gmr=request.getParameter("gmr");
		List<Buy> list=service.findGmrByNameOrId(vcdNo,gmr);
		if(null == list || list.size() ==0 ){
			request.setAttribute("msg" ,"无此信息");
			request.getRequestDispatcher("/WEB-INF/vcd/buyList2.jsp").forward(request, response);
		}else {
			request.removeAttribute("msg");
			request.setAttribute("list" ,list);
			request.getRequestDispatcher("/WEB-INF/vcd/buyList2.jsp").forward(request, response);
		}
	}

	protected void deleteByBuy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=WebUtils.parseInt(request.getParameter("id"),0);
		service.deleteByBuy(id);
		//3.通过请求转发
		response.sendRedirect(request.getContextPath()+"/VcdServlet?action=queryBuyVcd");//重定向防止重复提交哦
	}

	protected void queryVcdRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("/WEB-INF/vcd/buyrecord.jsp").forward(request,response);
	}

	protected void queryVcdRecordBetween(String begin,String end){

	}
}
