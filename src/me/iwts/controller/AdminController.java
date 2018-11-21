package me.iwts.controller;

import me.iwts.bean.Admin;
import me.iwts.mapper.AdminMapper;
import me.iwts.tools.ViewTool;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.Reader;

@Controller
public class AdminController {
    public static SqlSessionFactory sessionFactory;
    public static SqlSession sqlSession;
    public static AdminMapper mapper;

    static{
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSession =  sessionFactory.openSession();
        mapper = sqlSession.getMapper(AdminMapper.class);
    }

    // 登录
    @RequestMapping("loginByAdmin.action")
    public ModelAndView loginByAdmin(@ModelAttribute Admin admin, Model model, HttpSession session){
        Admin selectAdmin = null;
        try{
            selectAdmin = mapper.selectAdminById(admin.getId());
            if(selectAdmin == null){
                model.addAttribute("loginWrongByAdmin","ID错误");
                model.addAttribute("admin",admin);
                return new ModelAndView(ViewTool.LOGIN);
            }
            if(selectAdmin.getPasswd().compareTo(admin.getPasswd()) != 0){
                model.addAttribute("loginWrongByAdmin","密码错误");
                model.addAttribute("admin",admin);
                return new ModelAndView(ViewTool.LOGIN);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        session.setAttribute("isLogin",true);
        session.setAttribute("isAdmin",true);
        session.setAttribute("admin",selectAdmin);
        session.setAttribute("account",selectAdmin.getAccount());
        // 重定向
        return new ModelAndView("redirect:/loginByAdminRedirect");
    }
    @RequestMapping("loginByAdminRedirect")
    public ModelAndView loginByAdminRedirect(){
        return new ModelAndView(ViewTool.ADMIN_CONSOLE);
    }

    // 注销
    @RequestMapping("logoutAdmin")
    public ModelAndView logoutAdmin(HttpSession session){
        session.setAttribute("isLogin",false);
        session.setAttribute("isAdmin",false);
        session.removeAttribute("admin");
        session.removeAttribute("account");
        return new ModelAndView("redirect:/logoutAdminRedirect");
    }
    // 注销重定向到首页
    @RequestMapping("logoutAdminRedirect")
    public ModelAndView logoutAdminRedirect(){
        return new ModelAndView(ViewTool.INDEX);
    }
}
