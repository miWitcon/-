package com.javaclimb.music.domain;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    /*主键*/
    private Integer commentId;
    /*用户id*/
    private Integer userId;
    /*评论类型（0歌曲，1歌单）*/
    private Byte type;
    /*歌曲id*/
    private Integer songId;
    /*评论内容*/
    private String content;
    /*点赞次数*/
    private Integer up;

    private String username;

    private String avator;

    public String getAvator() {
        return avator;
    }

    public void setAvator(String avator) {
        this.avator = avator;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /*评论时间*/
    private Date createTime;
}
