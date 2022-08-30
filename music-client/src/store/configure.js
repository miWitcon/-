/*
 * @Author: your name
 * @Date: 2022-02-09 13:38:50
 * @LastEditTime: 2022-02-11 17:08:20
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\store\configure.js
 */
import { BASE_URL } from '../api/config'

const configure = {
  state: {
    HOST: BASE_URL, // 本地地址
    loginIn: false, // 用户是否登录
    showAside: false, // 是否显示侧边栏
    activeName: '', // 当前选中的菜单名
    searchword: '', // 搜索关键词
    isCollect: false // 是否已收藏
  },
  getters: {
    activeName: state => {
      let activeName = state.activeName
      if (!activeName) {
        activeName = JSON.parse(window.sessionStorage.getItem('activeName'))
      }
      return activeName
    },
    loginIn: state => {
      let loginIn = state.loginIn
      if (!loginIn) {
        loginIn = JSON.parse(window.sessionStorage.getItem('loginIn') || null)
      }
      return loginIn
    },
    showAside: state => {
      let showAside = state.showAside
      if (!showAside) {
        showAside = JSON.parse(window.sessionStorage.getItem('showAside') || null)
      }
      return showAside
    },
    searchword: state => {
      let searchword = state.searchword
      if (!searchword) {
        searchword = JSON.parse(window.sessionStorage.getItem('searchword') || null)
      }
      return searchword
    },
    isCollect: state => {
      let isCollect = state.isCollect
      if (!isCollect) {
        isCollect = JSON.parse(window.sessionStorage.getItem('isCollect') || null)
      }
      return isCollect
    }
  },
  mutations: {
    setActiveName: (state, activeName) => {
      state.activeName = activeName
      window.sessionStorage.setItem('activeName', JSON.stringify(activeName))
    },
    setLoginIn: (state, loginIn) => {
      state.loginIn = loginIn
      window.sessionStorage.setItem('loginIn', JSON.stringify(loginIn))
    },
    setShowAside: (state, showAside) => {
      state.showAside = showAside
      window.sessionStorage.setItem('showAside', JSON.stringify(showAside))
    },
    setSearchword: (state, searchword) => {
      state.searchword = searchword
      window.sessionStorage.setItem('searchword', JSON.stringify(searchword))
    },
    setIsCollect: (state, isCollect) => {
      state.isCollect = isCollect
      window.sessionStorage.setItem('isCollect', JSON.stringify(isCollect))
    }
  }
}
export default configure
