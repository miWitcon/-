<template>
  <div class="search-songs">
    <album-content type="songListAlbum" :songList="listOfSongs"></album-content>
  </div>
</template>

<script>
import mixin from '../../mixins'
import AlbumContent from '../AlbumContent'
import { mapGetters } from 'vuex'

export default {
  name: 'search-songs',
  mixins: [mixin],
  components: {
    AlbumContent
  },
  data () {
    return {
      getSongUrl: 'song/likeSongOfName'
    }
  },
  computed: {
    ...mapGetters([
      'listOfSongs' // 存放的音乐
    ])
  },
  mounted () {
    this.getSong()
  },
  methods: {
    // 搜索音乐
    getSong () {
      if (!this.$route.query.keywords) {
        this.$store.commit('setListOfSongs', [])
        return
      }
      this.getData({name: this.$route.query.keywords}, this.getSongUrl)
        .then(res => {
          if (!res.data.length) {
            this.$store.commit('setListOfSongs', [])
            this.notify('系统暂无该歌曲', 'warning')
          } else {
            this.$store.commit('setListOfSongs', res.data)
          }
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../../assets/css/search-songs.scss';
</style>
