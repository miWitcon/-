export const mixin = {
  methods: {
    // 提示信息
    notify (title, type) {
      this.$notify({
        title: title,
        type: type
      })
    },
    // 根据相对地址获取绝对地址
    getUrl (url) {
      return `${this.$store.state.HOST}/${url}`
    },
    // 获取要删除列表的id
    handleDelete (id) {
      this.idx = id
      this.delVisible = true
    },
    // 获取批量要删除的列表
    handleSelectionChange (val) {
      this.multipleSelection = val
    },
    // 批量删除用户
    delAllUser () {
      var ids = ''
      for (let item of this.multipleSelection) {
        ids += item.userId + ','
      }
      this.deleteRow(ids)
      this.multipleSelection = []
    },
    // 批量删除歌曲
    delAllSong () {
      var ids = ''
      for (let item of this.multipleSelection) {
        ids += item.songId + ','
      }
      this.deleteRow(ids)
      this.multipleSelection = []
    },
    // 批量删除歌单
    delAllSongList () {
      var ids = ''
      for (let item of this.multipleSelection) {
        ids += item.id + ','
      }
      this.deleteRow(ids)
      this.multipleSelection = []
    },
    // 批量评论
    delAllComment () {
      var ids = ''
      for (let item of this.multipleSelection) {
        ids += item.commentId + ','
      }
      this.deleteRow(ids)
      this.multipleSelection = []
    },
    // 批量删除歌单里的歌曲
    delAllListSong () {
      var songIds = ''
      var songListIds = ''
      for (let item of this.multipleSelection) {
        songIds += item.songId + ','
        songListIds += this.$route.query.id + ','
      }
      this.deleteRow(songIds, songListIds)
      this.multipleSelection = []
    },
    // 批量删除公告
    delAllNotice () {
      var noticeIds = ''
      for (let item of this.multipleSelection) {
        noticeIds += item.noticeId + ','
      }
      this.deleteRow(noticeIds)
      this.multipleSelection = []
    },
    attachBirth (val) {
      let birth = String(val).match(/[0-9-]+(?=\s)/)
      return Array.isArray(birth) ? birth[0] : birth
    },
    changeSex (value) {
      if (value === 0) {
        return '女'
      } else if (value === 1) {
        return '男'
      }
    },
    changeIdentity (value) {
      if (value === 0) {
        return '普通用户'
      } else if (value === 1) {
        return '管理员'
      }
    },
    toggleSex (value) {
      if (value === '女') {
        return 0
      } else if (value === '男') {
        return 1
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
