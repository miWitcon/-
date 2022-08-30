<template>
  <div class="notice">
    <div class="content">
      <div class="notice_logo">
        <svg class="notice_icon" aria-hidden="true">
          <use xlink:href="#myicon-gonggaozhidu"/>
        </svg>
      </div>
      <el-button type="primary" plain size="mini" @click="turnAllToRead">
        一键已读
        <svg class="icon" aria-hidden="true" style="color:red;">
          <use xlink:href="#myicon-clean"></use>
        </svg>
      </el-button>
      <div v-show="noticeList.length === 0" class="no-notice">
        <span>暂无公告</span>
      </div>
      <ul class="popular" v-for="(item, index) in noticeList" :key="index">
        <li>
          <div class="popular-msg">
            <ul>
              <li class="name" title="查看详细" @click="detail(item.id, item.notice, index)">
                <span :class="{'tip': item.isread === 0 }"></span>{{ item.notice.title }}
              </li>
              <li class="content">{{ item.notice.content }}</li>
            </ul>
          </div>
          <div class="time">
            <span style="float:right;">
              {{item.notice.updateTime}}
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#myicon-shijian"></use>
              </svg>
            </span>
            <br/>
            <span class="delNotice" style="float:right;" @click="handleDelete(item.id)">
              删除
              <svg class="icon" aria-hidden="true" style="color:blue;">
                <use xlink:href="#myicon-icon"></use>
              </svg>
            </span>
          </div>
        </li>
      </ul>
      <!-- 公告详细 -->
      <el-dialog
        :title=noticeClicked.title
        :visible.sync="centerDialogVisible"
        width="30%"
        center>
        <span>{{ noticeClicked.content }}</span>
      </el-dialog>
      <!-- 删除提示框 -->
      <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
        <div class="del-dialog-cnt" align="center">删除不可恢复，是否确定删除？</div>
        <span slot="footer" class="dialog-footer">
          <el-button size="mini" @click="delVisible = false">取 消</el-button>
          <el-button size="mini" type="primary" @click="deleteRow(idx)">确 定</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import mixin from '../mixins'

export default {
  name: 'setting',
  mixins: [mixin],
  components: {},
  data () {
    return {
      idx: '',
      noticeClicked: '', // 被点击的公告信息
      centerDialogVisible: false,
      delVisible: false,
      noticeList: [],
      getAllNoticeUrl: 'userNotice/allNotice',
      turnToReadUrl: 'userNotice/turnRead',
      deleteNoticeUrl: 'userNotice/delete'
    }
  },
  computed: {
    ...mapGetters([
      'userId'
    ])
  },
  created () {
    this.getNoticeData()
    this.getUnReadMsgNum(this.userId)
  },
  methods: {
    // 获取公告信息
    getNoticeData () {
      this.getData({userId: this.userId}, this.getAllNoticeUrl)
        .then((res) => {
          this.noticeList = res.data
        }).catch(err => {
          console.log(err)
        })
    },
    detail (id, notice, index) {
      this.noticeClicked = notice
      this.centerDialogVisible = true
      this.getData({id: id}, this.turnToReadUrl)
        .then(res => {
          if (res.data === true) {
            this.getUnReadMsgNum(this.userId)
            this.noticeList[index].isread = 1
          }
        })
        .catch(err => {
          console.log('detail_err', err)
        })
    },
    turnAllToRead () {
      var num = 0
      for (let item of this.noticeList) {
        if (item.isread === 1) { num++ }
      }
      if (num === this.noticeList.length) {
        this.$message({
          showClose: true,
          offset: 200,
          message: '暂无未读公告！'
        })
        return
      }
      var ids = ''
      for (let item of this.noticeList) {
        ids += item.id + ','
      }
      this.getData({id: ids}, this.turnToReadUrl)
        .then(res => {
          if (res.data === true) {
            this.getUnReadMsgNum(this.userId)
            for (let item of this.noticeList) {
              item.isread = 1
            }
            this.$message({
              showClose: true,
              offset: 200,
              message: '所有消息已标为已读',
              type: 'success'
            })
          }
        })
        .catch(err => {
          console.log('detail_err', err)
        })
    },
    handleDelete (id) {
      this.idx = id
      this.delVisible = true
    },
    // 确定删除
    deleteRow (id) {
      this.getData({id: id}, this.deleteNoticeUrl)
        .then(res => {
          if (res.data) {
            this.getNoticeData()
            this.getUnReadMsgNum(this.userId)
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(failResponse => {})
      this.delVisible = false
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/notice.scss';
</style>
