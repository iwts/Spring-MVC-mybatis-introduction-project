package me.iwts.controller;

import me.iwts.tools.ViewTool;
import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class ViewController {
    // 首页
    @RequestMapping("getIndex.action")
    public ModelAndView getIndex(HttpSession session){
        return new ModelAndView(ViewTool.INDEX);
    }
    // 注册页
    @RequestMapping("getRegister.action")
    public ModelAndView getRegister(){
        return new ModelAndView(ViewTool.REGISTER);
    }
    // 登录页
    @RequestMapping("getLogin.action")
    public ModelAndView getSign(){
        return new ModelAndView(ViewTool.LOGIN);
    }
    // 用户页
    @RequestMapping("getProfile.action")
    public ModelAndView getProfile(){
        return new ModelAndView(ViewTool.PROFILE);
    }
    // 管理员控制页
    @RequestMapping("getAdminConsole")
    public ModelAndView getAdminConsole(){
        return new ModelAndView(ViewTool.ADMIN_CONSOLE);
    }
    // 旅游团控制页
    @RequestMapping("getTourismConsole")
    public ModelAndView getTourismConsole(){
        return new ModelAndView(ViewTool.TOURISM_CONSOLE);
    }
}
