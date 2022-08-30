<template>
  <div class="table">
    <div class="container">
      <div class="handle-box">
        <el-form ref="formData" :inline="true">
          <el-row>
            <el-col>
              <el-form-item>
                <el-input
                  size="mini"
                  v-model="formData.username"
                  placeholder="请输入用户名"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-input
                  size="mini"
                  v-model="formData.phoneNum"
                  placeholder="请输入电话"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-input
                  size="mini"
                  v-model="formData.email"
                  placeholder="请输入邮箱"
                  clearable
                />
              </el-form-item>
              <el-form-item>
                <el-button
                  size="mini"
                  type="primary"
                  icon="el-icon-search"
                  @click="getUserData"
                >
                  搜索
                </el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <el-button type="primary" size="mini" class="handle-del mr10" @click="delAllUser" icon="el-icon-delete">批量删除</el-button>
        <el-button type="primary" size="mini" @click="centerDialogVisible = true" icon="el-icon-circle-plus-outline">添加用户</el-button>
      </div>
      <el-table :data="userList" border size="mini" style="width: 100%" ref="multipleTable" height="550px" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="40" align="center"></el-table-column>
        <el-table-column label="用户图片" width="102" align="center">
          <template slot-scope="scope">
            <img :src="getUrl(scope.row.avator)" alt="" style="width: 80px;"/>
            <el-upload
              class="upload-demo"
              :action="uploadUrl(scope.row.userId)"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload">
              <el-button size="mini">更新图片</el-button>
            </el-upload>
          </template>
        </el-table-column>
        <el-table-column label="用户名" prop="username" width="80" align="center"></el-table-column>
        <el-table-column label="密码" prop="password" width="80" align="center"></el-table-column>
        <el-table-column label="性别" width="50" align="center">
            <template slot-scope="scope">
                <div>{{changeSex(scope.row.sex) }}</div>
            </template>
        </el-table-column>
        <el-table-column label="权限" width="50" align="center">
            <template slot-scope="scope">
                <div>{{changeIdentity(scope.row.identity) }}</div>
            </template>
        </el-table-column>
        <el-table-column label="手机号码" prop="phoneNum" width="120" align="center"></el-table-column>
        <el-table-column label="邮箱" prop="email" width="120" align="center"></el-table-column>
        <el-table-column label="生日" width="120" align="center">
          <template slot-scope="scope">
            <div>{{attachBirth(scope.row.birth)}}</div>
          </template>
        </el-table-column>
        <el-table-column label="学校" prop="school" width="120" align="center"></el-table-column>
        <el-table-column prop="introduction" label="个性签名" align="center"></el-table-column>
        <el-table-column label="地区" width="80" align="center">
          <template slot-scope="scope" v-if="scope.row.location != ''">
            <div>{{attachLocation(scope.row.location)}}</div>
          </template>
        </el-table-column>
        <el-table-column label="收藏" width="80" align="center">
            <template  slot-scope="scope">
                <el-button size="mini" @click="getCollect(userList[scope.$index].userId)">收藏</el-button>
            </template>
        </el-table-column>
        <el-table-column label="操作" width="150" align="center">
            <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.row.userId)">删除</el-button>
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

    <!--添加新用户-->
    <el-dialog title="添加用户" :visible.sync="centerDialogVisible" width="400px" center>
      <el-form :model="registerForm" status-icon :rules="rules" ref="registerForm" label-width="70px" class="demo-ruleForm">
        <el-form-item label="用户名" prop="username" size="mini">
          <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password" size="mini">
          <el-input type="password" placeholder="密码" v-model="registerForm.password"></el-input>
        </el-form-item>
        <el-form-item label="学校" prop="school" size="mini">
          <el-input v-model="registerForm.school" placeholder="学校"></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini" prop="sex">
          <el-radio-group v-model="registerForm.sex">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="权限" size="mini" prop="identity">
          <el-radio-group v-model="registerForm.identity">
            <el-radio :label="0">普通用户</el-radio>
            <el-radio :label="1">管理员 </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="手机" prop="phoneNum" size="mini">
          <el-input  placeholder="手机" v-model="registerForm.phoneNum"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email" size="mini">
          <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birth" size="mini">
            <el-date-picker type="date" placeholder="选择日期" v-model="registerForm.birth" style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item label="个性签名" prop="introduction" size="mini">
          <el-input  type="textarea" placeholder="个性签名" v-model="registerForm.introduction" ></el-input>
        </el-form-item>
        <el-form-item prop="location" label="地区">
          <el-cascader
            :options="location"
            size="mini"
            v-model="registerForm.location"
            clearable
          />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="mini" @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" size="mini" @click="addPeople">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" :visible.sync="editVisible" width="400px">
      <el-form ref="form" :model="form" :rules="rules" label-width="60px">
        <el-form-item label="用户名" size="mini" prop="username">
          <el-input v-model="form.username" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="密码" size="mini" prop="password">
          <el-input v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item label="性别" size="mini" prop="sex">
          <el-radio-group v-model="form.sex">
            <el-radio :label="0">女</el-radio>
            <el-radio :label="1">男</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="权限" size="mini" prop="identity">
          <el-radio-group v-model="form.identity">
            <el-radio :label="0">普通用户</el-radio>
            <el-radio :label="1">管理员</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="手机" size="mini" prop="phoneNum">
          <el-input v-model="form.phoneNum"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" size="mini" prop="email ">
          <el-input v-model="form.email"></el-input>
        </el-form-item>
        <el-form-item label="生日" prop="birth" size="mini">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.birth" style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item label="个性签名" size="mini" prop="introduction">
          <el-input v-model="form.introduction"></el-input>
        </el-form-item>
        <el-form-item label="地区" prop="location">
          <el-cascader
            :options="location"
            :placeholder="form.locationName"
            size="mini"
            v-model="form.location"
            clearable
          />
        </el-form-item>
        <el-form-item label="学校" size="mini" prop="school">
          <el-input v-model="form.school"></el-input>
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
        <el-button size="mini" type="primary" @click="deleteRow(idx)">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mixin } from '../mixins'
import { location } from '@/assets/data/location'

export default {
  name: 'consumer-page',
  mixins: [mixin],
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
    return {
      registerForm: { // 注册
        username: '',
        password: '',
        school: '',
        sex: '',
        identity: '',
        phoneNum: '',
        email: '',
        birth: '',
        introduction: '',
        location: ''
      },
      cities: [],
      rules: {
        username: [
          { required: true, trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        identity: [
          { required: true, message: '请选择权限', trigger: 'change' }
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
        ],
        birth: [
          { required: true, message: '请选择日期', trigger: 'change' }
        ],
        introduction: [
          { required: false, message: '请输入介绍', trigger: 'blur' }
        ],
        location: [
          { required: false, message: '请输入地区', trigger: 'change' }
        ]
      },
      formData: {
        username: '',
        phoneNum: '',
        email: ''
      },
      tableData: [], // 记录用户信息，用于显示
      tempDate: [], // 记录用户信息，用于搜索时能临时记录一份用户信息
      is_search: false,
      multipleSelection: [], // 记录要删除的用户信息
      centerDialogVisible: false,
      editVisible: false, // 显示编辑框
      delVisible: false, // 显示删除框
      select_word: '', // 记录输入框输入的内容
      form: { // 记录编辑的信息
        userId: '',
        username: '',
        password: '',
        sex: '',
        identity: '',
        phoneNum: '',
        email: '',
        birth: '',
        introduction: '',
        location: '',
        locationName: '',
        createTime: '',
        updateTime: '',
        school: ''
      },
      location: location,
      pageSize: 5, // 页数
      currentPage: 1, // 当前页
      idx: -1, // 记录当前点中的行
      getAllUserUrl: 'user/allUser',
      addUserUrl: 'user/add',
      updateUserUrl: 'user/update',
      deleteUserUrl: 'user/delete'
    }
  },
  computed: {
    // 计算当前表格中的数据
    userList () {
      return this.tableData.slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize)
    }
  },
  watch: {},
  created () {
    this.getUserData()
  },
  methods: {
    // 分页导航改变页码大小
    handleSizeChange (size) {
      this.pageSize = size
      this.current = 1
      this.getUserData()
    },
    // 获取当前页
    handleCurrentChange (val) {
      this.currentPage = val
    },
    uploadUrl (userId) {
      return `${this.$store.state.HOST}/user/updateUserPic?userId=${userId}`
    },
    // 获取用户信息
    getUserData () {
      this.tableData = []
      this.tempDate = []
      var param = {
        username: this.formData.username,
        phoneNum: this.formData.phoneNum,
        email: this.formData.email
      }
      this.getData(param, this.getAllUserUrl)
        .then(res => {
          if (res.status === 200) {
            this.tableData = res.data
            this.tempDate = res.data
            this.currentPage = 1
          } else {
            console('获取数据失败')
          }
        })
        .catch(err => {
          console.log('getUserData_error', err)
        })
    },
    // 转换成地区名
    attachLocation (location) {
      var arr = location.split(',')
      let province = this.location[arr[0]].label
      let city = this.location[arr[0]].children[arr[1]].label
      let township = this.location[arr[0]].children[arr[1]].children[arr[2]].label
      location = province + '/' + city + '/' + township
      return location
    },
    // 转向该用户的收藏列表
    getCollect (userId) {
      this.$router.push({path: '/collect', query: { userId }})
    },
    // 添加用户
    addPeople () {
      this.$refs['registerForm'].validate(valid => {
        var datetime = ''
        if (valid) {
          if (this.registerForm.birth !== '') {
            let d = this.registerForm.birth
            datetime = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
          }
          let params = new URLSearchParams()
          params.append('username', this.registerForm.username)
          params.append('password', this.registerForm.password)
          params.append('sex', this.registerForm.sex)
          params.append('phoneNum', this.registerForm.phoneNum)
          params.append('email', this.registerForm.email)
          params.append('birth', datetime)
          params.append('introduction', this.registerForm.introduction)
          params.append('location', this.registerForm.location)
          params.append('school', this.registerForm.school)
          params.append('avator', '/img/user.jpg')
          params.append('identity', this.registerForm.identity)
          this.postData(params, this.addUserUrl)
            .then(res => {
              if (res.data.code === 1) {
                this.getUserData()
                this.registerForm = {}
                this.notify('添加成功', 'success')
              } else {
                this.notify(res.data.msg, 'error')
              }
            })
            .catch(err => {
              console.log('addPeople_err', err)
            })
          this.centerDialogVisible = false
        }
      })
    },
    // 编辑
    handleEdit (row) {
      this.idx = row.userId
      this.form = {
        userId: row.userId,
        username: row.username,
        password: row.password,
        sex: row.sex,
        phoneNum: row.phoneNum,
        email: row.email,
        birth: row.birth,
        introduction: row.introduction,
        location: row.location,
        avator: row.avator,
        school: row.school,
        identity: row.identity
      }
      if (row.location !== '' && row.location !== null) {
        this.form.locationName = this.attachLocation(row.location)
      }
      this.editVisible = true
    },
    // 保存编辑
    saveEdit () {
      this.$refs['form'].validate(valid => {
        if (valid) {
          let d = new Date(this.form.birth)
          let datetime = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
          let params = new URLSearchParams()
          params.append('userId', this.form.userId)
          params.append('username', this.form.username)
          params.append('password', this.form.password)
          params.append('sex', this.form.sex)
          params.append('phoneNum', this.form.phoneNum)
          params.append('email', this.form.email)
          params.append('birth', datetime)
          params.append('introduction', this.form.introduction)
          params.append('location', this.form.location)
          params.append('school', this.form.school)
          params.append('identity', this.form.identity)
          this.postData(params, this.updateUserUrl).then(res => {
            if (res.data.code === 1) {
              this.getUserData()
              this.notify('修改成功', 'success')
            } else {
              this.notify(res.data.msg, 'error')
            }
          }).catch(err => {
            console.log(err)
          })
          this.editVisible = false
        }
      })
    },
    // 更新图片
    handleAvatarSuccess (res, file) {
      let _this = this
      if (res.code === 1) {
        _this.imageUrl = URL.createObjectURL(file.raw)
        _this.getUserData()
        _this.$notify({
          title: '上传成功',
          type: 'success'
        })
      } else {
        _this.$notify({
          title: '上传失败',
          type: 'error'
        })
      }
    },
    // 确定删除
    deleteRow (ids) {
      this.getData({userId: ids}, this.deleteUserUrl)
        .then(res => {
          if (res.data) {
            this.getUserData()
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

<style scoped>
.handle-box {
  margin-bottom: 20px;
  font-size: 12px;
}

.handle-input {
  width: 300px;
  display: inline-block;
}

.pagination {
  display: flex;
  justify-content: center;
}
</style>
