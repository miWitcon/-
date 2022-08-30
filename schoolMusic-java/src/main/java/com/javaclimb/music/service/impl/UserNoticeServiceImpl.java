package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.UserNoticeMapper;
import com.javaclimb.music.domain.UserNotice;
import com.javaclimb.music.service.UserNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {

    @Autowired
    private UserNoticeMapper userNoticeMapper;

    @Override
    public List<UserNotice> noticeOfUser(Integer userId) {
        return userNoticeMapper.noticeOfUser(userId);
    }

    @Override
    public int maxNoticeId() {
        return userNoticeMapper.maxNoticeId();
    }

    @Override
    public boolean insert(List<Integer> list, Integer noticeId, Integer id) {
        return userNoticeMapper.insert(list,noticeId,id)>0;
    }

    @Override
    public boolean delete(Integer id) {
        return userNoticeMapper.delete(id)>0;
    }

    @Override
    public boolean turnRead(List<Integer> id) {
        return userNoticeMapper.turnRead(id)>0;
    }

    @Override
    public int unReadNum(Integer userId) {
        return userNoticeMapper.unReadNum(userId);
    }
}
