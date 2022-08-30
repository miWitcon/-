package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.UserMapper;
import com.javaclimb.music.domain.User;
import com.javaclimb.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserService实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean insert(User user) {
        return userMapper.insert(user)>0;
    }

    @Override
    public boolean update(User user) {
        return userMapper.update(user)>0;
    }

    @Override
    public boolean ifExistPhoneNum(String phoneNum,Integer userId) {
        return userMapper.ifExistPhoneNum(phoneNum,userId)>0;
    }

    @Override
    public boolean ifExistEmail(String email,Integer userId) {
        return userMapper.ifExistEmail(email,userId)>0;
    }

    @Override
    public boolean delete(List<Integer> userId) {
        return userMapper.delete(userId)>0;
    }

    @Override
    public User selectByPrimaryKey(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> allUser(String username,String phoneNum,String email) {
        return userMapper.allUser(username, phoneNum, email);
    }

    @Override
    public boolean verifyPassword(String username, String password) {
        return userMapper.verifyPassword(username,password)>0;
    }

    @Override
    public boolean verifyAdminPassword(String username, String password) {
        return userMapper.verifyAdminPassword(username, password)>0;
    }

    @Override
    public User getByUsername(String username,Integer userId) {
        return userMapper.getByUsername(username,userId);
    }

    @Override
    public User sexRatio() {
        return userMapper.sexRatio();
    }
}
