<!--
 * @Author: your name
 * @Date: 2022-03-16 08:52:49
 * @LastEditTime: 2022-03-16 16:06:47
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \musicMaster\src\pages\AddSongToList.vue
-->
<template>
  <div>
    <el-form
      ref="formData"
      :inline="true"
    >
      <el-row>
        <el-col>
          <el-form-item>
            <el-input
              size="mini"
              v-model="formData.songName"
              placeholder="请输入歌名"
              clearable
            />
          </el-form-item>
          <el-form-item>
            <el-input
              size="mini"
              v-model="formData.userName"
              placeholder="请输入发布者"
              clearable
            />
          </el-form-item>
          <el-form-item>
            <el-button
              size="mini"
              type="primary"
              v-loading.body.lock="fullscreenLoading"
              @click="getOtherSongData"
            >
              搜索
            </el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <el-table
      :data="tableData"
      border
      size="mini"
      height="300"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <!-- <el-table-column type="selection" width="50"></el-table-column> -->
      <el-table-column prop="song.songName" label="歌曲名"></el-table-column>
      <el-table-column prop="song.username" label="发布者"></el-table-column>
      <el-table-column label="操作" width="65">
        <template slot-scope="scope">
          <el-tooltip class="item" effect="light" content="点击添加到歌单" placement="top">
            <el-button
            size="small"
            icon="el-icon-plus"
            round
            type="primary"
            @click="addSongToList(scope.row.songId)"
          />
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { mixin } from '../mixins'

export default {
  name: 'add-song-to-list',
  mixins: [mixin],
  props: {
    'songListId': String
  },
  data () {
    return {
      fullscreenLoading: false, // 查询Loading
      formData: {
        songName: '',
        userName: ''
      },
      tableData: [],
      getOtherSongUrl: 'listSong/otherSong',
      addSongToListUrl: 'listSong/add'
    }
  },
  watch: {
  },
  created () {
    this.getOtherSongData()
  },
  methods: {
    getOtherSongData () {
      var params = {
        songListId: this.songListId,
        username: this.formData.userName,
        songName: this.formData.songName
      }
      this.getData(params, this.getOtherSongUrl)
        .then(res => {
          this.tableData = res.data
        })
        .catch(err => {
          console.log('getOtherSongData_err', err)
        })
    },
    addSongToList (songId) {
      let params = new URLSearchParams()
      params.append('songId', songId)
      params.append('songListId', this.songListId)
      this.postData(params, this.addSongToListUrl)
        .then(res => {
          if (res.data.code === 1) {
            this.getOtherSongData()
            this.$emit('getListSongData')
            this.notify('添加成功', 'success')
          } else {
            this.notify('添加失败', 'error')
          }
        })
        .catch(err => {
          console.log('addSongToList_err', err)
        })
    }
  }
}
</script>

<style scoped>
</style>
