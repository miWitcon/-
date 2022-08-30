<template>
  <div class="search-song-Lists">
    <content-list :contentList="data" path="song-list-album"></content-list>
    <div class="pagination">
        <el-pagination
          @current-change="handleCurrentChange"
          background
          layout="total, prev, pager, next, jumper"
          :current-page="currentPage"
          :page-size="pageSize"
          :total="albumDatas.length">
        </el-pagination>
      </div>
  </div>
</template>

<script>
import mixin from '../../mixins'
import ContentList from '../ContentList'
import { mapGetters } from 'vuex'

export default {
  name: 'search-song-Lists',
  mixins: [mixin],
  components: {
    ContentList
  },
  data () {
    return {
      pageSize: 10, // 页数
      currentPage: 1, // 当前页
      albumDatas: [],
      getSongListUrl: 'songList/allSongList'
    }
  },
  computed: {
    ...mapGetters([
      'searchword' // 关键字
    ]),
    // 计算当前表格中的数据
    data () {
      return this.albumDatas.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  watch: {
    searchword: function () {
      this.getSearchList()
    }
  },
  mounted () {
    this.getSearchList()
  },
  methods: {
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    getSearchList () {
      if (!this.$route.query.keywords) return
      var params = {
        title: this.searchword,
        style: ''
      }
      this.getData(params, this.getSongListUrl)
        .then(res => {
          if (!res.data.length) {
            this.notify('暂无该歌单内容', 'warning')
          } else {
            this.albumDatas = res.data
          }
        })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../../assets/css/search-song-Lists.scss';
</style>
