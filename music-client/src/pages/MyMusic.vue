<template>
  <div class="my-music">
    <div class="album-slide">
      <div class="album-img">
        <img :src=attachImageUrl(avator) alt="">
      </div>
      <ul class="album-info">
        <li>昵称： {{username}}</li>
        <li>性别： {{userSex}}</li>
        <li>生日： {{birth}}</li>
        <li>地区： {{locationIndex}}</li>
      </ul>
    </div>
    <div class="album-content">
      <div class="album-title">个性签名: {{introduction}}</div>
      <ul class="song-list-header">
        <li
          v-for="(item, index) in menu"
          :key="index"
          :class="{active: item.type === activeName}"
          @click="handleChangeView(item.type)">
          {{item.type}}
        </li>
      </ul>
      <div class="songs-body" v-if="activeName === '我的收藏'">
        <album-content type="myCollect" :songList="collectList" @getCollection="getCollection2">
          <template slot="title">
            我的收藏
          </template>
        </album-content>
      </div>
      <div class="songs-body" v-else>
        <album-content type="myMusic" :songList="mySongList" @getMySong="getMySong">
          <template slot="title">
            我的作品
          </template>
          <template slot="addSong">
            <div class="item" @click="centerDialogVisible = true">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#myicon-yunshangchuan"/>
              </svg>
            </div>
          </template>
        </album-content>
      </div>
    </div>

    <!--添加歌曲-->
    <el-dialog title="添加歌曲" :visible.sync="centerDialogVisible" width="400px" center>
      <el-form action="" :model="registerForm" ref="registerForm" id="tf">
        <el-form-item label="歌曲名" size="mini">
          <el-input type="text" name="songName" v-model="registerForm.songName"></el-input>
        </el-form-item>
        <el-form-item label="想法" size="mini">
          <el-input type="text"  name="introduction" v-model="registerForm.introduction"></el-input>
        </el-form-item>
        <el-form-item label="歌词" size="mini">
          <el-input type="textarea"  name="lyric" v-model="registerForm.lyric"></el-input>
        </el-form-item>
        <el-form-item label="歌曲上传" size="mini">
          <!-- <el-upload
              class="upload-demo change"
              action="#"
              :show-file-list="false"
              :on-change="uploadChange"
              :on-success="handleSongSuccess"
              :before-upload="beforeSongUpload">
              <el-button size="mini">更新歌曲</el-button>
            </el-upload> -->
          <br>
          <input type="file" name="file" id="songFile">
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="addSong">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import mixin from '../mixins'
import AlbumContent from '../components/AlbumContent'
import { location } from '@/assets/data/location'
import { mapGetters } from 'vuex'

export default {
  name: 'my-music',
  mixins: [mixin],
  components: {
    AlbumContent
  },
  data () {
    return {
      file: '',
      songDuration: '', // 上传歌曲时长
      avator: '',
      username: '',
      userSex: '',
      birth: '',
      centerDialogVisible: false,
      location: location,
      locationIndex: '',
      introduction: '',
      activeName: '我的收藏',
      menu: [{type: '我的收藏'}, {type: '我的作品'}],
      collection: [], // 存放收藏的歌曲ID
      collectList: [], // 收藏的歌曲
      mySongList: [], // 存储我的作品
      registerForm: { // 添加框
        songName: '',
        introduction: '',
        lyric: ''
      },
      getUserOfIdUrl: 'user/selectByPrimaryKey',
      getSongByIdUrl: 'song/detail',
      getMySongUrl: 'song/user/detail',
      getCollectionByUserUrl: 'collect/collectOfUserId',
      addMySongUrl: 'song/add'
    }
  },
  computed: {
    ...mapGetters([
      'userId',
      'id',
      'listOfSongs' // 存放的音乐
    ])
  },
  mounted () {
    this.getCollection(this.userId)
  },
  created () {
    this.getMsg(this.userId)
  },
  methods: {
    addSong () {
      // var params = {
      //   file: this.file,
      //   userId: this.userId,
      //   songName: this.registerForm.songName,
      //   introduction: this.registerForm.introduction,
      //   lyric: this.registerForm.lyric,
      //   duration: this.songDuration
      // }
      let _this = this
      var form = new FormData(document.getElementById('tf'))
      var objfile = document.getElementById('songFile')
      var content = objfile.files[0]
      this.getTimes(content, (duration) => {
        form.append('duration', duration)
        form.append('userId', this.userId)
        form.append('songName', this.registerForm.songName)
        if (!form.get('lyric')) {
          form.set('lyric', '[00:00:00]暂无歌词')
        }
        var req = new XMLHttpRequest()
        req.onreadystatechange = function () {
        // req.readyState === 4 获取到返回完整数据
        // req.status === 200 和后台正常交互完成
          if (req.readyState === 4 && req.status === 200) {
            let res = JSON.parse(req.response)
            if (res.code) {
              _this.getMySong()
              _this.registerForm = {}
              _this.notify(res.msg, 'success')
            } else {
              _this.notify('上传失败', 'error')
            }
          }
        }
        req.open('post', `${_this.$store.state.configure.HOST}/song/add`, false)
        req.send(form)
        _this.centerDialogVisible = false
      }) // 获取歌曲时长
    },
    getMsg (id) {
      this.getData({userId: id}, this.getUserOfIdUrl)
        .then(res => {
          this.username = res.data.username
          if (res.data.sex === 0) {
            this.userSex = '女'
          } else if (res.data.sex === 1) {
            this.userSex = '男'
          }
          this.birth = this.attachBirth(res.data.birth)
          this.introduction = res.data.introduction
          var location = res.data.location
          this.locationIndex = this.attachLocation(location)
          this.avator = res.data.avator
        })
        .catch(err => {
          console.log(err)
        })
    },
    // 收藏的歌曲ID
    getCollection (userId) {
      this.getData({userId: userId}, this.getCollectionByUserUrl)
        .then(res => {
          this.collectList = []
          this.collection = res.data
          // 通过歌曲ID获取歌曲信息
          for (let item of this.collection) {
            this.getCollectSongs(item.songId)
          }
          this.$store.commit('setListOfSongs', this.collectList)
        })
        .catch(err => {
          console.log(err)
        })
    },
    // 删除歌曲后获得收藏的歌曲ID
    getCollection2 (userId) {
      this.getData({userId: userId}, this.getCollectionByUserUrl)
        .then(res => {
          this.collectList = []
          this.collection = res.data
          // 通过歌曲ID获取歌曲信息
          for (let item of this.collection) {
            this.getCollectSongs(item.songId)
          }
          // 删除正在播放的收藏单的歌曲后不能刷新播放列表，否则会报错
          // this.$store.commit('setListOfSongs', this.collectList)
        })
        .catch(err => {
          console.log(err)
        })
    },
    // 获取收藏的歌曲
    getCollectSongs (id) {
      this.getData({songId: id}, this.getSongByIdUrl)
        .then(res => {
          if (res.data.length !== 0) {
            this.collectList.push(res.data)
          }
        })
        .catch(err => {
          console.log('err_getSongList', err)
        })
    },
    // 转换成地区名
    attachLocation (location) {
      let arr = location.split(',')
      let province = this.location[arr[0]].label
      let city = this.location[arr[0]].children[arr[1]].label
      let township = this.location[arr[0]].children[arr[1]].children[arr[2]].label
      location = province + '/' + city + '/' + township
      return location
    },
    // 获取我的作品
    getMySong () {
      var params = {
        userId: this.userId
      }
      this.getData(params, this.getMySongUrl)
        .then((res) => {
          this.mySongList = res.data
        }).catch(err => {
          console.log('getMySong_err=>', err)
        })
    },
    // 切换我的作品或我的收藏
    handleChangeView: function (typeName) {
      this.activeName = typeName
      if (typeName === '我的作品') {
        this.getMySong()
      } else {
        this.getCollection(this.userId)
      }
    },
    getTimes (file, callback) {
      var content = file
      var duration = ''
      // 获取录音时长
      var url = URL.createObjectURL(content)
      // 经测试，发现audio也可获取视频的时长
      var audioElement = new Audio(url)
      audioElement.addEventListener('loadedmetadata', (_event) => {
        duration = parseInt(audioElement.duration)
        callback(duration)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>
