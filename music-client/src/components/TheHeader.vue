<!--
 * @Author: your name
 * @Date: 2022-02-09 08:29:28
 * @LastEditTime: 2022-02-11 15:54:36
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\components\TheHeader.vue
-->
<template>
  <div class="the-header">
    <!--图标-->
    <div class="yinying">
      <div class="header-logo-bag">
        <div class="header-logo">
          <svg class="icon">
            <use xlink:href="#myicon-erji"/>
          </svg>
          <span>{{musicName}}</span>
        </div>
      </div>
    </div>
    <ul class="navbar">
      <li
        v-for="item in navMsg"
        :key="item.path"
        :class="{active: item.name == activeName}"
        @click="goPage(item.name, item.path)"
      >
        {{item.name}}
      </li>
      <li>
        <div class="header-search">
          <input type="text" placeholder="请输入歌名、发布者、歌单名" @keyup.enter="goSearch()" v-model="keywords"/>
          <div class="search-btn" @click="goSearch()">
            <svg class="icon">
              <use xlink:href="#myicon-sousuo"/>
            </svg>
          </div>
        </div>
      </li>
      <li
        v-show="!loginIn"
        v-for="item in loginMsg"
        :key="item.type"
        :class="{active: item.name == activeName}"
        @click="goPage(item.name, item.path)"
      >
        {{item.name}}
      </li>
    </ul>
    <!--设置-->
    <div class="header-right" v-show="loginIn">
      <div id="user">
        <img :src="attachImageUrl(avator)" alt="">
      </div>
      <div v-if="unReadMsgNum > 0" class="badge">{{ unReadMsgNum }}</div>
      <ul class="menu">
        <li v-for="(item, index) in menuList" :key="index" @click="goMenuList(item.path)">
          {{item.name}}
          <span v-if="item.name == '公告'&& unReadMsgNum > 0" class="tip">{{ unReadMsgNum }}</span>
        </li>
      </ul>
    </div>

  </div>
</template>

<script>
import mixin from '../mixins'
import { mapGetters } from 'vuex'
import { navMsg, loginMsg, menuList } from '../assets/data/header'

export default {
  name: 'the-header',
  mixins: [mixin],
  data () {
    return {
      noticePath: '/notice',
      musicName: 'Campus-music',
      keywords: '',
      navMsg: navMsg, // 左侧导航栏
      loginMsg: loginMsg, // 右侧导航栏
      menuList: menuList // 用户下拉菜单项
    }
  },
  computed: {
    ...mapGetters([
      'userId',
      'activeName',
      'avator',
      'username',
      'loginIn',
      'unReadMsgNum' // 未读公告数
    ])
  },
  mounted () {
    document.querySelector('#user').addEventListener('click', function (e) {
      document.querySelector('.menu').classList.add('show')
      e.stopPropagation()// 关键在于阻止冒泡
    }, false)
    // 点击“菜单”内部时，阻止事件冒泡。(这样点击内部时，菜单不会关闭)
    document.querySelector('.menu').addEventListener('click', function (e) {
      e.stopPropagation()
    }, false)
    document.addEventListener('click', function () {
      document.querySelector('.menu').classList.remove('show')
    }, false)
  },
  created () {
  },
  methods: {
    // 顶部菜单高亮显示
    goPage (name, path) {
      if (!this.loginIn && path === '/my-music') {
        this.notify('请先登录', 'warning')
      } else {
        this.$store.commit('setActiveName', name)
        this.$router.push(path)
      }
    },
    goNotice (path) {
      this.$store.commit('setActiveName', path)
      this.$router.push(path)
    },
    goMenuList (path) {
      if (path === 0) {
        this.$store.commit('setIsCollect', false)
        this.$router.push({path: '/'})
      }
      document.querySelector('.menu').classList.remove('show')
      if (path) {
        this.$router.push({path: path})
      } else {
        this.$store.commit('setLoginIn', false)
        this.$router.go(0)
      }
    },
    goSearch () {
      this.$store.commit('setSearchword', this.keywords)
      this.$router.push({path: '/search', query: {keywords: this.keywords}})
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/the-header.scss';
</style>
