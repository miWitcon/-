package com.javaclimb.music.dao;

import com.javaclimb.music.domain.Collect;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 收藏Dao
 */
@Repository
public interface CollectMapper {
    /**
     * 增加
     */
    public int insert(Collect collect);

    /**
     * 删除
     */
    public int delete(Integer collectId);

    /**
     * 根据userId和歌曲Id删除
     */
    public int deleteByUserIdSongId(@Param("userId") Integer userId, @Param("songId") Integer songId);

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
    public int exitSongId(@Param("userId") Integer userId,@Param("songId") Integer songId);

    /**
     * 查询某个用户是否收藏过某个歌曲
     */
    public int isDeleted(@Param("userId") Integer userId,@Param("songId") Integer songId);

    /**
     * 根据userId和歌曲Id重新收藏
     */
    public int update(@Param("userId") Integer userId, @Param("songId") Integer songId);

}
