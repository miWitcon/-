<template>
  <div class="song-lyric">
    <br><br><br><br>
    <!--评分-->
    <div class="song-score">
      <div class="avergeScore" style="width:140px;">
        <h3>歌曲评分：</h3>
        <div>
          <el-rate v-model="aveScore" disabled></el-rate>
        </div>
      </div>
      <span>{{ aveScore * 2 }}</span>
      <div style="width:140px;float:right;" v-show="loginIn">
        <h3>评价：</h3>
        <div @click="pushValue()">
          <el-rate v-model="myScore" allow-half></el-rate>
        </div>
      </div>
    </div>
    <h1 class="lyric-title">歌词</h1>
    <transition-group name="lyric-fade">
      <!--有歌词-->
      <ul :style="{top:lrcTop}" class="has-lyric" v-if="lyr.length > 2" key="has-lyric">
        <li v-for="(item, index) in lyr" v-bind:key="index">
          {{ item[1] }}
        </li>
      </ul>
      <!--没歌词-->
      <div v-else class="no-lyric" key="no-lyric">
        <span>暂无歌词</span>
      </div>
    </transition-group>
    <comment :playId="id" :type="0"></comment>
  </div>
</template>

<script>
import mixin from '@/mixins'
import Comment from '@/components/Comment'
import { mapGetters } from 'vuex'

export default {
  name: 'lyric',
  mixins: [mixin],
  components: {
    Comment
  },
  data () {
    return {
      myScore: 0,
      value: null,
      aveScore: 0, // 评价评分
      lrcTop: '200px', // 歌词滑动
      showLrc: false, // 切换唱片和歌词
      lyr: [], // 当前歌曲的歌词
      getSongScoreUrl: '/rank/aveRank',
      getUserScoreUrl: 'rank/selfRatedScore',
      addScoreUrl: 'rank/add'
    }
  },
  computed: {
    ...mapGetters([
      'curTime',
      'id', // 歌曲ID
      'lyric', // 歌词
      'listOfSongs', // 存放的音乐
      'listIndex', // 当前歌曲在歌曲列表的位置
      'userId',
      'loginIn'
    ])
  },
  watch: {
    id: function () {
      this.lyr = this.parseLyric(this.listOfSongs[this.listIndex].lyric)
      if (this.id !== null) {
        this.getScore(this.id)
        if (this.loginIn) {
          this.getSelfRatedScore(this.id, this.userId)
        }
      }
    },
    // 播放时间的开始和结束
    curTime: function () {
      // 处理歌词位置及颜色
      if (this.lyr.length > 2) {
        for (let i = 0; i < this.lyr.length; i++) {
          if (this.curTime >= this.lyr[i][0]) {
            for (let j = 0; j < this.lyr.length; j++) {
              document.querySelectorAll('.has-lyric li')[j].style.color = '#000'
              document.querySelectorAll('.has-lyric li')[j].style.fontSize = '15px'
            }
            if (i >= 0) {
              document.querySelectorAll('.has-lyric li')[i].style.color = '#95d2f6'
              document.querySelectorAll('.has-lyric li')[i].style.fontSize = '25px'
            }
          }
        }
      }
    }
  },
  created () {
    this.lyr = this.lyric ? this.lyric : []
    if (this.id !== null) {
      this.getScore(this.id)
      if (this.loginIn) {
        this.getSelfRatedScore(this.id, this.userId)
      }
    }
  },
  methods: {
    getScore (songId) {
      this.getData({songId: songId}, this.getSongScoreUrl)
        .then(res => {
          this.aveScore = res.data / 2
        })
        .catch(err => {
          console.log('getScore_err=>', err)
        })
    },
    getSelfRatedScore (songId, userId) {
      var params = {
        songId: songId,
        userId: userId
      }
      this.getData(params, this.getUserScoreUrl)
        .then(res => {
          if (res.data === -1) {
            this.myScore = 0
          } else {
            this.myScore = res.data / 2
          }
        })
        .catch(err => {
          console.log('getSelfRatedScore_err=>', err)
        })
    },
    pushValue () {
      if (this.loginIn) {
        var params = {
          songId: this.id,
          userId: this.userId,
          score: this.myScore * 2
        }
        this.postData(params, this.addScoreUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.getScore(this.id)
            } else {
              this.$message.error('评分失败')
            }
          })
          .catch(err => {
            console.log('pushValue_err', err)
          })
      } else {
        this.$message({
          showClose: true,
          offset: 200,
          type: 'warning',
          message: '先登录才能评分哦！'
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/lyric.scss';
</style>
