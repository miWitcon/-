package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.CollectMapper;
import com.javaclimb.music.dao.SongMapper;
import com.javaclimb.music.domain.Collect;
import com.javaclimb.music.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收藏service实现类
 */
@Service
public class CollectServiceImpl implements CollectService {

    @Autowired
    private CollectMapper collectMapper;

    @Autowired
    private SongMapper songMapper;

    @Override
    public boolean insert(Collect collect) {
        return collectMapper.insert(collect)>0;
    }

    @Override
    public boolean delete(Integer collectId) {
        return collectMapper.delete(collectId)>0;
    }

    @Override
    public List<Collect> allCollect() {
        return collectMapper.allCollect();
    }

    @Override
    public List<Collect> collectOfUserId(Integer userId) {
//        List<Collect> col = collectMapper.collectOfUserId(userId);
//        for (Collect collect:col) {
//            System.out.println("collect=>"+collect.getSongId());
//        }
        return collectMapper.collectOfUserId(userId);
    }

    @Override
    public boolean deleteByUserIdSongId(Integer userId, Integer songId) {
        return collectMapper.deleteByUserIdSongId(userId, songId)>0;
    }

    @Override
    public boolean isDeleted(Integer userId, Integer songId) {
        return collectMapper.isDeleted(userId, songId)>0;
    }

    @Override
    public boolean update(Integer userId, Integer songId) {
        return collectMapper.update(userId, songId)>0;
    }

    @Override
    public boolean exitSongId(Integer userId, Integer songId) {
        return collectMapper.exitSongId(userId,songId)>0;
    }
}
