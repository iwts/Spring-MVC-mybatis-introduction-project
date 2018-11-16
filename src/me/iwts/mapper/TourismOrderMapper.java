package me.iwts.mapper;

import me.iwts.bean.TourismOrder;

import java.util.List;

public interface TourismOrderMapper {
    int insertOrder(TourismOrder order) throws Exception;
    int deleteOrderById(String id) throws Exception;
    List<TourismOrder> selectOrderById(String id) throws Exception;
    List<TourismOrder> selectOrderByAccount(String account) throws Exception;
    List<TourismOrder> selectOrderByTourismId(int tourismId) throws Exception;
}
