<!--
 * @Author: your name
 * @Date: 2022-01-28 10:25:53
 * @LastEditTime: 2022-02-11 17:43:16
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\pages\signup.vue
-->
<template>
  <div>
    <div class="login-logo">
      <img :src="picImg" />
    </div>
    <div class="signUp">
      <div class="signUp-head">
        <span>用户注册</span>
      </div>
      <el-form :model="registerForm" ref="registerForm" label-width="80px" :rules="rules">
        <el-form-item prop="username" label="用户名">
          <el-input size="mini" v-model="registerForm.username" placeholder="用户名"/>
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input size="mini" type="password" v-model="registerForm.password" placeholder="密码"/>
        </el-form-item>
        <el-form-item prop="confirmPassword" label="确认密码">
          <el-input size="mini" type="password" v-model="registerForm.confirmPassword" placeholder="确认密码"/>
        </el-form-item>
        <el-form-item prop="sex" label="性别">
          <el-radio-group v-model="registerForm.sex">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="phoneNum" label="手机号">
          <el-input size="mini" v-model="registerForm.phoneNum" placeholder="手机号"/>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input size="mini" v-model="registerForm.email" placeholder="邮箱"/>
        </el-form-item>
        <el-form-item prop="school" label="学校">
          <el-input size="mini" v-model="registerForm.school" placeholder="学校"/>
        </el-form-item>
        <div class="login-btn">
          <el-button @click="goBack(-1)">取消</el-button>
          <el-button type="primary" @click="signUp">注册</el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>
<script>
import { location } from '@/assets/data/location'

export default {
  name: 'signup',
  data () {
    // 验证手机号的规则;
    var checkMobile = (rule, value, cb) => {
      // 验证手机号的正则表达式
      const regMobile = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/
      if (regMobile.test(value)) {
        return cb()
      }
      cb(new Error('请输入合法的手机号'))
    }
    // 重复密码验证
    const pwdAgainCheck = async (rule, value, callback) => {
      if (value.length < 1) {
        return callback(new Error('重复密码不能为空！'))
      } else if (this.registerForm.password !== this.registerForm.confirmPassword) {
        return callback(new Error('两次输入密码不一致！'))
      }
    }
    return {
      picImg: require('@/assets/img/music.jpg'),
      registerForm: {
        username: '',
        password: '',
        confirmPassword: '',
        sex: '',
        phoneNum: '',
        email: '',
        school: ''
      }, // 用户对象
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, validator: pwdAgainCheck, trigger: 'blur' }
        ],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        phoneNum: [
          { required: true, message: '请输入手机号', trigger: 'blur' },
          {
            validator: checkMobile,
            message: '请输入正确的手机号码',
            trigger: 'blur'
          }
        ],
        email: [
          { required: true, message: '请输入邮箱地址', trigger: 'blur' },
          { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
        ]
      },
      cities: [], // 地区集合--省
      location: location,
      signUpUrl: 'user/add'
    }
  },
  created () {
  },
  methods: {
    goBack (index) {
      this.$router.go(index)
    },
    signUp () {
      let vm = this
      let params = {
        username: this.registerForm.username,
        password: this.registerForm.password,
        sex: this.registerForm.sex,
        phoneNum: this.registerForm.phoneNum,
        email: this.registerForm.email,
        avator: '/img/user.jpg',
        school: this.registerForm.school,
        identity: '0',
        birth: '',
        introduction: '',
        location: ''
      }
      this.postData(params, this.signUpUrl)
        .then(res => {
          if (res.data.code === 1) {
            vm.$notify({
              title: '注册成功',
              type: 'success'
            })
            setTimeout(function () {
              vm.$router.push({path: '/'})
            }, 2000)
          } else {
            vm.$notify({
              title: res.data.msg,
              type: 'error'
            })
          }
        })
        .catch(err => {
          console.log('signUp_err=>', err)
        })
    }
  }
}
</script>
<style lang="scss" scoped>
@import '../assets/css/sign-up.scss';
</style>
