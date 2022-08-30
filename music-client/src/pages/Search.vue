<template>
  <div class="search">
    <nav class="searchList-nav" ref="change">
      <span :class="{isActive: toggle === 'Songs'}" @click="handleChangeView('Songs', 0)">歌曲</span>
      <span :class="{isActive: toggle === 'SongLists'}" @click="handleChangeView('SongLists', 1)">歌单</span>
    </nav>
    <component :is="currentView"></component>
  </div>
</template>

<script>
import mixin from '../mixins'
import searchSongs from '../components/search/SearchSongs'
import searchSongLists from '../components/search/SearchSongLists'
import { mapGetters } from 'vuex'

export default {
  name: 'search',
  mixins: [mixin],
  components: {
    searchSongs,
    searchSongLists
  },
  data () {
    return {
      toggle: 'Songs',
      currentView: 'searchSongs',
      getSongUrl: 'song/likeSongOfName'
    }
  },
  computed: {
    ...mapGetters([
      'searchword'
    ])
  },
  watch: {
    searchword: function () {
      this.getSong()
    }
  },
  methods: {
    // 切换组件
    handleChangeView: function (component) {
      this.currentView = 'search' + component
      this.toggle = component
    },
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
@import '../assets/css/search.scss';
</style>
