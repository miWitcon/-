<template>
  <div class="table">
    <div class="container">
      <div class="handle-box">
        <el-form ref="formData" :inline="true">
          <el-row>
            <el-col>
              <el-form-item>
                <el-input
                  size="mini"
                  v-model="formData.songName"
                  placeholder="请输入作品名"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-input
                  size="mini"
                  v-model="formData.username"
                  placeholder="请输入发布者名"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-button
                  size="mini"
                  type="primary"
                  icon="el-icon-search"
                  @click="getSongData"
                >
                  搜索
                </el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <el-button type="primary" size="mini" class="handle-del mr10" @click="delAllSong" icon="el-icon-delete">批量删除</el-button>
        <el-button type="primary" size="mini" @click="centerDialogVisible = true" icon="el-icon-circle-plus-outline">添加歌曲</el-button>
      </div>
      <el-table :data="songList" size="mini" border style="width: 100%" height="550px" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="歌曲图片" width="110" align="center">
          <template slot-scope="scope">
            <div style="width: 80px; height: 80px; overflow: hidden">
              <img :src="getUrl(scope.row.pic)" alt="" style="width: 100%;"/>
            </div>
            <div class="play" @click="setSongUrl(scope.row.url, scope.row.songId)">
              <div v-if="toggle !== scope.row.songId">
                <svg class="icon" aria-hidden="true">
                  <use :xlink:href="BOFANG"></use>
                </svg>
              </div>
              <div v-if="toggle === scope.row.songId">
                <svg class="icon" aria-hidden="true">
                  <use :xlink:href="playIcon"></use>
                </svg>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="作品名" prop="songName" width="150" align="center"></el-table-column>
        <el-table-column label="发布者" prop="username" width="150" align="center"></el-table-column>
        <el-table-column label="想法" prop="introduction" width="150" align="center"></el-table-column>
        <el-table-column label="歌词" align="center">
          <template slot-scope="scope">
            <ul style="height: 100px; overflow: scroll">
              <li>
              <li v-for="(item, index) in parseLyric(scope.row.lyric)" :key="index">
                {{ item }}
              </li>
            </ul>
          </template>
        </el-table-column>
        <el-table-column label="资源更新" width="100" align="center">
          <template slot-scope="scope">
            <el-upload
              class="upload-demo"
              :action="uploadUrl(scope.row.songId)"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
              >
                <el-button size="mini">更新图片</el-button>
            </el-upload>
            <br>
            <el-upload
              class="upload-demo change"
              :action="uploadSongUrl(scope.row.songId, songDuration)"
              :show-file-list="false"
              :on-success="handleSongSuccess"
              :before-upload="beforeSongUpload">
              <el-button size="mini">更新歌曲</el-button>
            </el-upload>
          </template>
        </el-table-column>
        <el-table-column label="评论" width="80" align="center">
            <template  slot-scope="scope">
                <el-button size="mini" @click="getComment(songList[scope.$index].songId)">评论</el-button>
            </template>
        </el-table-column>
        <el-table-column label="操作" width="150" align="center">
            <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.row.songId)">删除</el-button>
            </template>
        </el-table-column>
      </el-table>
      <div class="pagination">
        <el-pagination
          background
          :total="tableData.length"
          :current-page="currentPage"
          :page-size="pageSize"
          :page-sizes="[5, 10, 15, 20]"
          layout="total, sizes, prev, pager, next, jumper"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
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
          <br>
          <input type="file" name="file" id="songFile">
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="addSong">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="400px">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="发布者" size="mini">
          <el-input v-model="form.username" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="歌名" size="mini">
          <el-input v-model="form.songName"></el-input>
        </el-form-item>
        <el-form-item label="想法" prop="introduction" size="mini">
          <el-input v-model="form.introduction" placeholder="想法"></el-input>
        </el-form-item>
        <el-form-item label="歌词" size="mini">
          <el-input  type="textarea" v-model="form.lyric"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="editVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="saveEdit">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 删除提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">删除不可恢复，是否确定删除？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteRow(idx)">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import SongAudio from '../components/SongAudio'
import { mixin } from '../mixins/index'
import { mapGetters } from 'vuex'
import { ICON } from '../assets/icon/index'

export default {
  name: 'song-page',
  components: {
    SongAudio
  },
  mixins: [mixin],
  data () {
    return {
      toggle: false, // 控制播放图标状态
      playSongId: '', // 记录当前播放的歌曲id
      username: '',
      registerForm: {// 添加框
        songName: '',
        introduction: '',
        lyric: ''
      },
      formData: {
        songName: '',
        username: ''
      },
      tableData: [],
      tempDate: [],
      is_search: false,
      multipleSelection: [], // 记录要删除的歌曲
      centerDialogVisible: false, // 添加弹窗是否显示
      editVisible: false, // 编辑弹窗是否显示
      delVisible: false, // 删除弹窗是否显示
      songDuration: '',
      form: {// 编辑框
        id: '',
        username: '',
        songName: '',
        introduction: '',
        createTime: '',
        updateTime: '',
        pic: '',
        lyric: '',
        url: ''
      },
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1,
      BOFANG: ICON.BOFANG,
      ZANTING: ICON.ZANTING,
      getAllSongUrl: 'song/allSong',
      updateSongMsgUrl: 'song/update',
      deleteSongUrl: 'song/delete'
    }
  },
  computed: {
    ...mapGetters([
      'isPlay', // 播放状态
      'userId' // 管理员id
    ]),
    // 计算当前表格中的数据
    songList () {
      return this.tableData.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    },
    playIcon () {
      if (this.isPlay) {
        return this.ZANTING
      } else {
        return this.BOFANG
      }
    }
  },
  watch: {},
  created () {
    this.getSongData()
  },
  destroyed () {
    this.$store.commit('setIsPlay', false)
  },
  methods: {
    // 分页导航改变页码大小
    handleSizeChange (size) {
      this.pageSize = size
      this.current = 1
      this.getSongData()
    },
    // 获取歌曲
    getSongData () {
      this.tableData = []
      this.tempDate = []
      var params = {
        songName: this.formData.songName,
        username: this.formData.username
      }
      this.getData(params, this.getAllSongUrl)
        .then((res) => {
          this.tableData = res.data.datas
          this.tempDate = res.data.datas
          this.currentPage = 1
        }).catch(err => {
          console.log(err)
        })
    },
    // 切换播放歌曲
    setSongUrl (url, songId) {
      this.$store.commit('setUrl', this.$store.state.HOST + url)
      this.toggle = songId
      if (this.playSongId === songId) {
        if (this.isPlay) {
          this.$store.commit('setIsPlay', false)
        } else {
          this.$store.commit('setIsPlay', true)
        }
      } else {
        this.$store.commit('setIsPlay', true)
        this.playSongId = songId
      }
    },
    // 更新歌曲图片
    uploadUrl (songId) {
      return `${this.$store.state.HOST}/song/updateSongPic?songId=${songId}`
    },
    // 更新图片
    handleAvatarSuccess (res, file) {
      let _this = this
      if (res.code === 1) {
        _this.imageUrl = URL.createObjectURL(file.raw)
        _this.getSongData()
        _this.$notify({
          title: '上传成功',
          type: 'success'
        })
      } else {
        _this.$notify({
          title: '上传失败',
          type: 'error'
        })
      }
    },
    // 更新歌曲url
    uploadSongUrl (songId, duration) {
      return `${this.$store.state.HOST}/song/updateSongUrl?songId=${songId}&duration=${duration}`
    },
    beforeSongUpload (file) {
      this.getTimes(file, (duration) => {
        this.songDuration = duration
      })
      var testmsg = file.name.substring(file.name.lastIndexOf('.') + 1)
      const extension = testmsg === 'mp3' || 'flac'
      if (!extension) {
        this.$message({
          message: '上传文件只能是mp3格式！',
          type: 'error'
        })
      }
      return extension
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
    },
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    handleSongSuccess (res, file) {
      if (res.code === 1) {
        this.getSongData()
        this.notify('上传成功', 'success')
      } else {
        this.notify('上传失败', 'error')
      }
    },
    // 添加音乐
    addSong () {
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
              _this.getSongData()
              _this.registerForm = {}
              _this.notify(res.msg, 'success')
            } else {
              _this.notify('上传失败', 'error')
            }
          }
        }
        req.open('post', `${_this.$store.state.HOST}/song/add`, false)
        req.send(form)
        _this.centerDialogVisible = false
      }) // 获取歌曲时长
    },
    // 编辑
    handleEdit (row) {
      this.idx = row.songId
      this.form = {
        songId: row.songId,
        username: row.username,
        songName: row.songName,
        introduction: row.introduction,
        createTime: row.createTime,
        updateTime: row.updateTime,
        pic: row.pic,
        lyric: row.lyric,
        url: row.url
      }
      this.editVisible = true
    },
    getComment (id) {
      this.$router.push({path: '/Comment', query: {id: id, type: 0}})
    },
    // 保存编辑
    saveEdit () {
      let params = new URLSearchParams()
      params.append('songId', this.form.songId)
      params.append('songName', this.form.songName)
      params.append('introduction', this.form.introduction)
      params.append('lyric', this.form.lyric)
      this.postData(params, this.updateSongMsgUrl)
        .then(res => {
          if (res) {
            this.getSongData()
            this.notify('编辑成功', 'success')
          } else {
            this.notify('编辑失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.editVisible = false
    },
    // 确定删除
    deleteRow (ids) {
      this.getData({songId: ids}, this.deleteSongUrl)
        .then(response => {
          if (response) {
            this.getSongData()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
        })
      this.delVisible = false
    },
    // 解析歌词
    parseLyric (text) {
      let lines = text.split('\n')
      let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g
      let result = []
      // 对于歌词格式不对的特殊处理
      if (!(/\[.+\]/.test(text))) {
        return [text]
      }
      for (let item of lines) {
        if (pattern.test(item)) {
          let value = item.replace(pattern, '') // 存歌词
          result.push(value)
        }
      }
      return result
    }
  }
}

</script>

<style scoped>
.handle-box {
    margin-bottom: 20px;
}
.handle-input {
    width: 300px;
    display: inline-block;
}
.el-input__inner{
  background-color: aqua
}
.play {
    position: absolute;
    z-index: 100;
    width: 80px;
    height: 80px;
    top: 18px;
    left: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
}
.icon {
  width: 2em;
  height: 2em;
  color: white;
  fill: currentColor;
  overflow: hidden;
}
.pagination {
    display: flex;
    justify-content: center;
}
</style>
