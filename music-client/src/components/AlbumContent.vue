<template>
  <div class="content">
    <h1 class="title">
      <slot name="title"></slot>
    </h1>
    <h2 class="addSongBtn">
      <slot name="addSong"></slot>
    </h2>
    <hr>
    <ul>
      <li class="list-title">
        <div class="song-item">
          <span class="item-index"></span>
          <span class="item-pic" v-if="type === 'myMusic'">歌曲封面</span>
          <span class="item-title">歌曲名</span>
          <span class="item-name" v-if="type !== 'myMusic'">发布者</span>
          <span class="item-time">时长</span>
          <span class="item-intro">想法</span>
          <span class="item-operation" v-if="type === 'myMusic' || type === 'myCollect'">操作</span>
        </div>
      </li>
      <div v-show="songList.length === 0" class="no-lyric">
        <span v-if="type === 'myMusic'">暂无发布作品</span>
        <span v-if="type === 'myCollect'">暂无收藏</span>
        <span v-if="type === 'songListAlbum'">该歌单暂无添加歌曲</span>
      </div>
      <li class="list-content" v-for="(item, index) in songList" :key="index">
        <div class="song-item" :class="{'is-play': id === item.songId && isPlay === true}">
          <span class="item-index">
            <span v-if="id !== item.songId || isPlay === false">{{index + 1}}</span>
            <svg v-if="id === item.songId && isPlay === true" class="icon" aria-hidden="true">
              <use :xlink:href="YINLIANG"></use>
            </svg>
          </span>
          <span class="item-pic" v-if="type === 'myMusic'">
            <div class="item-img" v-if="item.pic !=='' && item.pic !==null">
              <img :src="attachImageUrl(item.pic)" alt=""/>
            </div>
          </span>
          <span class="item-title" v-if="type !== 'myMusic'"  @click="toplay(item.songId, item.url, item.pic, index,
            item.songName, item.username, item.lyric)">
            {{ item.songName }}
          </span>
          <span class="item-title" v-if="type === 'myMusic'" @click="toplay(item.songId, item.url, item.pic, index,
            item.songName, username, item.lyric)">
            {{ item.songName }}
          </span>
          <span class="item-name" v-if="type !== 'myMusic'">{{ item.username }}</span>
          <!-- <span class="item-name" v-if="type === 'myMusic'">{{ username }}</span> -->
          <span class="item-time">{{ formatSeconds(item.duration) }}</span>
          <span class="item-intro">{{ item.introduction }}</span>
          <span class="item-operation" v-if="type === 'myCollect' || type === 'myCollect'">
            <el-button type="danger" icon="el-icon-delete" circle @click="handleDelete(item.songId)"></el-button>
          </span>
          <span class="item-operation" v-if="type === 'myMusic'">
            <span class="edit" @click="handleEditMySong(item)">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#myicon-xiugai-copy"></use>
              </svg>
            </span>
            <span class="delSong" @click="handleDelMySong(item.songId)">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#myicon-shanchu"></use>
              </svg>
            </span>
          </span>
        </div>
      </li>
    </ul>
    <!-- 取消收藏提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">是否要取消收藏该歌曲？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteRow">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 删除作品提示框 -->
    <el-dialog title="提示" :visible.sync="delSongVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">是删除该作品？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delSongVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteMySong">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 编辑作品框 -->
    <el-dialog title="编辑" :visible.sync="editSongVisible" width="40%" center>
      <div class="del-dialog-cnt" align="center">
        <img :src="attachImageUrl(songPic)" alt="" style="width: 180px;"/>
        <el-upload
          class="upload-demo"
          :action="uploadUrl(idx)"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
        >
          <el-button size="mini">更换封面</el-button>
        </el-upload>
      </div>
      <br><br>
      <el-form ref="form" :model="form">
        <el-form-item size="mini">
          <el-input v-model="form.songName"></el-input>
        </el-form-item>
        <el-form-item prop="introduction" size="mini">
          <el-input v-model="form.introduction" placeholder="想法"></el-input>
        </el-form-item>
        <el-form-item size="mini">
          <el-input  type="textarea" v-model="form.lyric"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="editSongVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="editMySong">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import mixin from '@/mixins'
import { mapGetters } from 'vuex'

export default {
  name: 'album-content',
  mixins: [mixin],
  props: {
    songList: Array,
    type: String
  },
  data () {
    return {
      active: '',
      songPic: '',
      form: {
        songId: '',
        songName: '',
        introduction: '',
        lyric: ''
      },
      delVisible: false, // 显示删除框
      delSongVisible: false, // 显示删除框
      editSongVisible: false,
      idx: -1, // 记录当前要删除的歌曲
      YINLIANG: '#myicon-shengyin_shiti',
      delCollByUserIdSongIdUrl: 'collect/deleteByUserIdSongId',
      isCollectUrl: 'collect/isCollect',
      updateSongMsgUrl: 'song/update',
      delSongById: 'song/delete'
    }
  },
  computed: {
    ...mapGetters([
      'id', // 音乐ID
      'isPlay', // 播放状态
      'userId',
      'username',
      'loginIn', // 是否已登录
      'listIndex', // 当前歌曲在歌曲列表的位置
      'listOfSongs' // 当前歌单列表
    ])
  },
  watch: {
  },
  created () {},
  methods: {
    // 获取要删除列表的id
    handleDelete (id) {
      this.idx = id
      this.delVisible = true
    },
    // 获取要删除列表的id
    handleDelMySong (id) {
      this.idx = id
      this.delSongVisible = true
    },
    // 获取要编辑的歌曲id
    handleEditMySong (item) {
      this.songPic = item.pic
      this.idx = item.songId
      this.form = {
        songId: item.songId,
        songName: item.songName,
        introduction: item.introduction,
        lyric: item.lyric
      }
      this.editSongVisible = true
    },
    // 保存编辑
    editMySong () {
      var params = {
        songId: this.form.songId,
        songName: this.form.songName,
        introduction: this.form.introduction,
        lyric: this.form.lyric
      }
      this.postData(params, this.updateSongMsgUrl)
        .then(res => {
          if (res) {
            this.$emit('getMySong', this.userId)
            this.notify('编辑成功', 'success')
          } else {
            this.notify('编辑失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.editSongVisible = false
    },
    // 删除收藏
    deleteRow () {
      var params = {
        userId: this.userId,
        songId: this.idx
      }
      this.getData(params, this.delCollByUserIdSongIdUrl)
        .then(res => {
          if (res.data === true) {
            // 调用父组件的getCollection方法
            this.$emit('getCollection', this.userId)
            // 如果取消收藏的为当前正在播放的歌曲
            if (this.id === this.idx) {
              this.$store.commit('setIsCollect', false)
            }
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log('deleteRow_err', err)
        })
      this.delVisible = false
    },
    deleteMySong () {
      this.getData({songId: this.idx}, this.delSongById)
        .then(res => {
          if (res.data === true) {
            this.notify('删除成功', 'success')
            this.$emit('getMySong', this.userId)
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log('deleteMySong_err=>', err)
        })
      this.delSongVisible = false
    },
    // 更新歌曲图片
    uploadUrl (songId) {
      return `${this.$store.state.configure.HOST}/song/updateSongPic?songId=${songId}`
    },
    // 更新图片
    handleAvatarSuccess (res, file) {
      let _this = this
      if (res.code === 1) {
        _this.imageUrl = URL.createObjectURL(file.raw)
        _this.songPic = res.pic
        _this.$emit('getMySong', this.userId)
        _this.$message({
          showClose: true,
          message: '更换成功！',
          type: 'success'
        })
      } else {
        _this.$message({
          showClose: true,
          message: '更换失败！',
          type: 'error'
        })
      }
    },
    beforeAvatarUpload (file) {
      const isJPG = (file.type === 'image/jpeg') || (file.type === 'image/png')
      const isLt2M = file.size / 1024 / 1024 < 2
      if (!isJPG) {
        this.$message.error('上传图片只能是 PNG和JPEG 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传图片大小不能超过 2MB!')
      }
      return isJPG && isLt2M
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/album-content.scss';
</style>
