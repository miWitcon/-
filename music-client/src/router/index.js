/*
 * @Author: your name
 * @Date: 2022-02-08 16:12:24
 * @LastEditTime: 2022-02-11 16:34:46
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\router\index.js
 */
import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '*',
      redirect: '/404'
    },
    {
      path: '/404',
      component: () => import('@/pages/404.vue')
    },
    {
      path: '/',
      name: 'home',
      component: () => import('@/pages/Home'),
      children: []
    },
    {
      path: '/song-list-album/:id',
      name: 'song-list-album',
      component: () => import('@/pages/SongListAlbum')
    },
    {
      path: '/my-music',
      name: 'my-music',
      component: () => import('@/pages/MyMusic')
    },
    {
      path: '/lyric/:id',
      name: 'lyric',
      component: () => import('@/pages/Lyric')
    },
    {
      path: '/song-list',
      name: 'song-list',
      component: () => import('@/pages/SongList')
    },
    {
      path: '/search',
      name: 'search',
      component: () => import('@/pages/Search')
    },
    {
      path: '/setting',
      name: 'setting',
      component: () => import('@/pages/Setting')
    },
    {
      path: '/notice',
      name: 'notice',
      component: () => import('@/pages/Notice')
    },
    {
      path: '/signup',
      name: 'signup',
      component: () => import('@/pages/signup')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/pages/login')
    }
  ]
})

// 解决重复点击相同路由报错问题
const VueRouterPush = Router.prototype.push
Router.prototype.push = function push (to) {
  return VueRouterPush.call(this, to).catch(err => err)
}
