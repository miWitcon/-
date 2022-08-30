package com.javaclimb.music.dao;

import com.javaclimb.music.domain.Collect;
import com.javaclimb.music.domain.Notice;
import com.javaclimb.music.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeMapper {
    /**
     * 增加
     */
    public int insert(Notice notice);

    /**
     * 修改
     */
    public int update(Notice notice);

    /**
     * 删除
     */
    public int delete(List<Integer> noticeId);
    /**
     * 查询
     */
    public List<Notice> allNotice(String title);
}
