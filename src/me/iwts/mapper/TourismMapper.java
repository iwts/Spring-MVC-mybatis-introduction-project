package me.iwts.mapper;

import me.iwts.bean.Tourism;
import java.util.List;

public interface TourismMapper {
    int insertTourism(Tourism tourism) throws Exception;
    int updateTourism(Tourism tourism) throws Exception;
    int updateTourismHot(Tourism tourism) throws Exception;
    int deleteTourism(Tourism tourism) throws Exception;
    Tourism selectTourismById(int id) throws Exception;
    List<Tourism> selectTourismByHot() throws Exception;
    List<Tourism> selectAllTourism() throws Exception;
}
