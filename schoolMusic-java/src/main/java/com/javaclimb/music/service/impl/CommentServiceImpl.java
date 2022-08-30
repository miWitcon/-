package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.CommentMapper;
import com.javaclimb.music.domain.Comment;
import com.javaclimb.music.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 评论service实现类
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public boolean insert(Comment comment) {
        return commentMapper.insert(comment)>0;
    }

    @Override
    public boolean update(Comment comment) {
        return commentMapper.update(comment)>0;
    }

    @Override
    public boolean delete(List<Integer> commentId) {
        return commentMapper.delete(commentId)>0;
    }

    @Override
    public Comment selectByPrimaryKey(Integer commentId) {
        return commentMapper.selectByPrimaryKey(commentId);
    }

    @Override
    public List<Comment> allComment() {
        return commentMapper.allComment();
    }

    @Override
    public List<Comment> commentOfSongId(Integer songId) {
        return commentMapper.commentOfSongId(songId);
    }

}
