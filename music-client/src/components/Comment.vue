<template>
  <div>
    <div class="comment">
      <h2>
        <span>评论</span>
        <span class="part__tit_desc">共 {{commentList.length}} 条评论</span>
      </h2>
      <div class="comment-msg">
        <el-input
          class="comment-input"
          type="textarea"
          placeholder="期待您的精彩评论..."
          :rows="2"
          v-model="textarea">
        </el-input>
      </div>
      <el-button type="primary" class="sub-btn" @click="postComment()">发表评论</el-button>
    </div>
    <ul class="popular" v-for="(item, index) in commentList" :key="index">
      <li>
        <div class="popular-img">
          <img :src="attachImageUrl(item.avator)" alt="">
        </div>
        <div class="popular-msg">
          <ul>
            <li class="name">{{ item.username }}</li>
            <li class="content">{{ item.content }}</li>
            <li class="time">{{ item.createTime }}</li>
          </ul>
        </div>
        <div class="up_del">
          <span v-show="userId === item.userId && loginIn" class="del_comment" @click="handleDelete(item.commentId)">删除 | </span>
          <span @click="postUp(item.commentId, item.up, index)" class="up" ref="up">
            <svg :class="{like:item.zan&&loginIn}" class="icon" aria-hidden="true">
              <use xlink:href="#myicon-dianzan-tianchong"></use>
            </svg>
            {{item.up}}
          </span>
        </div>
      </li>
    </ul>
    <!-- 删除提示框 -->
    <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">确定删除评论？</div>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="delVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="delComment(delCommentId)">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import mixin from '../mixins'
import { mapGetters } from 'vuex'

export default {
  name: 'comment',
  mixins: [mixin],
  props: {
    playId: Number, // 歌曲ID或歌单ID
    type: Number // 歌单（1）/歌曲（0）
  },
  data () {
    return {
      delCommentId: '',
      delVisible: false,
      commentList: [], // 存放评论内容
      userPic: [], // 保存评论用户头像
      zanListId: [], // 点了赞的commentId
      textarea: '', // 存放输入内容
      getCommentUrl: 'comment/commentOfSongId',
      getUserInfoUrl: 'user/selectByPrimaryKey',
      postCommentUrl: 'comment/add',
      allLikeCommentUrl: 'likeComment/allLikeComment', // 获取该用户点过赞的评论id
      likeUpUrl: 'likeComment/likeUp', // 点赞
      delCommentUrl: 'comment/delete'
    }
  },
  computed: {
    ...mapGetters([
      'id',
      'userId', // 用户ID
      'index', // 列表中的序号
      'loginIn', // 用户是否登录
      'avator' // 用户头像
    ])
  },
  watch: {
    id () {
      this.getComment()
    }
  },
  mounted () {
    if (this.id !== null) {
      this.getComment()
    }
  },
  methods: {
    // 获取所有评论
    getComment () {
      this.getData({ songId: this.id }, this.getCommentUrl)
        .then(res => {
          var list = res.data
          if (this.loginIn) {
            this.getData({userId: this.userId}, this.allLikeCommentUrl)
              .then(res => {
                for (let item of res.data) {
                  this.zanListId.push(item.commentId)
                }
                for (let item of list) {
                  if (this.zanListId.indexOf(item.commentId) === -1) {
                    // 表示未点过赞
                    item.zan = false
                  } else {
                    // 表示已点过赞
                    item.zan = true
                  }
                }
                this.commentList = list
              })
              .catch(err => {
                console.log('getAllLikeComment_err', err)
              })
          } else {
            this.commentList = list
          }
        })
        .catch(err => {
          this.notify('评论加载失败', 'error')
          console.log(err)
        })
    },
    // 提交评论
    postComment () {
      if (this.loginIn) {
        let params = {
          userId: this.userId,
          type: 0,
          songId: this.playId,
          content: this.textarea
        }
        this.postData(params, this.postCommentUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.textarea = ''
              this.getComment()
              this.notify('评论成功', 'success')
            } else {
              this.notify('评论失败', 'error')
            }
          })
          .catch(err => {
            console.log(err)
          })
      } else {
        this.notify('登录之后才能发布评论哦，亲！', 'warning')
      }
    },
    handleDelete (commentId) {
      this.delCommentId = commentId
      this.delVisible = true
    },
    delComment (commentId) {
      this.getData({commentId: commentId}, this.delCommentUrl)
        .then(res => {
          if (res.data === true) {
            this.getComment()
            this.notify('删除成功', 'success')
          } else {
            this.notify('删除失败', 'error')
          }
        })
        .catch(err => {
          console.log('delComment_err=>', err)
        })
      this.delVisible = false
    },
    // 点赞
    postUp (commentId, up, index) {
      if (this.loginIn) {
        var params = {
          userId: this.userId,
          commentId: commentId,
          up: up
        }
        this.postData(params, this.likeUpUrl)
          .then(res => {
            if (res.data.code === 1) {
              if (this.commentList[index].zan === true) {
                this.commentList[index].up -= 1
              } else {
                this.commentList[index].up += 1
              }
              this.commentList[index].zan = !this.commentList[index].zan
            } else {
              this.notify('点赞失败', 'error')
            }
          })
          .catch(err => {
            console.log('postUp_err', err)
          })
      } else {
        this.notify('请先登录', 'warning')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/css/comment.scss';
</style>
