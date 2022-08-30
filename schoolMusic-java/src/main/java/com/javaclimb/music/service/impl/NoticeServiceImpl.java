package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.NoticeMapper;
import com.javaclimb.music.domain.Notice;
import com.javaclimb.music.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public boolean insert(Notice notice) {
        return noticeMapper.insert(notice)>0;
    }

    @Override
    public boolean update(Notice notice) {
        return noticeMapper.update(notice)>0;
    }

    @Override
    public boolean delete(List<Integer> noticeId) {
        return noticeMapper.delete(noticeId)>0;
    }

    @Override
    public List<Notice> allNotice(String title) {
        return noticeMapper.allNotice(title);
    }
}
