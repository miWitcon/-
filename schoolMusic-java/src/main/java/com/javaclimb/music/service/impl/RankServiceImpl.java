package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.RankMapper;
import com.javaclimb.music.domain.Rank;
import com.javaclimb.music.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 评价service实现
 */
@Service
public class RankServiceImpl implements RankService {

    @Autowired
    private RankMapper rankMapper;

    @Override
    public boolean insert(Rank rank) {
        return rankMapper.insert(rank)>0;
    }

    @Override
    public int selectScoreSum(Integer songId) {
        return rankMapper.selectScoreSum(songId);
    }

    @Override
    public int selectRankNum(Integer songId) {
        return rankMapper.selectRankNum(songId);
    }

    @Override
    public float rankOfSongListId(Integer songId) {
        int rankNum = rankMapper.selectRankNum(songId);
        if (rankNum==0){
            return 5;
        }
        return (float)rankMapper.selectScoreSum(songId)/(float)rankNum;
    }

    @Override
    public int selfRatedScore(Integer userId, Integer songId) {
        return rankMapper.selfRatedScore(userId, songId);
    }

    @Override
    public boolean updateScore(Rank rank) {
        return rankMapper.updateScore(rank)>0;
    }
}
