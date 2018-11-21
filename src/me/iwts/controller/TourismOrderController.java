package me.iwts.controller;

import me.iwts.bean.Tourism;
import me.iwts.bean.TourismOrder;
import me.iwts.bean.User;
import me.iwts.mapper.TourismMapper;
import me.iwts.mapper.TourismOrderMapper;
import me.iwts.tools.ViewTool;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class TourismOrderController {
    public static SqlSessionFactory sessionFactory;
    public static SqlSession sqlSession;
    public static TourismOrderMapper mapper;

    static{
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSession =  sessionFactory.openSession();
        mapper = sqlSession.getMapper(TourismOrderMapper.class);
    }

    @RequestMapping("addOrder/{id}")
    public ModelAndView addOrder(@PathVariable int id, HttpSession session, ServletRequest request,
                                 ServletResponse response, Model model){
        // 未登录则跳转到登录页面，登录后再跳转回来
        boolean isLogin = false;
        if(session.getAttribute("isLogin") == null){
            session.setAttribute("isLogin",true);
        }else{
            isLogin = (boolean) session.getAttribute("isLogin");
        }
        if(isLogin == false){
            session.setAttribute("returnUrl","details/tourism/"+id);
            return new ModelAndView(ViewTool.LOGIN);
        }

        // 写入预备订单数据库
        User user = (User) session.getAttribute("user");
        // 利用当前时间唯一化订单id
        SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");
        String strId = df.format(new Date());

        // 防止添加重复行程
        try{
            List<TourismOrder> orderList = mapper.selectOrderByAccount(user.getAccount());
            boolean isRepeat = false;
            for(TourismOrder order : orderList){
                if(order.getTourismId() == id) {
                    isRepeat = true;
                    break;
                }
            }
            if(isRepeat == true){
                // 重复了，回传一个声明无法重复的信息，并仍在原地址
                request.setAttribute("noRepeat","该行程已添加，可以去“我的行程”查看");
                request.getRequestDispatcher("/details/tourism/"+id).forward(request,response);
            }else{
                // 正常添加订单
                try{
                    TourismOrder order = new TourismOrder(strId,user.getAccount(),id);
                    mapper.insertOrder(order);
                    sqlSession.commit();
                }catch (Exception e){
                    e.printStackTrace();
                    sqlSession.rollback();
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }

        // 重定向，防止重复添加行程
        return new ModelAndView("redirect:/addOrderRedirect.action");
    }
    @RequestMapping("addOrderRedirect.action")
    public ModelAndView addOrderRedirect(){
        return new ModelAndView(ViewTool.ADD_SUCCESS);
    }

    // 查看我的订单
    @RequestMapping("getMyOrder")
    public ModelAndView getMyOrder(HttpSession session){
        User user = (User) session.getAttribute("user");
        String account = user.getAccount();
        List<TourismOrder> orderList = null;
        try{
            orderList = mapper.selectOrderByAccount(account);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        if(orderList.size() == 0){
            session.setAttribute("haveOrder",false);
        }else{
            session.setAttribute("haveOrder",true);
        }
        // 将订单列表放入session
        session.setAttribute("myOrder",orderList);
        // 根据订单获得旅游团的具体数据
        HashMap<String,Tourism> tourismMap = new HashMap<>();
        TourismMapper tourismMapper = sqlSession.getMapper(TourismMapper.class);
        // 因为用map匹配，所以要一个一个创建，EL表达式数字是long，所以这里转换成String
        for(int i = 0;i < orderList.size();i++){
            int id = orderList.get(i).getTourismId();
            Tourism temp = null;
            try{
                temp = tourismMapper.selectTourismById(id);
            }catch (Exception ex){
                ex.printStackTrace();
            }
            tourismMap.put(orderList.get(i).getId(),temp);
        }
        session.setAttribute("myTourism",tourismMap);
        return new ModelAndView(ViewTool.MY_ORDER);
    }
    // 我的订单的重定向
    @RequestMapping("getMyOrderRedirect")
    public ModelAndView getMyOrderRedirect(){
        return new ModelAndView(ViewTool.MY_ORDER);
    }

    // 取消订单
    @RequestMapping("removeOrder/{id}")
    public ModelAndView removeOrder(@PathVariable String id,HttpSession session){
        try{
            mapper.deleteOrderById(id);
            sqlSession.commit();
        }catch (Exception ex){
            sqlSession.rollback();
            ex.printStackTrace();
        }
        // session里的list与map也需要删除
        List<TourismOrder> orderList = (List<TourismOrder>) session.getAttribute("myOrder");
        HashMap<String,Tourism> tourismMap = (HashMap<String,Tourism>) session.getAttribute("myTourism");
        tourismMap.remove(id);
        for(TourismOrder temp : orderList){
            if(temp.getId().compareTo(id) == 0){
                orderList.remove(temp);
                break;
            }
        }

        // 取消后也要重定向
        return new ModelAndView("redirect:/getMyOrderRedirect");
    }

    // 订单结算
    @RequestMapping("pay/{id}")
    public ModelAndView pay(@PathVariable String id){
        // 结算到底咋算？？

        // 最后转到remove订单部分，因为在数据库、session中的移除完全可以利用已写代码
        return new ModelAndView("redirect:/removeOrder/"+id);
    }
}
