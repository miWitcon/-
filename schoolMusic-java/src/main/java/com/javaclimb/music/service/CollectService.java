package com.javaclimb.music.service;

import com.javaclimb.music.domain.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 收藏service接口
 */
public interface CollectService {
    /**
     * 增加
     */
    public boolean insert(Collect collect);

    /**
     * 删除
     */
    public boolean delete(Integer collectId);

    /**
     * 根据userId和歌曲Id删除
     */
    public boolean deleteByUserIdSongId(Integer userId, Integer songId);

    /**
     * 查询所有收藏
     */
    public List<Collect> allCollect();

    /**
     * 查询某个用户的收藏列表
     */
    public List<Collect> collectOfUserId(Integer userId);

    /**
     * 查询某个用户是否已收藏了某个歌曲
     */
    public boolean exitSongId(@Param("userId") Integer userId, @Param("songId") Integer songId);

    /**
     * 查询某个用户是否收藏过某个歌曲
     */
    public boolean isDeleted(@Param("userId") Integer userId,@Param("songId") Integer songId);

    /**
     * 根据userId和歌曲Id重新收藏
     */
    public boolean update(@Param("userId") Integer userId, @Param("songId") Integer songId);
}
