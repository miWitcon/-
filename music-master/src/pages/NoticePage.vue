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
                  v-model="formData.title"
                  placeholder="请输入标题"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-button
                  size="mini"
                  type="primary"
                  icon="el-icon-search"
                  @click="getNoticeData"
                >
                  搜索
                </el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <el-button type="primary" size="mini" class="handle-del mr10" @click="delAllNotice" icon="el-icon-delete">批量删除</el-button>
        <el-button type="primary" size="mini" @click="centerDialogVisible = true" icon="el-icon-circle-plus-outline">添加公告</el-button>
      </div>
      <el-table :data="noticeList" size="mini" border style="width: 100%" height="550px" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="主题" prop="title" width="150" align="center"></el-table-column>
        <el-table-column label="内容" align="center">
          <template slot-scope="scope">
            <p style="height: 100px; overflow: scroll">{{ scope.row.content }}</p>
          </template>
        </el-table-column>
        <el-table-column label="起始日期" width="86" align="center">
          <template slot-scope="scope">
            <div>{{scope.row.updateTime}}</div>
          </template>
        </el-table-column>
        <el-table-column label="终止日期" width="86" align="center">
          <template slot-scope="scope">
            <div>{{scope.row.endTime}}</div>
          </template>
        </el-table-column>
        <!-- <el-table-column label="状态" prop="ifExpired" width="150" align="center"></el-table-column> -->
        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <!-- <el-button
              size="mini"
              @click="handleEdit(scope.row)">编辑
            </el-button> -->
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.noticeId)">删除
            </el-button>
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

    <!--添加公告-->
    <el-dialog title="添加公告" :visible.sync="centerDialogVisible" width="400px" center>
      <el-form action="" :model="registerForm" ref="registerForm" :rules="rules">
        <el-form-item label="时间" size="mini" prop="date">
          <el-date-picker
            v-model="registerForm.date"
            style="background-color: #FFF;width: 100%"
            type="datetimerange"
            value-format="yyyy-MM-dd HH:mm:ss"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="主题" size="mini" prop="title">
          <el-input type="text" name="title" v-model="registerForm.title" placeholder="请输入主题" width="100%"></el-input>
        </el-form-item>
        <el-form-item label="内容" size="mini" prop="content">
          <el-input type="textarea"  name="content" v-model="registerForm.content" placeholder="请输入内容"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="addNotice">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="400px">
      <el-form ref="form" :model="form">
        <el-form-item label="时间" size="mini" prop="date">
          <el-date-picker
            v-model="form.date"
            style="background-color: #FFF;width: 100%"
            type="datetimerange"
            value-format="yyyy-MM-dd HH:mm:ss"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="主题" size="mini" prop="title">
          <el-input type="text" name="title" v-model="form.title" placeholder="请输入主题" width="100%"></el-input>
        </el-form-item>
        <el-form-item label="内容" size="mini" prop="content">
          <el-input type="textarea"  name="content" v-model="form.content" placeholder="请输入内容"></el-input>
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

export default {
  name: 'notice-page',
  components: {
    SongAudio
  },
  mixins: [mixin],
  data () {
    return {
      toggle: false, // 控制播放图标状态
      playSongId: '', // 记录当前播放的歌曲id
      username: '',
      allUserId: '', // 所有用户id字符串
      formData: {
        title: ''
      },
      registerForm: {// 添加框
        title: '',
        content: '',
        date: []
      },
      form: {// 修改框
        title: '',
        content: '',
        date: []
      },
      rules: {
        date: [
          { required: true, message: '请选择日期时间', trigger: 'change' }
        ],
        title: [
          { required: true, message: '请输公告主题', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '请输公告内容', trigger: 'blur' }
        ]
      },
      tableData: [],
      tempDate: [],
      is_search: false,
      multipleSelection: [], // 记录要删除的歌曲
      centerDialogVisible: false, // 添加弹窗是否显示
      editVisible: false, // 编辑弹窗是否显示
      delVisible: false, // 删除弹窗是否显示
      select_word: '',
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1,
      getAllNoticeUrl: 'notice/allNotice',
      addNoticeUrl: 'notice/add',
      deleteNoticeUrl: 'notice/delete',
      updateNoticeUrl: 'notice/update',
      addUserNoticeUrl: 'userNotice/add',
      getAllUserUrl: 'user/allUser'
    }
  },
  computed: {
    ...mapGetters([
      'userId' // 管理员id
    ]),
    // 计算当前表格中的数据
    noticeList () {
      return this.tableData.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  watch: {},
  created () {
    this.getNoticeData()
    this.getAllUserData()
  },
  destroyed () {},
  methods: {
    // 分页导航改变页码大小
    handleSizeChange (size) {
      this.pageSize = size
      this.current = 1
      this.getNoticeData()
    },
    getAllUserData () {
      var param = {
        username: '',
        phoneNum: '',
        email: ''
      }
      this.getData(param, this.getAllUserUrl)
        .then(res => {
          if (res.status === 200) {
            var ids = ''
            for (let item of res.data) {
              ids += item.userId + ','
            }
            this.allUserId = ids
            console.log('allUserId=>', this.allUserId)
          } else {
            console('获取数据失败')
          }
        })
        .catch(err => {
          console.log('getUserData_error', err)
        })
    },
    // 获取公告信息
    getNoticeData () {
      this.tableData = []
      this.tempDate = []
      this.getData({title: this.formData.title}, this.getAllNoticeUrl)
        .then((res) => {
          this.tableData = res.data
          this.tempDate = res.data
          this.currentPage = 1
        }).catch(err => {
          console.log(err)
        })
    },
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    // 添加公告
    addNotice () {
      this.$refs['registerForm'].validate(valid => {
        var updateTime = ''
        var endTime = ''
        if (this.registerForm.date !== '') {
          let d = this.registerForm.date
          updateTime = d[0]
          endTime = d[1]
        }
        let params = new URLSearchParams()
        params.append('userId', this.userId)
        params.append('title', this.registerForm.title)
        params.append('content', this.registerForm.content)
        params.append('updateTime', updateTime)
        params.append('endTime', endTime)
        this.postData(params, this.addNoticeUrl)
          .then(res => {
            if (res.data.code === 1) {
              // this.notify('发布公告成功', 'success')
              this.getNoticeData()
              this.addUserNotice()
            } else {
              this.notify('发布公告失败', 'error')
            }
          })
        this.centerDialogVisible = false
      })
    },
    addUserNotice () {
      let params = new URLSearchParams()
      params.append('userId', this.allUserId)
      this.postData(params, this.addUserNoticeUrl)
        .then(res => {
          if (res.data.code === 1) {
            this.notify('发布公告成功', 'success')
          } else {
            this.notify('发布公告失败', 'error')
          }
        })
        .catch(err => {
          console.log('addUserNotice_err=>', err)
        })
    },
    // 编辑
    handleEdit (row) {
      this.idx = row.noticeId
      var date = []
      date[0] = row.updateTime
      date[1] = row.endTime
      this.form = {
        title: row.title,
        content: row.content,
        date: date
      }
      this.editVisible = true
    },
    // 保存编辑
    saveEdit () {
      this.$refs['form'].validate(valid => {
        var updateTime = ''
        var endTime = ''
        if (this.form.date !== '') {
          let d = this.form.date
          updateTime = d[0]
          endTime = d[1]
        }
        let params = new URLSearchParams()
        params.append('noticeId', this.idx)
        params.append('userId', this.userId)
        params.append('title', this.form.title)
        params.append('content', this.form.content)
        params.append('updateTime', updateTime)
        params.append('endTime', endTime)
        this.postData(params, this.updateNoticeUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.notify('修改成功', 'success')
              this.getNoticeData()
            } else {
              this.notify('修改失败', 'error')
            }
          })
        this.editVisible = false
      })
    },
    // 确定删除
    deleteRow (ids) {
      this.getData({noticeId: ids}, this.deleteNoticeUrl)
        .then(res => {
          if (res.data) {
            this.getNoticeData()
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
    getCurrentTime () {
      // 获取当前时间并打印
      var currentTime = ''
      let yy = new Date().getFullYear()
      let mm = new Date().getMonth() + 1
      let dd = new Date().getDate()
      let hh = new Date().getHours()
      let mf = new Date().getMinutes() < 10 ? '0' + new Date().getMinutes() : new Date().getMinutes()
      let ss = new Date().getSeconds() < 10 ? '0' + new Date().getSeconds() : new Date().getSeconds()
      currentTime = yy + '/' + mm + '/' + dd + ' ' + hh + ':' + mf + ':' + ss
      return currentTime
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
