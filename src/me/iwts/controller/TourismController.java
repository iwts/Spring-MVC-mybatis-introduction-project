package me.iwts.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import me.iwts.bean.Tourism;
import me.iwts.bean.User;
import me.iwts.mapper.TourismMapper;
import me.iwts.tools.ViewTool;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.orm.jpa.vendor.EclipseLinkJpaDialect;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class TourismController {
    public static SqlSessionFactory sessionFactory;
    public static SqlSession sqlSession;
    public static TourismMapper mapper;

    static{
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSession =  sessionFactory.openSession();
        mapper = sqlSession.getMapper(TourismMapper.class);
    }

    // 获取详情页，设定路径变量，确定该页面显示什么内容
    @RequestMapping("details/tourism/{id}")
    public ModelAndView details(@PathVariable int id, ServletRequest request, Model model){
        ServletContext application = request.getServletContext();
        // 直接匹配，省略了调用数据库的过程
        List<Tourism> hotList = (List<Tourism>) application.getAttribute("hotList");
        Tourism tourism = null;
        for(int i = 0;i < hotList.size();i++){
            if(id == hotList.get(i).getId()){
                tourism = hotList.get(i);
                break;
            }
        }
        model.addAttribute("tourism",tourism);
        return new ModelAndView(ViewTool.DETAILS);
    }

    // 添加旅游信息
    @RequestMapping("addTourism")
    public ModelAndView addTourism(@Valid @ModelAttribute Tourism tourism, BindingResult bindingResult,
                                   @RequestParam(value = "image") MultipartFile multipartFile,
                                   ServletRequest request, Model model){
        //System.out.println(tourism.get)
        if(bindingResult.hasErrors()){
            model.addAttribute("tourism",tourism);
            return new ModelAndView(ViewTool.TOURISM_CONSOLE);
        }
        // price前端验证

        String path = request.getServletContext().getRealPath("/");
        // 字符串处理，先找到真实路径，在转到需要的路径下
        String[] s = path.split("out");
        path = s[0];
        path += "web/images/db";
        SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");
        // 唯一化名字和id
        String name = df.format(new Date());
        String strId = name.substring(2,12);
        int id = Integer.parseInt(strId);
        // 没有图片则使用默认图
        if(multipartFile.isEmpty()){
            name = "default.jpg";
        }else{
            name = name + multipartFile.getOriginalFilename();
            File file = new File(path,name);
            try{
                multipartFile.transferTo(file);
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        tourism.setImageUrl(name);
        tourism.setId(id);

        // 写入数据库
        try{
            mapper.insertTourism(tourism);
            sqlSession.commit();
        }catch (Exception ex){
            sqlSession.rollback();
            ex.printStackTrace();
        }

        // 写入以后更新tourismList
        List<Tourism> tourismList = (List<Tourism>) request.getServletContext().getAttribute("tourismList");
        tourismList.add(tourism);

        // 重定向
        return new ModelAndView("redirect:/addSuccess");
    }
    @RequestMapping("addSuccess")
    public ModelAndView addSuccess(){
        return new ModelAndView(ViewTool.ADD_SUCCESS);
    }

    // 修改信息
    @RequestMapping("alterTourism")
    public ModelAndView alterTourism(@Valid @ModelAttribute("alterTourism") Tourism tourism,BindingResult bindingResult,
                                     @RequestParam(value = "image") MultipartFile multipartFile,ServletRequest request){
        if(bindingResult.hasErrors()){
            request.setAttribute("alterError",true);
            request.setAttribute("alterMessage","修改失败，请不要输入空信息");
            return new ModelAndView(ViewTool.TOURISM_CONSOLE);
        }

        // 不进行数据对比，如果没有日期、图片则沿用之前，其他直接更新
        Tourism sqlTourism = null;
        try{
            sqlTourism = mapper.selectTourismById(tourism.getId());
        }catch (Exception ex){
            ex.printStackTrace();
        }

        if(tourism.getBeginTime() == null){
            tourism.setBeginTime(sqlTourism.getBeginTime());
        }
        if(multipartFile.isEmpty()){
            tourism.setImageUrl(sqlTourism.getImageUrl());
        }else{
            String path = request.getServletContext().getRealPath("/");
            String[] s = path.split("out");
            path = s[0];
            path += "web/images/db";
            SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");
            String name = df.format(new Date());
            name = name + multipartFile.getOriginalFilename();
            File file = new File(path,name);
            tourism.setImageUrl(name);
            try{
                multipartFile.transferTo(file);
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }

        // 更新
        try{
            mapper.updateTourism(tourism);
            sqlSession.commit();
        }catch (Exception ex){
            sqlSession.rollback();
            ex.printStackTrace();
        }

        // 写入以后更新tourismList和hotList
        List<Tourism> tourismList = (List<Tourism>) request.getServletContext().getAttribute("tourismList");
        tourismList.add(tourism);
        List<Tourism> hotList = (List<Tourism>) request.getServletContext().getAttribute("hotList");
        for(Tourism temp : hotList){
            if(temp.getId() == tourism.getId()){
                hotList.remove(temp);
                hotList.add(tourism);
                break;
            }
        }

        return new ModelAndView(ViewTool.INDEX);
    }

    // 取消热门设定
    @RequestMapping("removeHot/{id}")
    public ModelAndView removeHot(@PathVariable int id,ServletRequest request){
        ServletContext application = request.getServletContext();
        List<Tourism> hotList = (List<Tourism>) application.getAttribute("hotList");
        List<Tourism> tourismList = (List<Tourism>) application.getAttribute("tourismList");

        Tourism tourism = null;
        try{
            tourism = mapper.selectTourismById(id);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        tourism.setHot(false);
        // 取消热门，hotList与tourismList全部更新即可，首页显示其实是不变的，但顺序变化了（因为直接删除后再加）
        for(int i = 0;i < hotList.size();i++){
            Tourism temp = hotList.get(i);
            if(temp.getId() == id){
                hotList.remove(i);
                break;
            }
        }
        for(int i = 0;i < tourismList.size();i++){
            Tourism temp = tourismList.get(i);
            if(temp.getId() == id){
                tourismList.remove(i);
                break;
            }
        }
        hotList.add(tourism);
        tourismList.add(tourism);
        // 更新数据库
        try{
            mapper.updateTourismHot(tourism);
            sqlSession.commit();
        }catch (Exception ex){
            sqlSession.rollback();
            ex.printStackTrace();
        }
        // 重定向，防止路径错误
        return new ModelAndView("redirect:/tourismConsoleRedirect");
    }
    // 设置热门设定
    @RequestMapping("setHot/{id}")
    public ModelAndView setHot(@PathVariable int id,ServletRequest request){
        ServletContext application = request.getServletContext();
        List<Tourism> hotList = (List<Tourism>) application.getAttribute("hotList");
        List<Tourism> tourismList = (List<Tourism>) application.getAttribute("tourismList");

        Tourism tourism = null;
        try{
            tourism = mapper.selectTourismById(id);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        tourism.setHot(true);
        // tourismList更新即可，但是hotList需要重新设定，需要判定是否有最早随机加上的非热门团
        for(int i = 0;i < tourismList.size();i++){
            Tourism temp = tourismList.get(i);
            if(temp.getId() == id){
                tourismList.remove(i);
                break;
            }
        }
        tourismList.add(tourism);
        // 如果全是热门，则将第一个删除，模拟了队列
        int flag = -1;
        for(int i = 0;i < hotList.size();i++){
            if(hotList.get(i).getHot() == false){
                flag = i;
                break;
            }
        }
        if(flag == -1){
            hotList.remove(0);
        }else{
            hotList.remove(flag);
        }
        hotList.add(tourism);

        // 写入数据库
        try{
            mapper.updateTourismHot(tourism);
            sqlSession.commit();
        }catch (Exception ex){
            sqlSession.rollback();
            ex.printStackTrace();
        }

        // 仍然是重定向
        return new ModelAndView("redirect:/tourismConsoleRedirect");
    }
    // tourism console重定向
    @RequestMapping("tourismConsoleRedirect")
    public ModelAndView tourismConsoleRedirect(){
        return new ModelAndView(ViewTool.TOURISM_CONSOLE);
    }
}
