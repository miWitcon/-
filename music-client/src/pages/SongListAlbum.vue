<template>
  <div class="song-list-album">
    <div class="album-slide">
      <div class="album-img">
        <img :src=attachImageUrl(songListInfo.pic) alt="">
      </div>
      <div class="album-info">
        <h2>简介：</h2>
        <span>
          {{songListInfo.introduction}}
        </span>
      </div>
    </div>
    <div class="album-content">
      <div class="album-title">
        <p>{{songListInfo.title}}</p>
      </div>
      <!--歌曲-->
      <div class="songs-body">
        <album-content type="songListAlbum" :songList="listOfSongs">
          <template slot="title">歌单</template>
        </album-content>
      </div>
    </div>
  </div>
</template>

<script>
import mixin from '../mixins'
import AlbumContent from '../components/AlbumContent'
import Comment from '../components/Comment'
import { mapGetters } from 'vuex'

export default {
  name: 'song-list-album',
  mixins: [mixin],
  components: {
    AlbumContent,
    Comment
  },
  data () {
    return {
      songs: [],
      songListInfo: {},
      count: 0, // 点赞数
      songListId: '', // 歌单ID
      getListSongUrl: 'listSong/detail'
    }
  },
  computed: {
    ...mapGetters([
      'loginIn', // 登录标识
      'tempList', // 单个歌单信息
      'listOfSongs', // 歌单中的歌曲
      'userId', // 用户ID
      'avator' // 用户头像
    ])
  },
  created () {
    this.songListInfo = this.tempList
    this.getListSongData()
  },
  methods: {
    // 获取歌单里的歌曲
    getListSongData () {
      this.tableData = []
      this.tempDate = []
      this.getData({songListId: this.tempList.id}, this.getListSongUrl)
        .then(res => {
          for (let item of res.data) {
            this.songs.push(item.song)
          }
          this.$store.commit('setListOfSongs', this.songs)
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/css/song-list-album.scss';
</style>
