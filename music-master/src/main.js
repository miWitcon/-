/*
 * @Author: your name
 * @Date: 2022-03-08 08:34:42
 * @LastEditTime: 2022-03-08 09:03:49
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \musicMaster\src\main.js
 */
import Vue from 'vue'
import Vuex from 'vuex'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import './assets/css/main.css'
import 'babel-polyfill'
import App from './App'
import router from './router'
import store from './store/index'
import '@/assets/js/iconfont.js'
import api from '@/api/index'
import VCharts from 'v-charts'
// 引入echarts
import echarts from 'echarts'
Vue.prototype.$echarts = echarts

Vue.use(api)
Vue.use(Vuex)
Vue.use(ElementUI)
Vue.use(VCharts)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router: router,
  store: new Vuex.Store(store),
  render: h => h(App)
})
