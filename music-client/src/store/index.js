/*
 * @Author: your name
 * @Date: 2022-02-09 13:37:52
 * @LastEditTime: 2022-02-09 13:38:32
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\store\index.js
 */
import Vue from 'vue'
import Vuex from 'vuex'
import configure from './configure'
import user from './user'
import song from './song'
// import user from './user'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    configure,
    user,
    song
  }
})
export default store
