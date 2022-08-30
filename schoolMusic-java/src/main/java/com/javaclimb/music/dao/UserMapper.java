package com.javaclimb.music.dao;

import com.javaclimb.music.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * userDao
 */
@Repository
public interface UserMapper {
    /**
     * 增加
     */
    public int insert(User user);

    /**
     * 修改
     */
    public int update(User user);

    /**
     * 删除
     */
    public int delete(List<Integer> userId);

    /**
     * 根据主键查询整个对象
     */
    public User selectByPrimaryKey(Integer userId);

    /**
     * 查询所有用户
     */
    public List<User> allUser(String username,String phoneNum,String email);

    /**
     * 普通用户登录
     */
    public int verifyPassword(String username,String password);

    /**
     * 管理员登录
     */
    public int verifyAdminPassword(String username,String password);

    /**
     * 电话号是否已注册
     */
    public int ifExistPhoneNum(String phoneNum,Integer userId);

    /**
     * 邮箱是否已注册
     */
    public int ifExistEmail(String email,Integer userId);

    /**
     * 根据账号查询
     */
    public User getByUsername(String username,Integer userId);

    /**
     * 查询男女生人数
     */
    public User sexRatio();
}
