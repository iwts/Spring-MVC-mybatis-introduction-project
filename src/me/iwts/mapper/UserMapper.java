package me.iwts.mapper;

import me.iwts.bean.User;

import java.util.List;

public interface UserMapper {
    int insertUser(User user) throws Exception;
    int updateUser(User user) throws Exception;
    int deleteUser(User user) throws Exception;
    User selectUserByAccount(String account) throws Exception;
    List<User> selectAllUser() throws Exception;
}
