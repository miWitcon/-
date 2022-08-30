<!--
 * @Author: your name
 * @Date: 2022-02-09 08:29:28
 * @LastEditTime: 2022-02-11 10:29:58
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\pages\Home.vue
-->
<template>
  <div class="home">
    <!-- 轮播图 -->
    <swipper/>
    <!--最新作品-->
    <div class="section">
      <div class="section-title">最新作品</div>
      <song-new></song-new>
    </div>
    <!--热门歌单-->
    <div class="section">
      <div class="section-title">歌单</div>
      <content-list :contentList="songList" path="song-list-album"></content-list>
    </div>
  </div>
</template>

<script>
import Swipper from '../components/Swipper'
import ContentList from '../components/ContentList'
import SongNew from '../components/SongNew'
import { mapGetters } from 'vuex'
import mixin from '../mixins'

export default {
  name: 'Home',
  mixins: [mixin],
  components: {
    Swipper,
    ContentList,
    SongNew
  },
  computed: {
    ...mapGetters([
      'id', // 音乐id
      'isPlay', // 播放状态
      'playButtonUrl' // 播放状态的图标
    ])
  },
  mounted () {
  },
  data () {
    return {
      isPlaySongId: '',
      // 当前页面显示的歌曲数据
      songList: [], // 歌单列表
      getSongListUrl: 'songList/allSongList'
    }
  },
  watch: {},
  created () {
    this.getSongList()
  },
  methods: {
    getSongList () {
      var params = {
        title: '',
        style: ''
      }
      this.getData(params, this.getSongListUrl)
        .then((res) => {
          this.songList = res.data.sort().slice(0, 10)
        })
        .catch(err => {
          console.log('getSongListData_err', err)
        })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/css/home.scss';
</style>
