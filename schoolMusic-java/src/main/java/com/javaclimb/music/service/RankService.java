package com.javaclimb.music.service;

import com.javaclimb.music.domain.Rank;

/**
 * 评价service接口
 */
public interface RankService {
    /**
     * 增加
     */
    public boolean insert(Rank rank);

    /**
     *查总分
     */
    public int selectScoreSum(Integer songId);

    /**
     *查评分总人数
     */
    public int selectRankNum(Integer songId);

    /**
     *计算平均分
     */
    public float rankOfSongListId(Integer songId);

    /**
     *查询自己评的分数
     */
    public int selfRatedScore(Integer userId,Integer songId);

    /**
     *修改自己评的分数
     */
    public boolean updateScore(Rank rank);
}
