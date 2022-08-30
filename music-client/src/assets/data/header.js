/*
 * @Author: your name
 * @Date: 2022-02-09 08:29:28
 * @LastEditTime: 2022-02-09 13:57:59
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\assets\data\header.js
 */
// 左侧导航栏
const navMsg = [
  { name: '首页', path: '/' },
  {name: '歌单', path: '/song-list'},
  {name: '我的', path: '/my-music'}
]

// 右侧导航栏
const loginMsg = [
  {name: '登录', path: '/login'},
  {name: '注册', path: '/signup'}
]
// 用户下拉菜单
const menuList = [
  {name: '公告', path: '/notice'},
  {name: '个人中心', path: '/setting'},
  {name: '退出登录', path: 0}
]

export {
  navMsg,
  loginMsg,
  menuList
}
