<template>
  <div class="song-list">
    <ul class="song-list-header">
      <li
        v-for="(item, index) in songStyle"
        :key="index"
        :class="{active: item.style === activeName}"
        @click="handleChangeView(item.style)">
        {{item.style}}
      </li>
    </ul>
    <div class="song-content">
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
  </div>
</template>

<script>
import ContentList from '../components/ContentList'
import { mapGetters } from 'vuex'

export default {
  name: 'song-list',
  components: {
    ContentList
  },
  data () {
    return {
      songStyle: [], // 歌单导航栏类别
      activeName: '全部歌单',
      pageSize: 10, // 页数
      currentPage: 1, // 当前页
      albumDatas: [], // 歌单
      setAllStyleUrl: 'songList/allStyle',
      songListUrl: 'songList/allSongList'
    }
  },
  computed: {
    ...mapGetters([
      'songsList'
    ]),
    // 计算当前表格中的数据
    data () {
      return this.albumDatas.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  mounted () {
    this.handleChangeView('全部歌单')
  },
  created () {
    this.getAllListStyle()
  },
  methods: {
    getAllListStyle () {
      this.getData({}, this.setAllStyleUrl)
        .then(res => {
          this.songStyle = res.data
          // 数组头添加全部歌单
          this.songStyle.unshift({style: '全部歌单', songListNum: ''})
        })
        .catch(err => {
          console.log('getAllListStyle_err', err)
        })
    },
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    // 获取歌单
    handleChangeView: function (styleName) {
      this.activeName = styleName
      this.albumDatas = []
      this.getSongListData(styleName)
    },
    // 获取歌单信息
    getSongListData (styleName) {
      var params
      if (styleName === '全部歌单') {
        params = {
          title: '',
          style: ''
        }
      } else {
        params = {
          title: '',
          style: styleName
        }
      }
      this.getData(params, this.songListUrl)
        .then((res) => {
          this.currentPage = 1
          this.albumDatas = res.data
        })
        .catch(err => {
          console.log('getSongListData_err', err)
        })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/song-list.scss';
</style>
