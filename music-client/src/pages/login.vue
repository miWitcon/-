<!--
 * @Author: your name
 * @Date: 2022-01-28 10:25:53
 * @LastEditTime: 2022-02-11 16:36:56
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\pages\login.vue
-->
<template>
  <div>
    <div class="login-logo">
      <img :src="picImg" />
    </div>
    <div class="login">
      <div class="login-head">
        <span>账号登录</span>
      </div>
      <el-form :model="registerForm" ref="registerForm" class="demo-ruleForm" :rules="rule">
        <el-form-item prop="username">
          <el-input v-model="registerForm.username" placeholder="用户名"/>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" v-model="registerForm.password" placeholder="密码" />
        </el-form-item>
        <el-form-item prop="code">
          <img :src="verificationCodeSrc" id="img-vcode" @click="getImage" :key="key">
          <el-input v-model="registerForm.code" placeholder="验证码"/>
        </el-form-item>
        <div class="login-btn">
          <el-button @click="goSignUp">注册</el-button>
          <el-button
            type="primary"
            @click="handleleLoginIn"
          >
            登录
          </el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import mixin from '../mixins'
import { mapGetters } from 'vuex'
export default {
  name: 'login',
  mixins: [mixin],
  data () {
    let validateName = (rule, value, callback) => {
      if (!value) {
        return callback(new Error('用户名不能为空'))
      } else {
        callback()
      }
    }
    let validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        callback()
      }
    }
    return {
      verificationCodeSrc: '', // 验证码
      key: '',
      picImg: require('@/assets/img/music.jpg'),
      registerForm: {
        username: '',
        password: '',
        code: ''
      }, // 用户对象
      rule: {
        username: [
          { validator: validateName, message: '请输入用户名', trigger: 'blur' }
        ],
        password: [
          { validator: validatePassword, message: '请输入密码', trigger: 'blur' }
        ],
        code: [
          { required: true, message: '请输入验证码', trigger: 'blur' }
        ]
      },
      loginUrl: 'user/login',
      isCollectUrl: 'collect/isCollect',
      getImageUrl: 'user/getImage'
    }
  },
  computed: {
    ...mapGetters([
      'id'
    ])
  },
  mounted () {
    this.changeIndex('登录')
  },
  created () {
    this.getImage()
  },
  methods: {
    // 获取验证码
    getImage () {
      this.getData({}, this.getImageUrl)
        .then(res => {
          this.verificationCodeSrc = 'data:image/png;base64,' + res.data.image
          this.key = res.data.key
        })
        .catch(err => {
          console.log('getImage_err=>', err)
        })
    },
    changeIndex (value) {
      this.$store.commit('setActiveName', value)
    },
    // 跳转到注册页面
    goSignUp () {
      this.$router.push({path: '/signup'})
    },
    handleleLoginIn () {
      let _this = this
      var params = {
        username: this.registerForm.username,
        password: this.registerForm.password,
        code: this.registerForm.code,
        key: this.key
      }
      this.postData(params, this.loginUrl)
        .then(res => {
          if (res.data.code === 1) {
            _this.$notify({
              title: '登录成功',
              type: 'success'
            })
            _this.$store.commit('setLoginIn', true)
            _this.$store.commit('setUserId', res.data.userMsg.userId)
            _this.$store.commit('setUsername', res.data.userMsg.username)
            _this.$store.commit('setAvator', res.data.userMsg.avator)
            _this.getUnReadMsgNum(res.data.userMsg.userId)
            if (this.id !== null && this.id !== '') {
              var params2 = {
                userId: res.data.userMsg.userId,
                songId: this.id
              }
              this.getData(params2, this.isCollectUrl)
                .then(res => {
                  if (res.data.code === 1) {
                    this.$store.commit('setIsCollect', true)
                  } else {
                    this.$store.commit('setIsCollect', false)
                  }
                })
                .catch(err => {
                  console.log('toPlay_err=>', err)
                })
            }
            setTimeout(function () {
              _this.changeIndex('首页')
              _this.$router.push({path: '/'})
              _this.$router.go(0)
            }, 2000)
          } else {
            _this.$notify({
              title: res.data.msg,
              type: 'error'
            })
          }
        })
        .catch(err => {
          console.log('loginIn err=>', err)
        })
    }
  }
}
</script>
<style lang="scss" scoped>
@import "../assets/css/login-in";
.register{
  float: right;
  color: blue;
}
</style>
