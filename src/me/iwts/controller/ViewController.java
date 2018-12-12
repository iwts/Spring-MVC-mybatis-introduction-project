package me.iwts.controller;

import me.iwts.tools.ViewTool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {
    // 首页
    @RequestMapping("getIndex.action")
    public ModelAndView getIndex(){
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
    // “关于”页面
    @RequestMapping("getAbout")
    public ModelAndView getAbout(){
        return new ModelAndView(ViewTool.ABOUT);
    }
    // 国内游页面
    @RequestMapping("getTourismPage")
    public ModelAndView getTourismPage(){
        return new ModelAndView(ViewTool.TOURISM);
    }
    // 删除旅游团页面
    @RequestMapping("getRemoveTourism")
    public ModelAndView getRemoveTourism(){
        return new ModelAndView(ViewTool.REMOVE_TOURISM);
    }
}
