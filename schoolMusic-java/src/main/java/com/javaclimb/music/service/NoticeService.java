package com.javaclimb.music.service;

import com.javaclimb.music.domain.Notice;

import java.util.List;

public interface NoticeService {
    /**
     * 增加
     */
    public boolean insert(Notice notice);

    /**
     * 修改
     */
    public boolean update(Notice notice);

    /**
     * 删除
     */
    public boolean delete(List<Integer> noticeId);
    /**
     * 查询
     */
    public List<Notice> allNotice(String title);
}
