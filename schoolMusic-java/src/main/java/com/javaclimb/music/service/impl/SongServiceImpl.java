package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.SongMapper;
import com.javaclimb.music.domain.Song;
import com.javaclimb.music.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 歌曲service实现类
 */
@Service
public class SongServiceImpl implements SongService {

    @Autowired
    private SongMapper songMapper;

    @Override
    public boolean insert(Song song) {
        return songMapper.insert(song)>0;
    }

    @Override
    public boolean update(Song song) {
        return songMapper.update(song)>0;
    }

    @Override
    public boolean delete(List<Integer> songId) {
        return songMapper.delete(songId)>0;
    }

    @Override
    public Song selectByPrimaryKey(Integer songId) {
        return songMapper.selectByPrimaryKey(songId);
    }

    @Override
    public List<Song> likeSongOfName(String name) {
        return songMapper.likeSongOfName(name);
    }

    @Override
    public List<Song> allSong(String songName,String username) {
        return songMapper.allSong(songName, username);
    }

    @Override
    public List<Song> songOfName(String songName) {
        return songMapper.songOfName(songName);
    }

    @Override
    public List<Song> songOfSingerId(Integer userId) {
        return songMapper.songOfSingerId(userId);
    }

    @Override
    public Integer songNum() {
        return songMapper.songNum();
    }

    @Override
    public List<Song> weekUploadNum() {
        return songMapper.weekUploadNum();
    }

    @Override
    public List<Song> avgScoreAndColNum() {
        return songMapper.avgScoreAndColNum();
    }
}
