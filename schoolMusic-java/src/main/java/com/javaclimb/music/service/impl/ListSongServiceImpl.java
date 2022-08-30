package com.javaclimb.music.service.impl;

import com.javaclimb.music.dao.ListSongMapper;
import com.javaclimb.music.domain.ListSong;
import com.javaclimb.music.service.ListSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 歌单里面的歌曲Service实现类
 */
@Service
public class ListSongServiceImpl implements ListSongService {

    @Autowired
    private ListSongMapper listSongMapper;
    @Override
    public boolean insert(ListSong listSong) {
        return listSongMapper.insert(listSong)>0;
    }

    @Override
    public boolean update(ListSong listSong) {
        return listSongMapper.update(listSong)>0;
    }

    @Override
    public boolean delete(Integer id) {
        return listSongMapper.delete(id)>0;
    }

    @Override
    public boolean deleteBySongIdAndSongListId(List<ListSong> list) {
        return listSongMapper.deleteBySongIdAndSongListId(list)>0;
    }

    @Override
    public ListSong selectByPrimaryKey(Integer id) {
        return listSongMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ListSong> allListSong() {
        return listSongMapper.allListSong();
    }

    @Override
    public List<ListSong> listSongOfSongList(Integer songListId) {
        return listSongMapper.listSongOfSongList(songListId);
    }

    @Override
    public List<ListSong> songNoInList(Integer songListId,String songName,String username) {
        return listSongMapper.songNoInList(songListId, songName, username);
    }
}
