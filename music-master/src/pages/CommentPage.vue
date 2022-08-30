<template>
  <div class="table">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-tickets"></i> 评论信息
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button type="primary" size="mini" class="handle-del mr10" @click="delAllComment" icon="el-icon-delete">批量删除</el-button>
        <el-input v-model="select_word" size="mini" placeholder="用户名筛选" class="handle-input mr10"></el-input>
      </div>
      <el-table
        :data="data"
        size="mini"
        border
        style="width: 100%"
        ref="multipleTable"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column prop="username" label="用户"></el-table-column>
        <el-table-column prop="content" label="评论内容"></el-table-column>
        <el-table-column label="操作" width="150">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.row.commentId)">删除</el-button>
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

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="400px">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="评论内容" size="mini">
          <el-input v-model="form.content"></el-input>
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
import { mixin } from '../mixins'

export default {
  name: 'comment-page',
  mixins: [mixin],
  data () {
    return {
      tableData: [],
      tempDate: [],
      multipleSelection: [],
      editVisible: false,
      delVisible: false,
      select_word: '',
      form: {
        comment_id: '',
        userId: '',
        songId: '',
        songListId: '',
        content: '',
        type: '',
        up: ''
      },
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1,
      getCommentUrl: 'comment/commentOfSongId',
      delCommentUrl: 'comment/delete',
      updateCommentUrl: 'comment/update'
    }
  },
  computed: {
    // 计算当前表格中的数据
    data () {
      return this.tableData.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  watch: {
    select_word: function () {
      if (this.select_word === '') {
        this.tableData = this.tempDate
      } else {
        this.tableData = []
        for (let item of this.tempDate) {
          if (item.username.includes(this.select_word)) {
            this.tableData.push(item)
          }
        }
      }
    }
  },
  created () {
    this.getCommentById()
  },
  methods: {
    // 分页导航改变页码大小
    handleSizeChange (size) {
      this.pageSize = size
      this.current = 1
      this.getCommentById()
    },
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    // 获取评论
    getCommentById () {
      this.tableData = []
      this.tempDate = []
      let promise
      if (this.$route.query.type === '0') {
        promise = this.getData({songId: this.$route.query.id}, this.getCommentUrl)
      } else if (this.$route.query.type === '1') {
        promise = this.getData({songId: this.$route.query.id}, this.getCommentUrl)
      }
      promise.then(res => {
        this.tableData = res.data
        this.tempDate = res.data
      })
        .catch(err => {
          console.log('getCommentById_err=>', err)
        })
    },
    // 编辑
    handleEdit (row) {
      this.idx = row.id
      this.form = {
        commentId: row.commentId,
        userId: row.userId,
        songId: row.songId,
        songListId: row.songListId,
        content: row.content,
        type: row.type,
        up: row.up
      }
      this.editVisible = true
    },
    // 保存编辑
    saveEdit () {
      let params = new URLSearchParams()
      params.append('commentId', this.form.commentId)
      params.append('userId', this.form.userId)
      params.append('songId', this.form.songId)
      params.append('content', this.form.content)
      params.append('type', this.form.type)
      this.postData(params, this.updateCommentUrl)
        .then(res => {
          if (res.data.code === 1) {
            this.getCommentById()
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
      this.getData({commentId: ids}, this.delCommentUrl)
        .then(res => {
          if (res.data === true) {
            this.getCommentById()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log('deleteRow_err', err)
        })
      this.delVisible = false
    }
  }
}
</script>

<style scoped>
.pagination {
    display: flex;
    justify-content: center;
}

.handle-box {
  margin-bottom: 20px;
}

.handle-input {
  width: 300px;
  display: inline-block;
}
</style>
