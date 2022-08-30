package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.LikeCommenMapper;
import com.javaclimb.music.domain.LikeComment;
import com.javaclimb.music.service.LikeCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikeCommentServiceImpl implements LikeCommentService {

    @Autowired
    private LikeCommenMapper likeCommenMapper;

    @Override
    public boolean insert(LikeComment likeComment) {
        return likeCommenMapper.insert(likeComment)>0;
    }

    @Override
    public boolean delete(Integer userId, Integer commentId) {
        return likeCommenMapper.delete(userId, commentId)>0;
    }

    @Override
    public boolean update(Integer userId, Integer commentId) {
        return likeCommenMapper.update(userId, commentId)>0;
    }

    @Override
    public List<LikeComment> allLike(Integer userId) {
        return likeCommenMapper.allLike(userId);
    }

    @Override
    public LikeComment select(Integer userId, Integer commentId) {
        return likeCommenMapper.select(userId, commentId);
    }
}
