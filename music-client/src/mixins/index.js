import { mapGetters } from 'vuex'

// 公共方法
const mixin = {
  computed: {
    ...mapGetters([
      'isPlay'
    ])
  },
  methods: {
    // 提示信息
    notify (title, type) {
      this.$notify({
        title: title,
        type: type
      })
    },
    // 获取图片信息
    attachImageUrl (srcUrl) {
      return srcUrl ? this.$store.state.configure.HOST + srcUrl || '../assets/img/user.jpg' : ''
    },
    attachBirth (val) {
      let birth = String(val).match(/[0-9-]+(?=\s)/)
      return Array.isArray(birth) ? birth[0] : birth
    },
    // 得到名字后部分
    replaceFName (str) {
      let arr = str.split('-')
      return arr[1]
    },
    // 得到名字前部分
    replaceLName (str) {
      let arr = str.split('-')
      return arr[0]
    },
    getUnReadMsgNum (userId) {
      this.getData({userId: userId}, 'userNotice/unReadNum')
        .then(res => {
          this.$store.commit('setUnReadMsgNum', res.data)
        })
        .catch(err => {
          console.log('getUnReadMsgNum_err', err)
        })
    },
    // 播放
    toplay: function (id, url, pic, index, songName, username, lyric) {
      if (this.isPlay === true && this.id === id) {
        this.$store.commit('setIsPlay', false)
      } else {
        this.$store.commit('setIsPlay', true)
      }
      this.$store.commit('setId', id)
      this.$store.commit('setListIndex', index)
      this.$store.commit('setUrl', this.$store.state.configure.HOST + url)
      this.$store.commit('setpicUrl', this.$store.state.configure.HOST + pic)
      this.$store.commit('setTitle', songName)
      this.$store.commit('setArtist', username)
      this.$store.commit('setLyric', this.parseLyric(lyric))
      if (this.loginIn === true) {
        var params = {
          userId: this.userId,
          songId: id
        }
        this.getData(params, this.isCollectUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.$store.commit('setIsCollect', true)
            } else {
              this.$store.commit('setIsCollect', false)
            }
          })
          .catch(err => {
            console.log('toPlay_err=>', err)
          })
      }
    },
    // 解析播放时间
    formatSeconds (value) {
      let theTime = parseInt(value)
      let result = ''
      let hour = parseInt(theTime / 3600) // 时
      let minute = parseInt((theTime / 60) % 60) // 分
      let second = parseInt(theTime % 60) // 秒
      if (hour > 0) { // 多少时
        if (hour < 10) {
          result += '0' + hour + ':'
        } else {
          result += hour + ':'
        }
      }
      if (minute > 0) { // 多少分
        if (minute < 10) {
          result += '0' + minute + ':'
        } else {
          result += minute + ':'
        }
      } else {
        result += '00:'
      }
      if (second > 0) { // 多少分
        if (second < 10) {
          result += '0' + second
        } else {
          result += second
        }
      } else {
        result += '00'
      }
      return result
    },
    // 解析歌词
    parseLyric (text) {
      let lines = text.split('\n') // 将歌词按行解析成数组
      let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g // 时间格式的正则表达式
      let result = [] // 返回值

      for (var i = 0; i < lines.length; i++) {
        if (lines[i].match(pattern) === null) {
          lines.splice(i, 1)
          i--
        }
      }

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
      // console.log('lines=>', lines)
      for (let item of lines) {
        // console.log('item=>', item)
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

export default mixin
