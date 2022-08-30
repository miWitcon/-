<template>
  <div class="info">
    <p class="title">编辑个人资料</p>
    <hr/>
    <div class="personal">
      <el-form :model="registerForm" class="demo-ruleForm" label-width="80px">
        <el-form-item prop="username" label="用户名">
          <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
        </el-form-item>
        <!-- <el-form-item prop="password" label="密码">
          <el-input type="password" placeholder="密码" v-model="registerForm.password"></el-input>
        </el-form-item> -->
        <el-form-item label="性别">
          <el-radio-group v-model="registerForm.sex">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="phoneNum" label="手机">
          <el-input  placeholder="手机" v-model="registerForm.phoneNum" ></el-input>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item prop="school" label="学校">
          <el-input v-model="registerForm.school" placeholder="学校"></el-input>
        </el-form-item>
        <el-form-item prop="birth" label="生日">
          <el-date-picker type="date" placeholder="选择日期" :editable="false" v-model="registerForm.birth" style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item prop="introduction" label="签名">
          <el-input  type="textarea" placeholder="签名" v-model="registerForm.introduction" ></el-input>
        </el-form-item>
        <el-form-item prop="location" label="地区">
          <el-cascader
            :options="location"
            :placeholder="registerForm.locationName"
            style="width: 100%;"
            v-model="registerForm.location"
            clearable
          />
        </el-form-item>
      </el-form>
    <div class="btn">
      <div @click="saveMsg()">保存</div>
      <div @click="goback">取消</div>
    </div>
  </div>
</div>
</template>

<script>
import mixin from '../mixins'
import { location } from '@/assets/data/location'
import { mapGetters } from 'vuex'

export default {
  name: 'info',
  mixins: [mixin],
  data: function () {
    return {
      registerForm: { // 注册
        username: '',
        password: '',
        sex: '',
        phoneNum: '',
        email: '',
        birth: '',
        introduction: '',
        location: '',
        locationName: '',
        school: '',
        identity: ''
      },
      location: location,
      locationIndex: '',
      getMsgUrl: 'user/selectByPrimaryKey',
      updateUserMsgUrl: 'user/update'
    }
  },
  computed: {
    ...mapGetters([
      'userId'
    ])
  },
  mounted () {
    this.getMsg(this.userId)
  },
  methods: {
    getMsg (id) {
      this.getData({userId: id}, this.getMsgUrl)
        .then(res => {
          this.registerForm.username = res.data.username
          this.registerForm.password = res.data.password
          this.registerForm.sex = res.data.sex
          this.registerForm.phoneNum = res.data.phoneNum
          this.registerForm.email = res.data.email
          this.registerForm.birth = res.data.birth
          this.registerForm.introduction = res.data.introduction
          this.registerForm.location = res.data.location
          this.registerForm.avator = res.data.avator
          this.registerForm.school = res.data.school
          this.registerForm.identity = res.data.identity
          if (res.data.location !== '' && res.data.location !== null) {
            this.locationIndex = res.data.location
            this.registerForm.locationName = this.attachLocation(res.data.location)
          }
        })
        .catch(err => {
          console.log('getMsg_err=>', err)
        })
    },
    goback () {
      this.$router.go(-1)
    },
    saveMsg () {
      let d = new Date(this.registerForm.birth)
      let datetime = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
      var location
      if (this.registerForm.location.constructor === Array) { // 判断location是数组还是字符串
        location = this.registerForm.location[0] + ',' + this.registerForm.location[1] + ',' + this.registerForm.location[2]
      } else {
        location = this.registerForm.location
      }
      var params = {
        userId: this.userId,
        username: this.registerForm.username,
        password: this.registerForm.password,
        sex: this.registerForm.sex,
        phoneNum: this.registerForm.phoneNum,
        email: this.registerForm.email,
        birth: datetime,
        introduction: this.registerForm.introduction,
        location: location,
        school: this.registerForm.school,
        identity: this.registerForm.identity
      }
      this.postData(params, this.updateUserMsgUrl)
        .then(res => {
          if (res.data.code === 1) {
            this.$store.commit('setUsername', this.registerForm.username)
            this.getMsg(this.userId)
            this.$notify.success({
              title: '修改成功',
              showClose: true
            })
          } else {
            this.$notify.error({
              title: res.data.msg,
              showClose: true
            })
          }
        })
        .catch(err => {
          console.log('saveMsg_err=>', err)
        })
    },
    // 转换成地区名
    attachLocation (location) {
      let arr = location.split(',')
      let province = this.location[arr[0]].label
      let city = this.location[arr[0]].children[arr[1]].label
      let township = this.location[arr[0]].children[arr[1]].children[arr[2]].label
      location = province + '/' + city + '/' + township
      return location
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/info.scss';
</style>
