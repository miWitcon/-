package com.javaclimb.music.service;

import com.javaclimb.music.domain.Song;

import java.util.List;

/**
 * 歌曲service接口
 */
public interface SongService {
    /**
     * 增加
     */
    public boolean insert(Song song);

    /**
     * 修改
     */
    public boolean update(Song song);

    /**
     * 删除
     */
    public boolean delete(List<Integer> songId);

    /**
     * 根据主键查询整个对象
     */
    public Song selectByPrimaryKey(Integer songId);

    /**
     * 查询所有歌手
     */
    public List<Song> allSong(String songName,String username);

    /**
     * 根据歌名精确查询列表
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
