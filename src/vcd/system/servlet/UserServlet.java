package vcd.system.servlet;

import vcd.system.entity.*;
import vcd.system.service.UserService;
import vcd.system.service.impl.UserServiceImpl;
import vcd.system.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//用户
public class UserServlet extends BaseServlet {
    private UserService service = new UserServiceImpl();

    //借阅
    protected void insertVcdBySc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        int id = WebUtils.parseInt(request.getParameter("id"), 0);
        Vcd vcd = service.queryById(id);
        request.setAttribute("vcd", vcd);
        request.getRequestDispatcher("/WEB-INF/user/userVcd.jsp").forward(request, response);
    }

    //借阅vcd
    protected void insertVcd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String vcdNo = request.getParameter("vcdNo");
        String vcdName = request.getParameter("vcdName");
        String realname = request.getParameter("realname");
        String stuno = request.getParameter("stuno");
        String ghsj = request.getParameter("ghsj").replace("-","/");


        String note = request.getParameter("note");
        User user = new User();
        user.setVcdName(vcdName);
        user.setVcdNo(vcdNo);
        user.setJyr(realname);
        user.setGhsj(ghsj);
        user.setStuno(stuno);
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        user.setJysj(format.format(new Date()));
        user.setNote(note);
        user.setFlag(0);
        service.addSubVcd(user);
        request.getRequestDispatcher("/WEB-INF/user/subSuccess.jsp").forward(request, response);
    }

    //查看我的借阅信息
    protected void findMyJyxx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String stuno = request.getParameter("stuno");
        int totalCount = service.queryCountByJy(stuno);
        //2.获取的当前页码,这个是从页面获取的
        String currentPage = request.getParameter("currentPage");
        PageTool pageTool = new PageTool(totalCount, currentPage);
        List<User> list = service.findMyJyxx(pageTool, stuno);
        if (null == list || list.size() == 0) {
            request.setAttribute("msg", "没有借阅信息");
            request.getRequestDispatcher("/WEB-INF/user/jyList.jsp").forward(request, response);
        } else {
            request.removeAttribute("msg");
            request.setAttribute("pageTool", pageTool);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/WEB-INF/user/jyList.jsp").forward(request, response);
        }
    }

    //查看编号查看借阅信息
    protected void findMyJyxxByid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String vcdNo = request.getParameter("vcdNo");
        String vcdName = request.getParameter("vcdName");
        Customer customer = (Customer)request.getSession().getAttribute("customer");

//        String stuno = request.getParameter("stuno");
        List<User> list = service.findMyJyxxByid(vcdNo, vcdName, customer.getStuno());
        if (null == list || list.size() == 0) {
            request.setAttribute("msg", "无此信息");
            request.getRequestDispatcher("/WEB-INF/user/jytsList2.jsp").forward(request, response);
        } else {
            request.removeAttribute("msg");
            request.setAttribute("list", list);
            request.getRequestDispatcher("/WEB-INF/user/jytsList2.jsp").forward(request, response);
        }
    }

    //根据id查询购买
    protected void queryBuyVcd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//查询数据并回显
        String stuno=request.getParameter("stuno");
        int totalCount=service.queryCountByBuy(stuno);
        //2.获取的当前页码,这个是从页面获取的
        String currentPage = request.getParameter("currentPage");
        PageTool pageTool=new PageTool(totalCount, currentPage);

        List<Buy> buys=service.findBuyByPage(pageTool,stuno);
        //将分页信息存储
        request.setAttribute("pageTool", pageTool);
        request.setAttribute("buys",buys);

        request.getRequestDispatcher("/WEB-INF/user/buyList.jsp").forward(request,response);
    }

    //根据编号和书名查询
    protected void findBuyByUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String vcdNo=request.getParameter("vcdNo");
        String vcdName=request.getParameter("vcdName");
        Customer customer = (Customer)request.getSession().getAttribute("customer");

        List<Buy> buys=service.findBuyByUser(vcdNo,vcdName,customer.getStuno());
        if(null == buys || buys.size() ==0 ){
            request.setAttribute("msg" ,"无此信息");
            request.getRequestDispatcher("/WEB-INF/user/buyList2.jsp").forward(request, response);
        }else {
            request.removeAttribute("msg");
            request.setAttribute("buys" ,buys);
            request.getRequestDispatcher("/WEB-INF/user/buyList2.jsp").forward(request, response);
        }
    }

    //删除vcd信息
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//根据id删除
        int id= WebUtils.parseInt(request.getParameter("id"), 0);
        String stuno=request.getParameter("stuno");
        service.delete(id,stuno);
        response.sendRedirect(request.getContextPath()+"/AdminServlet?action=bookList"); //重定向防止重复提交哦
    }


    protected void BuyVcdByUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//条件查询
        String id=request.getParameter("id");
        String stuno=request.getParameter("stuno");
        Customer byStuno = service.findByStuno(stuno);
        Vcd vcd=service.queryById(Integer.valueOf(id));
        Buy buy = new Buy();
        buy.setVcdNo(vcd.getVcdNo());
        buy.setVcdName(vcd.getVcdName());
        buy.setGmr(byStuno.getRealname());
        buy.setStuNo(stuno);
        buy.setPrice(vcd.getPrice());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        buy.setCreatTime(simpleDateFormat.format(new Date()));
        try {
            service.buyVcd(buy);
            request.getRequestDispatcher("/WEB-INF/user/buySuccess.jsp").forward(request, response);
        }catch(Exception e) {
        };
    }
}
