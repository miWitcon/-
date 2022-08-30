package com.javaclimb.music.service;

import com.javaclimb.music.domain.Comment;

import java.util.List;

/**
 * 评论service接口
 */
public interface CommentService {
    /**
     * 增加
     */
    public boolean insert(Comment comment);

    /**
     * 修改
     */
    public boolean update(Comment comment);

    /**
     * 删除
     */
    public boolean delete(List<Integer> commentId);

    /**
     * 根据主键查询整个对象
     */
    public Comment selectByPrimaryKey(Integer commentId);

    /**
     * 查询所有评论
     */
    public List<Comment> allComment();

    /**
     * 查询某歌曲下的所有评论
     */
    public List<Comment> commentOfSongId(Integer songId);
}
