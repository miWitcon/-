<template>
  <div class="table">
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item>
          <i class="el-icon-tickets"></i> 歌单-歌曲信息
        </el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <div class="handle-box">
        <el-button type="primary" size="mini" class="handle-del mr10" @click="delAllListSong" icon="el-icon-delete">批量删除</el-button>
        <el-input v-model="select_word" size="mini" placeholder="筛选关键词" class="handle-input mr10"></el-input>
        <el-button type="primary" size="mini" @click="centerDialogVisible = true" icon="el-icon-circle-plus-outline">添加歌曲</el-button>
      </div>
      <el-table
        :data="data"
        border
        size="mini"
        style="width: 100%"
        ref="multipleTable"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="50"></el-table-column>
        <el-table-column prop="song.songName" label="歌曲名"></el-table-column>
        <el-table-column prop="song.username" label="发布者"></el-table-column>
        <el-table-column label="操作" width="80">
          <template slot-scope="scope">
            <el-button size="small" type="danger" @click="handleDelete(scope.row.songId)">删除</el-button>
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
    <el-dialog title="添加歌曲" :visible.sync="centerDialogVisible" width="50%" center>
      <AddSongToList
        :songListId="this.$route.query.id"
        @getListSongData='getListSongData'
      />
    </el-dialog>

    <!-- 删除提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">删除不可恢复，是否确定删除？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="deleteRow(idx, songListId)">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mixin } from '../mixins'
import AddSongToList from '@/pages/AddSongToList'

export default {
  name: 'list-song-page',
  mixins: [mixin],
  components: {
    AddSongToList
  },
  data () {
    return {
      registerForm: {
        singerName: '',
        songName: ''
      },
      tableData: [],
      tempDate: [],
      songListId: this.$route.query.id,
      multipleSelection: [],
      centerDialogVisible: false,
      editVisible: false,
      delVisible: false,
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      select_word: '',
      idx: -1, // 当前选择项
      getListSongUrl: 'listSong/detail',
      delSongOnListUrl: 'listSong/delete'
    }
  },
  watch: {
    select_word: function () {
      if (this.select_word === '') {
        this.tableData = this.tempDate
      } else {
        this.tableData = []
        for (let item of this.tempDate) {
          if (item.song.songName.includes(this.select_word) || item.song.username.includes(this.select_word)) {
            this.tableData.push(item)
          }
        }
      }
    }
  },
  computed: {
    // 计算当前表格中的数据
    data () {
      return this.tableData.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  created () {
    this.getListSongData()
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
    // 获取歌单
    getListSongData () {
      this.tableData = []
      this.tempDate = []
      this.getData({songListId: this.$route.query.id}, this.getListSongUrl)
        .then(res => {
          this.tableData = res.data
          this.tempDate = res.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    // 确定删除
    deleteRow (songIds, songListIds) {
      var params = {
        songId: songIds,
        songListId: songListIds
      }
      this.getData(params, this.delSongOnListUrl)
        .then(res => {
          if (res) {
            this.getListSongData()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log(err)
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
