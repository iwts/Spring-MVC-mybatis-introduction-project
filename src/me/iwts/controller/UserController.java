package me.iwts.controller;

import me.iwts.bean.User;
import me.iwts.mapper.UserMapper;
import me.iwts.tools.ViewTool;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.Reader;

@Controller
public class UserController {
    public static SqlSessionFactory sessionFactory;
    public static SqlSession sqlSession;
    public static UserMapper mapper;

    // 查找数据库是否已经有该用户，并返回
    public static User selectUserByAccount(String account){
        try{
            User ret = mapper.selectUserByAccount(account);
            return ret;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    // mybatis初始化
    static{
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSession =  sessionFactory.openSession();
        mapper = sqlSession.getMapper(UserMapper.class);
    }

    // 注册
    @RequestMapping("register.action")
    public ModelAndView register(@Valid @ModelAttribute User user, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("user",user);
            return new ModelAndView(ViewTool.REGISTER);
        }

        // 验证是否已存在用户
        User selectUser = selectUserByAccount(user.getAccount());

        // 注册成功或者返回重新输入账号
        if(selectUser == null){
            // 处理一下bean
            if(user.getUserName() == null || user.getUserName().compareTo("") == 0){
                user.setUserName(user.getAccount());
            }
            try {
                mapper.insertUser(user);
                sqlSession.commit();
            } catch (Exception e) {
                e.printStackTrace();
                sqlSession.rollback();
            }
            // 注册转发，方式重复提交
            return new ModelAndView("redirect:/registerRedirect");
        }else{
            user.setAccount("");
            model.addAttribute("user",user);
            String accountError = "该账号已被注册";
            model.addAttribute("accountError",accountError);
            return new ModelAndView(ViewTool.REGISTER);
        }
    }
    // 注册重定向
    @RequestMapping("registerRedirect")
    public ModelAndView registerRedirect(){
        return new ModelAndView(ViewTool.REGISTER_SUCCESS);
    }

    // 登录
    @RequestMapping("login.action")
    public ModelAndView login(@ModelAttribute User user, Model model, HttpSession session){
        User selectUser = selectUserByAccount(user.getAccount());
        if(selectUser == null){
            model.addAttribute("loginWrong","该账号不存在");
            model.addAttribute("user",user);
            return new ModelAndView(ViewTool.LOGIN);
        }else{
            if(selectUser.getPasswd().compareTo(user.getPasswd()) != 0){
                model.addAttribute("loginWrong","密码错误");
                model.addAttribute("user",user);
                return new ModelAndView(ViewTool.LOGIN);
            }else{
                // 可以登录
                session.setAttribute("isLogin",true);
                session.setAttribute("user",selectUser);
                session.setAttribute("userName",selectUser.getUserName());
                // 订单跳转过来的情况，登陆后就直接回转到原来订单页
                String url = (String) session.getAttribute("returnUrl");
                if(url != null && url.compareTo("") != 0){
                    url = (String) session.getAttribute("returnUrl");
                    try{
                        return new ModelAndView("redirect:/"+url);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
                // 登录后进行一次转发，防止重复提交
                return new ModelAndView("redirect:/loginRedirect");
            }
        }
    }
    // 登录重定向
    @RequestMapping("loginRedirect")
    public ModelAndView loginRedirect(){
        return new ModelAndView(ViewTool.INDEX);
    }

    // 注销
    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session){
        session.setAttribute("isLogin",false);
        session.removeAttribute("user");
        session.removeAttribute("userName");
        return new ModelAndView("redirect:/logoutRedirect");
    }
    // 注销重定向到首页
    @RequestMapping("logoutRedirect")
    public ModelAndView logoutRedirect(){
        return new ModelAndView(ViewTool.INDEX);
    }

    // 修改用户信息
    @RequestMapping("alterUser")
    public ModelAndView alterUser(@ModelAttribute User user,HttpSession session){
        user.setAccount(((User)session.getAttribute("user")).getAccount());
        if(user.getPasswd() == null || user.getPasswd().compareTo("") == 0){
            user.setPasswd(((User)session.getAttribute("user")).getPasswd());
        }
        try{
            mapper.updateUser(user);
            sqlSession.commit();
        }catch (Exception ex){
            ex.printStackTrace();
            sqlSession.rollback();
        }
        session.setAttribute("user",user);
        session.setAttribute("userName",user.getUserName());
        // 修改完毕以后也需要重定向到本页面刷新
        return new ModelAndView("redirect:/alterUserRedirect");
    }
    // 修改用户信息重定向
    @RequestMapping("alterUserRedirect")
    public ModelAndView alterUserRedirect(){
        return new ModelAndView(ViewTool.PROFILE);
    }
}
