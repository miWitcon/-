<template>
  <div class="play-bar" :class="{show: toggle==false}">
    <div
      class="drop-down"
      @click="toggle = !toggle"
      :class="{turn: toggle==false}"
    >
      <svg class="icon show-icon1">
        <use xlink:href="#myicon-xiala-yuan"/>
      </svg>
    </div>
    <div class="kongjian">
      <!-- 上一首 -->
      <div class="item" @click="prev">
        <svg class="icon show-icon1">
          <use xlink:href="#myicon-Prev"/>
        </svg>
      </div>
      <!-- 播放 -->
      <div class="item" @click="togglePlay">
        <svg class="icon show-icon1">
          <use :xlink:href="playButtonUrl"/>
        </svg>
      </div>
      <!-- 下一首 -->
      <div class="item" @click="next">
        <svg class="icon show-icon1">
          <use xlink:href="#myicon-Next"/>
        </svg>
      </div>
      <!-- 歌曲图片 -->
      <div class="item-img" v-if="picUrl !=='' && picUrl !==null" @click="goPlayerPage">
        <img :src="picUrl" alt=""/>
      </div>
      <div class="block">
        <!-- 歌手-歌名 -->
        <span>{{ this.title }}-{{ this.artist }}</span>
        <div class="slider">
          <!-- 播放时间进度 -->
          <span class="duiqi">{{ this.nowTime }}</span>
          <!-- 进度条 -->
          <el-slider
            v-model="curlength"
            :show-tooltip="false"
            style="width:70%"
            @change="changeMusicDuration"
            @mousedown.native="mousedown"
            @mouseup.native="mouseup"
          >
          </el-slider>
          <!-- 结束时间 -->
          <span class="duiqi">{{ this.songTime }}</span>
        </div>
      </div>
      <!-- 音量 -->
      <div class="item icon-volume" style="border:2px soild red">
        <svg v-if="volume !== 0" class="icon" aria-hidden="true">
          <use xlink:href="#myicon-Volume"/>
        </svg>
        <svg v-else class="icon" aria-hidden="true">
          <use xlink:href="#myicon-Mute"/>
        </svg>
        <el-slider
          class="volume"
          v-model="volume"
          :vertical="true"
        />
      </div>
      <!-- 收藏 -->
      <div class="item" @click="collectSong">
        <svg :class="{active:isCollect2&&loginIn}" class="icon" aria-hidden="true">
          <use xlink:href="#myicon-aixin_shixin"/>
        </svg>
      </div>
      <!--  下载 -->
      <div class="item" @click="downloadMusic">
        <svg class="icon">
          <use xlink:href="#myicon-yunxiazai"/>
        </svg>
      </div>
      <!-- 当前播放的歌曲列表 -->
      <div class="item item-list" @click="changeAside">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#myicon-yinpingedanguanlibeifen"/>
        </svg>
      </div>
    </div>
  </div>

</template>
<script>
import { mapGetters } from 'vuex'
import mixin from '@/mixins'

export default {
  name: 'play-bar',
  mixins: [mixin],
  data () {
    return {
      isCollect2: this.isCollect,
      nowTime: '00:00', // 当前播放进度的时间
      songTime: '00:00', // 歌曲总时间
      curlength: 0, // 进度条的位置
      volume: 50, // 音量
      toggle: true, // 是否显示播放器
      collectInfo: {}, // 收藏歌曲对象
      isChange: false,
      showVolumeSlider: false,
      addCollectUrl: 'collect/add',
      isCollectUrl: 'collect/isCollect'
    }
  },
  computed: {
    ...mapGetters([
      'id', // 音乐id
      'url', // 音乐地址
      'isPlay', // 播放状态
      'playButtonUrl', // 播放状态的图标
      'picUrl', // 歌曲图片
      'title', //  歌名
      'artist', //  歌手名
      'duration', //  音乐时长
      'curTime', // 当前音乐的播放位置
      'changeTime', //  指定播放时刻
      'listOfSongs', // 当前歌单列表
      'autoNext', // 用于触发自动播放下一首
      'showAside', // 是否显示侧边栏
      'listIndex', // 当前歌曲在歌曲列表的位置
      'loginIn', // 用户是否登录
      'userId', // 用户 id
      'isCollect'
    ])
  },
  watch: {
    isCollect (val) {
      this.isCollect2 = val
    },
    // 切换播放状态的图标
    isPlay (val) {
      if (val) {
        this.$store.commit('setPlayButtonUrl', '#myicon-Pause')
      } else {
        this.$store.commit('setPlayButtonUrl', '#myicon-Play')
      }
    },
    // 音量
    volume () {
      this.$store.commit('setVolume', this.volume / 100)
    },
    // 播放时间的开始和结束
    curTime () {
      this.nowTime = this.formatSeconds(this.curTime)
      this.songTime = this.formatSeconds(this.duration)
      // 移动进度条
      this.curlength = (this.curTime / this.duration) * 100
    },
    // 自动播放下一首
    autoNext () {
      this.next()
    }
  },
  mounted () {
    // 点击音量图标出现滑条，再点击隐藏
    document.querySelector('.icon-volume').addEventListener('click', function (e) {
      var _con = document.querySelector('.volume')
      if (_con.classList.contains('show-volume') === true) {
        document.querySelector('.volume').classList.remove('show-volume')
      } else {
        document.querySelector('.volume').classList.add('show-volume')
        e.stopPropagation()
      }
    }, false)
    document.querySelector('.volume').addEventListener('click', function (e) {
      e.stopPropagation()
    }, false)
    // 点击其他地方隐藏音量条
    document.addEventListener('click', function () {
      document.querySelector('.volume').classList.remove('show-volume')
    }, false)
    // 点击其他地方隐藏列表
    document.addEventListener('mouseup', (e) => {
      var _con = document.querySelector('.item-list')
      if (_con) {
        if (!_con.contains(e.target)) {
          this.$store.commit('setShowAside', false)
        }
      }
    })
  },
  created () {
    this.isCollect2 = this.isCollect
  },
  methods: {
    // 下载歌曲
    downloadMusic () {
      if (this.loginIn) {
        this.getBlobData({}, this.url)
          .then(res => {
            let content = res.data
            let eleLink = document.createElement('a')
            eleLink.download = `${this.artist}-${this.title}.mp3`
            eleLink.style.display = 'none'
            // 字符内容转变成blob地址
            let blob = new Blob([content])
            eleLink.href = URL.createObjectURL(blob)
            // 触发点击
            document.body.appendChild(eleLink)
            eleLink.click()
            // 然后移除
            document.body.removeChild(eleLink)
          })
          .catch(err => {
            console.log('downloadMusic err=>', err)
          })
      } else {
        this.$message({
          showClose: true,
          offset: 200,
          message: '登陆后才能下载哦，亲！',
          type: 'warning'
        })
      }
    },
    // 跳转到歌词页面
    goPlayerPage () {
      this.$router.push({path: `/lyric/${this.id}`})
    },
    // 点击列表图标展示歌曲列表
    changeAside () {
      this.$store.commit('setShowAside', !this.showAside)
    },
    // 控制音乐播放 / 暂停
    togglePlay () {
      if (this.isPlay) {
        this.$store.commit('setIsPlay', false)
      } else {
        this.$store.commit('setIsPlay', true)
      }
    },
    // 拖拽开始/用于解决久按鼠标拖拽slider滑块滑动到指定位置无效
    mousedown () {
      this.$store.commit('setIsChange', true)
    },
    // 拖拽结束
    mouseup () {
      this.$store.commit('setIsChange', false)
    },
    // 鼠标拖拽松开时
    changeMusicDuration () {
      if (this.duration === 0) return
      let time = this.curlength / 100 * this.duration
      this.$store.commit('setChangeTime', time)
    },
    collectSong () {
      if (this.loginIn) {
        var params = {
          userId: this.userId,
          type: 0,
          songId: this.id
        }
        this.postData(params, this.addCollectUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.isCollect2 = true
              this.$store.commit('setIsCollect', true)
              this.notify('收藏成功', 'success')
            } else if (res.data.code === 2) {
              this.isCollect2 = false
              this.$store.commit('setIsCollect', false)
              this.notify('取消收藏成功', 'success')
            } else {
              this.$notify.error({
                title: '收藏失败',
                showClose: false
              })
            }
          })
          .catch(err => {
            console.log('collectSong_err=>', err)
          })
      } else {
        this.notify('请先登录哦！', 'warning')
      }
    },
    // 选中播放
    toPlay (url) {
      if (url && url !== this.url) {
        this.$store.commit('setId', this.listOfSongs[this.listIndex].songId)
        this.$store.commit('setUrl', this.$store.state.configure.HOST + url)
        this.$store.commit('setpicUrl', this.$store.state.configure.HOST + this.listOfSongs[this.listIndex].pic)
        this.$store.commit('setTitle', this.listOfSongs[this.listIndex].songName)
        this.$store.commit('setArtist', this.listOfSongs[this.listIndex].username)
        this.$store.commit('setLyric', this.parseLyric(this.listOfSongs[this.listIndex].lyric))
        if (this.loginIn === true) {
          var params = {
            userId: this.userId,
            songId: this.listOfSongs[this.listIndex].songId
          }
          this.getData(params, this.isCollectUrl)
            .then(res => {
              if (res.data.code === 1) {
                this.isCollect2 = true
                this.$store.commit('setIsCollect', true)
              } else {
                this.isCollect2 = false
                this.$store.commit('setIsCollect', false)
                console.log('isCollect', this.isCollect)
              }
            })
            .catch(err => {
              console.log('toPlay_err=>', err)
            })
        }
      }
    },
    // 上一首
    prev () {
      if (this.listIndex !== -1 && this.listOfSongs.length > 1) {
        this.$store.commit('setIsPlay', true)
        if (this.listIndex > 0) {
          this.$store.commit('setListIndex', this.listIndex - 1)
          this.toPlay(this.listOfSongs[this.listIndex].url)
        } else {
          this.$store.commit('setListIndex', this.listOfSongs.length - 1)
          this.toPlay(this.listOfSongs[this.listIndex].url)
        }
      }
    },
    // 下一首
    next () {
      if (this.listIndex !== -1 && this.listOfSongs.length > 1) {
        this.$store.commit('setIsPlay', true)
        if (this.listIndex < this.listOfSongs.length - 1) {
          this.$store.commit('setListIndex', this.listIndex + 1)
          this.toPlay(this.listOfSongs[this.listIndex].url)
        } else {
          this.$store.commit('setListIndex', 0)
          this.toPlay(this.listOfSongs[0].url)
        }
      }
    },
    // 解析歌词
    parseLyric (text) {
      let lines = text.split('\n') // 将歌词按行解析成数组
      let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g // 时间格式的正则表达式
      let result = [] // 返回值

      // 对于歌词格式不对的特殊处理
      if (!(/\[.+\]/.test(text))) {
        return [[0, text]]
      }

      // 去掉前面时间格式不正确的行
      while (!pattern.test(lines[0])) {
        lines = lines.slice(1)
      }

      // 遍历每一行，形成一个每行带着两元素的数组，第一个元素是时间，第二个元素是歌词
      lines[lines.length - 1].length === 0 && lines.pop()
      for (let item of lines) {
        let time = item.match(pattern) // 存前面的时间段
        let value = item.replace(pattern, '') // 存歌词
        for (let item1 of time) {
          let t = item1.slice(1, -1).split(':') // 取出时间，换算成数组
          if (value !== '') {
            result.push([parseInt(t[0], 10) * 60 + parseFloat(t[1]), value])
          }
        }
      }
      // 按照第一个元素--时间--排序
      result.sort(function (a, b) {
        return a[0] - b[0]
      })
      return result
    }
  }
}
</script>

<style  lang="scss" scoped>
@import '../assets/css/play-bar';
</style>
