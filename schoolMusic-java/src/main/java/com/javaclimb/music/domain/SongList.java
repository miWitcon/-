package com.javaclimb.music.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class SongList implements Serializable {

    /*主键*/
    private Integer id;
    /*标题*/
    private String title;
    /*图片*/
    private String pic;
    /*简介*/
    private String introduction;
    /*类型*/
    private String style;
    /*歌单发布时间*/
    private Date createTime;

    private Integer songListNum;

    public Integer getSongListNum() {
        return songListNum;
    }

    public void setSongListNum(Integer songListNum) {
        this.songListNum = songListNum;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
