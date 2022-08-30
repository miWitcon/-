package com.javaclimb.music.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.Date;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class User implements Serializable {
//    用户id
    private Integer userId;
//    用户名
    private String username;
//    密码
    private String password;
//    性别
    private Byte sex;
//    电话
    private String phoneNum;
//    邮箱
    private String email;
//    生日
    private Date birth;
//    简介
    private String introduction;
//    地址
    private String location;
//    头像
    private String avator;
//    创建时间
    private Date createTime;
//    更新日期
    private Date updateTime;
//    学校
    private String school;
//    身份
    private Byte identity;

    private Integer boyNum;

    private Integer girlNum;

    public Integer getBoyNum() {
        return boyNum;
    }

    public void setBoyNum(Integer boyNum) {
        this.boyNum = boyNum;
    }

    public Integer getGirlNum() {
        return girlNum;
    }

    public void setGirlNum(Integer girlNum) {
        this.girlNum = girlNum;
    }

    public Byte getIdentity() {
        return identity;
    }

    public void setIdentity(Byte identity) {
        this.identity = identity;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAvator() {
        return avator;
    }

    public void setAvator(String avator) {
        this.avator = avator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
