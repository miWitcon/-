<template>
  <div id="songNew">
    <el-row :gutter="12">
      <el-col :span="12" v-for="(item,index) in musicList" :key="item.id">
        <el-card shadow="always">
          <span class="index">{{index+1}}</span>
          <div class="img" @click="toplay(item.songId, item.url, item.pic, index,
            item.songName, item.username, item.lyric)">
            <el-image :src="attachImageUrl(item.pic) + '?param=200y200'"></el-image>
          </div>
          <!-- 歌曲名 -->
          <span class="musicName">《{{item.songName}}》</span>
          <!--歌手-->
          <span class="singerName">{{item.username}}</span>
          <!--时长-->
          <span class="albomName">
            {{ formatSeconds(item.duration) }}
          </span>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import mixin from '../mixins'
export default {
  name: 'songNew',
  mixins: [mixin],
  props: {},
  data () {
    return {
      musicList: [],
      getSongDataUrl: 'song/allSong'
    }
  },
  created () {
    this.getSongData()
  },
  methods: {
    getSongData () {
      this.getData({}, this.getSongDataUrl)
        .then(res => {
          this.musicList = res.data.datas.sort().slice(0, 10)
          this.$store.commit('setListOfSongs', this.musicList)
        })
        .then(err => {
          console.log('getSongData_err=>', err)
        })
    }
  }
}
</script>

<style lang="scss" scoped>

  // /deep/  深度选择器
  /deep/ .el-card__body{
    padding: 5px;
    display: flex;
    align-items: center;
    justify-content: space-around;
  }
  #songNew {
    .el-card {
      margin: 5px;
      &:hover{
        cursor: pointer;
      }
      span {
        display: flex;
        justify-content: center;
      }

      .index {
        width: 1px;
        margin-left: 20px;
      }

      .img {
        width: 65px;
        height: 65px;
        margin: 0px 25px;
        padding: 5px;
      }

      .musicName
      {
        display: block;
        font-size: 14px;
        flex: 2;
        white-space:nowrap;
        overflow: hidden;
        text-overflow:ellipsis;
        text-align: center;
      }

      .albomName
      {
        display: block;
        margin-left: 10px;
        flex: 1;
        overflow: hidden;
        white-space:nowrap;
        text-overflow:ellipsis;
        font-size: 14px;
        text-align: center;
      }

      .singerName
      {
        display: block;
        flex: 1;
        overflow: hidden;
        white-space:nowrap;
        text-overflow:ellipsis;
        font-size: 14px;
        text-align: center;
        font-weight: 700;
      }
    }
  }

</style>
