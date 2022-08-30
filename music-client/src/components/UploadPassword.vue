<template>
  <div class="upload">
    <p class="title">修改密码</p>
    <hr/>
    <div class="section">
      <el-form :model="formData" class="demo-ruleForm" :rules="rules" label-width="80px">
        <el-form-item prop="oldPassword" label="旧密码">
          <el-input type="password" placeholder="请输入旧密码" v-model="formData.oldPassword"></el-input>
        </el-form-item>
        <el-form-item prop="newPassword" label="新密码">
          <el-input type="password" placeholder="请输入新密码" v-model="formData.newPassword"></el-input>
        </el-form-item>
        <el-form-item prop="againPassword" label="确认密码">
          <el-input type="password" placeholder="请再次输入新密码" v-model="formData.againPassword"></el-input>
        </el-form-item>
        <div class="save-btn">
          <el-button type="primary" @click="changPassword" style="width:50%;">保存</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import mixin from '../mixins'
import { mapGetters } from 'vuex'

export default {
  name: 'uploadPassword',
  mixins: [mixin],
  data () {
    // 重复密码验证
    const pwdAgainCheck = async (rule, value, callback) => {
      if (value.length < 1) {
        return callback(new Error('请再次输入新密码！'))
      } else if (this.formData.newPassword !== this.formData.againPassword) {
        return callback(new Error('两次输入密码不一致！'))
      }
    }
    return {
      formData: {
        oldPassword: '',
        newPassword: '',
        againPassword: ''
      },
      rules: {
        oldPassword: [
          { required: true, message: '请输入旧密码！', trigger: 'blur' }
        ],
        newPassword: [
          { required: true, message: '请输入新密码！', trigger: 'blur' }
        ],
        againPassword: [
          { required: true, validator: pwdAgainCheck, trigger: 'blur' }
        ]
      },
      password: '',
      getMsgUrl: 'user/selectByPrimaryKey',
      changPasswordUrl: 'user/updatePassword'
    }
  },
  computed: {
    ...mapGetters([
      'userId'
    ])
  },
  mounted () {
    this.getMsg()
  },
  methods: {
    getMsg () {
      this.getData({userId: this.userId}, this.getMsgUrl)
        .then(res => {
          this.password = res.data.password
        })
        .catch(err => {
          console.log('getMsg_err=>', err)
        })
    },
    changPassword () {
      if (this.password === this.formData.oldPassword) {
        var params = {
          userId: this.userId,
          password: this.formData.newPassword
        }
        this.postData(params, this.changPasswordUrl)
          .then(res => {
            if (res.data.code === 1) {
              this.$notify({
                title: '密码修改成功',
                type: 'success'
              })
            } else {
              this.$notify({
                title: this.data.msg,
                type: 'success'
              })
            }
          })
          .catch(err => {
            console.log('changPassword_err=>', err)
          })
      } else {
        this.$notify.error({
          title: '旧密码错误！',
          showClose: true
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/uploadPassword.scss';
</style>
