package me.iwts.listener;

import me.iwts.bean.Tourism;
import me.iwts.mapper.TourismMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.Reader;
import java.util.List;
import java.util.Random;

public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();

        // 初始化图片url
        String imagesUrl = "/db/";
        application.setAttribute("imagesUrl",imagesUrl);

        // 初始化首页商品信息
        SqlSessionFactory sessionFactory = null;
        SqlSession sqlSession = null;
        TourismMapper mapper = null;

        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSession =  sessionFactory.openSession();
        mapper = sqlSession.getMapper(TourismMapper.class);

        // 保证至少有3个tourism
        // 初始化两个list：hot值为true的热门推荐list，以及存所有数据的list
        List<Tourism> hotList = null;
        List<Tourism> tourismList = null;
        try {
            hotList = mapper.selectTourismByHot();
            tourismList = mapper.selectAllTourism();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 不足3个推荐，随机补个
        while(hotList.size() < 3){
            Random random = new Random();
            int index = random.nextInt(tourismList.size());
            Tourism tourism = tourismList.get(index);
            // 防止重复
            int flag = 0;
            for(Tourism randomTourism : hotList){
                if(tourism.getId() == randomTourism.getId()){
                    flag = 1;
                    break;
                }
            }
            if(flag == 1) continue;
            hotList.add(tourism);
        }
        // 超过3个推荐，则只保留最早设定的
        while(hotList.size() > 3){
            for(int i = hotList.size()-1;i > 2;i--){
                hotList.remove(i);
            }
        }

        application.setAttribute("hotList",hotList);
        application.setAttribute("tourismList",tourismList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //
    }
}
