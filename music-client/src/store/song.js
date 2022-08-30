import { BASE_URL } from '@/api/config'

const song = {
  state: {
    listOfSongs: [], // 当前歌单列表
    isPlay: false, // 播放状态，默认不播放
    playButtonUrl: '#myicon-Play', // 播放状态的图标
    id: null, // 音乐ID
    url: '', // 歌曲URL
    title: '', //  歌名
    artist: '', //  歌手名
    picUrl: '', // 歌曲图片
    tempList: {}, // 单个歌单信息
    duration: 0, //  音乐时长
    curTime: 0, // 当前音乐的播放位置
    changeTime: 0, //  指定播放时刻
    autoNext: true, // 用于触发自动播放下一首
    volume: 50, // 音量
    isChange: false, // 判断是否在拖拽状态
    listIndex: null, // 当前歌曲在歌曲列表的位置
    lyric: [] // 未处理的歌词数据
  },
  getters: {
    isPlay: state => state.isPlay,
    isChange: state => {
      let isChange = state.isChange
      if (!isChange) {
        isChange = JSON.parse(window.sessionStorage.getItem('isChange') || null)
      }
      return isChange
    },
    id: state => {
      let id = state.id
      if (!id) {
        id = JSON.parse(window.sessionStorage.getItem('id') || null)
      }
      return id
    },
    url: state => {
      let url = state.url
      if (!url) {
        url = JSON.parse(window.sessionStorage.getItem('url') || null)
      }
      return url
    },
    playButtonUrl: state => {
      let playButtonUrl = state.playButtonUrl
      if (!playButtonUrl) {
        playButtonUrl = JSON.parse(window.sessionStorage.getItem('playButtonUrl') || null)
      }
      return playButtonUrl
    },
    title: state => {
      let title = state.title
      if (!title) {
        title = JSON.parse(window.sessionStorage.getItem('title') || null)
      }
      return title
    },
    artist: state => {
      let artist = state.artist
      if (!artist) {
        artist = JSON.parse(window.sessionStorage.getItem('artist') || null)
      }
      return artist
    },
    picUrl: state => {
      let picUrl = state.picUrl
      if (!picUrl) {
        picUrl = JSON.parse(window.sessionStorage.getItem('picUrl')) || `${BASE_URL}/img/songPic/tubiao.png`
      }
      return picUrl
    },
    tempList: state => {
      let tempList = state.tempList
      if (JSON.stringify(tempList) === '{}') {
        tempList = JSON.parse(window.sessionStorage.getItem('tempList') || null)
      }
      return tempList
    },
    autoNext: state => {
      let autoNext = state.autoNext
      if (!autoNext) {
        autoNext = JSON.parse(window.sessionStorage.getItem('autoNext') || null)
      }
      return autoNext
    },
    duration: state => {
      let duration = state.duration
      if (!duration) {
        duration = JSON.parse(window.sessionStorage.getItem('duration') || 0)
      }
      return duration
    },
    curTime: state => {
      let curTime = state.curTime
      if (!curTime) {
        curTime = JSON.parse(window.sessionStorage.getItem('curTime') || 0)
      }
      return curTime
    },
    changeTime: state => {
      let changeTime = state.changeTime
      if (!changeTime) {
        changeTime = JSON.parse(window.sessionStorage.getItem('changeTime') || 0)
      }
      return changeTime
    },
    listOfSongs: state => {
      let listOfSongs = state.listOfSongs
      if (!listOfSongs.length) {
        listOfSongs = JSON.parse(window.sessionStorage.getItem('listOfSongs') || null)
      }
      return listOfSongs
    },
    listIndex: state => {
      let listIndex = state.listIndex
      if (!listIndex) {
        listIndex = JSON.parse(window.sessionStorage.getItem('listIndex') || null)
      }
      return listIndex
    },
    volume: state => {
      let volume = state.volume
      if (!volume) {
        volume = JSON.parse(window.sessionStorage.getItem('volume') || null)
      }
      return volume
    },
    lyric: state => {
      let lyric = state.lyric
      if (lyric.length === 0) {
        lyric = JSON.parse(window.sessionStorage.getItem('lyric') || null)
      }
      return lyric
    }
  },
  mutations: {
    setIsPlay: (state, isPlay) => {
      state.isPlay = isPlay
      window.sessionStorage.setItem('isPlay', JSON.stringify(isPlay))
    },
    setIsChange: (state, isChange) => {
      state.isChange = isChange
      window.sessionStorage.setItem('isChange', JSON.stringify(isChange))
    },
    setId: (state, id) => {
      state.id = id
      window.sessionStorage.setItem('id', JSON.stringify(id))
    },
    setUrl: (state, url) => {
      state.url = url
      window.sessionStorage.setItem('url', JSON.stringify(url))
    },
    setPlayButtonUrl: (state, playButtonUrl) => {
      state.playButtonUrl = playButtonUrl
      window.sessionStorage.setItem('playButtonUrl', JSON.stringify(playButtonUrl))
    },
    setTitle: (state, title) => {
      state.title = title
      window.sessionStorage.setItem('title', JSON.stringify(title))
    },
    setArtist: (state, artist) => {
      state.artist = artist
      window.sessionStorage.setItem('artist', JSON.stringify(artist))
    },
    setpicUrl: (state, picUrl) => {
      state.picUrl = picUrl
      window.sessionStorage.setItem('picUrl', JSON.stringify(picUrl))
    },
    setTempList: (state, tempList) => {
      state.tempList = tempList
      window.sessionStorage.setItem('tempList', JSON.stringify(tempList))
    },
    setAutoNext: (state, autoNext) => {
      state.autoNext = autoNext
      window.sessionStorage.setItem('autoNext', JSON.stringify(autoNext))
    },
    setDuration: (state, duration) => {
      state.duration = duration
      window.sessionStorage.setItem('duration', JSON.stringify(duration))
    },
    setCurTime: (state, curTime) => {
      state.curTime = curTime
      window.sessionStorage.setItem('curTime', JSON.stringify(curTime))
    },
    setChangeTime: (state, changeTime) => {
      state.changeTime = changeTime
      window.sessionStorage.setItem('changeTime', JSON.stringify(changeTime))
    },
    setListOfSongs: (state, listOfSongs) => {
      state.listOfSongs = listOfSongs
      window.sessionStorage.setItem('listOfSongs', JSON.stringify(listOfSongs))
    },
    setListIndex: (state, listIndex) => {
      state.listIndex = listIndex
      window.sessionStorage.setItem('listIndex', JSON.stringify(listIndex))
    },
    setLyric: (state, lyric) => {
      state.lyric = lyric
      window.sessionStorage.setItem('lyric', JSON.stringify(lyric))
    },
    setVolume: (state, volume) => {
      state.volume = volume
      window.sessionStorage.setItem('volume', JSON.stringify(volume))
    }
  }
}

export default song
