package com.javaclimb.music.service;

import com.javaclimb.music.domain.User;

import java.util.List;

/**
 * 前端用户service接口
 */
public interface UserService {
    /**
     * 增加
     */
    public boolean insert(User user);

    /**
     * 修改
     */
    public boolean update(User user);

    /**
     * 删除
     */
    public boolean delete(List<Integer> userId);

    /**
     * 根据主键查询整个对象
     */
    public User selectByPrimaryKey(Integer userId);

    /**
     * 查询所有用户
     */
    public List<User> allUser(String username,String phoneNum,String email);

    /**
     * 验证密码
     */
    public boolean verifyPassword(String username,String password);

    /**
     * 管理员登录
     */
    public boolean verifyAdminPassword(String username,String password);

    /**
     * 电话号是否已注册
     */
    public boolean ifExistPhoneNum(String phoneNum,Integer userId);

    /**
     * 邮箱是否已注册
     */
    public boolean ifExistEmail(String email,Integer userId);

    /**
     * 根据账号查询
     */
    public User getByUsername(String username,Integer userId);

    /**
     * 查询男女生人数
     */
    public User sexRatio();
}
