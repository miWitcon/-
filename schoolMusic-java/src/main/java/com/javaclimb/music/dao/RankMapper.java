package com.javaclimb.music.dao;

import com.javaclimb.music.domain.Rank;
import org.springframework.stereotype.Repository;

/**
 * 评价Dao
 */
@Repository
public interface RankMapper {
    /**
     * 增加
     */
    public int insert(Rank rank);

    /**
     *查总分
     */
    public int selectScoreSum(Integer songId);

    /**
     *查评分总人数
     */
    public int selectRankNum(Integer songId);

    /**
     *查询自己评的分数
     */
    public int selfRatedScore(Integer userId,Integer songId);

    /**
     *修改自己评的分数
     */
    public int updateScore(Rank rank);
}
