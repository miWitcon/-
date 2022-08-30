package com.javaclimb.music.service;

import com.javaclimb.music.domain.LikeComment;

import java.util.List;

public interface LikeCommentService {
    /**
     * 增加
     */

    public boolean insert(LikeComment likeComment);

    /**
     * 删除
     */
    public boolean delete(Integer userId, Integer commentId);

    /**
     * 更新状态
     */
    public boolean update(Integer userId, Integer commentId);

    /**
     * 查询是否点过赞
     */
    public LikeComment select(Integer userId, Integer commentId);

    /**
     * 查询所有点过赞的对象
     */
    public List<LikeComment> allLike(Integer userId);
}
