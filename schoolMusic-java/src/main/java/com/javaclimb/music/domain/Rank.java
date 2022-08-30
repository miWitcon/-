package com.javaclimb.music.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * 评价
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Rank implements Serializable {
    /*主键*/
    private Integer rankId;
    /*用户id*/
    private Integer userId;
    /*评分*/
    private Integer score;
    /*歌曲id*/
    private Integer songId;

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public Integer getRankId() {
        return rankId;
    }

    public void setRankId(Integer rankId) {
        this.rankId = rankId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}
