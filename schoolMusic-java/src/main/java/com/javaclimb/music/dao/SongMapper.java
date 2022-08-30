package com.javaclimb.music.dao;

import com.javaclimb.music.domain.Song;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 歌手Dao
 */
@Repository
public interface SongMapper {
    /**
     * 增加
     */
    public int insert(Song song);

    /**
     * 修改
     */
    public int update(Song song);

    /**
     * 删除
     */
    public int delete(List<Integer> songId);

    /**
     * 根据主键查询整个对象
     */
    public Song selectByPrimaryKey(Integer songId);

    /**
     * 查询所有歌曲
     */
    public List<Song> allSong(String songName,String username);

    /**
     * 根据歌名字精确查询列表
     */
    public List<Song> songOfName(String songName);

    /**
     * 根据歌名或发布者名模糊查询列表
     */
    public List<Song> likeSongOfName(String name);

    /**
     * 根据歌手id查询
     */
    public List<Song> songOfSingerId(Integer userId);

    /**
     * 查询所有歌曲的平均分及被收藏量
     * @return
     */
    public List<Song> avgScoreAndColNum();

    /**
     * 获取周上传量
     */
    public List<Song> weekUploadNum();

    /**
     * 查询歌曲总数
     */
    public Integer songNum();

}
