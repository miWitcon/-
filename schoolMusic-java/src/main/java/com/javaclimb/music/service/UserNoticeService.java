package com.javaclimb.music.service;

import com.javaclimb.music.domain.UserNotice;

import java.util.List;

public interface UserNoticeService {
    /**
     * 增加
     */
    public boolean insert(List<Integer> list, Integer noticeId, Integer id);

    /**
     * 查询最大的noticId
     */
    public int maxNoticeId();

    /**
     * 查询用户的所有公告
     */
    public List<UserNotice> noticeOfUser(Integer userId);

    /**
     * 查询未读消息数
     */
    public int unReadNum(Integer userId);

    /**
     * 公告转成已读状态
     */
    public boolean turnRead(List<Integer> id);

    /**
     * 删除个人公告消息
     */
    public boolean delete(Integer id);
}
