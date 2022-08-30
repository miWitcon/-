package com.javaclimb.music.dao;

import com.javaclimb.music.domain.LikeComment;
import com.javaclimb.music.domain.SongList;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 评论点赞Dao
 */
@Repository
public interface LikeCommenMapper {

    /**
     * 增加
     */
    public int insert(LikeComment likeComment);

    /**
     * 删除
     */
    public int delete(Integer userId, Integer commentId);

    /**
     * 更新状态
     */
    public int update(Integer userId, Integer commentId);

    /**
     * 查询是否点过赞
     */
    public LikeComment select(Integer userId, Integer commentId);

    /**
     * 查询所有点过赞的对象
     */
    public List<LikeComment> allLike(Integer userId);
}
