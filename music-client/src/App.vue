<!--
 * @Author: your name
 * @Date: 2022-02-08 16:12:24
 * @LastEditTime: 2022-02-11 16:52:26
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\App.vue
-->
<template>
  <div id="app">
    <the-header/>
    <the-aside></the-aside>
    <router-view class="music-content"/>
    <song-audio/>
    <the-footer/>
    <play-bar/>
    <scroll-top/>
  </div>
</template>

<script>
import TheHeader from './components/TheHeader'
import SongAudio from './components/songAudio'
import PlayBar from './components/playBar'
import ScrollTop from './components/scrollTop'
import TheFooter from '@/components/theFooter'
import TheAside from '@/components/TheAside'

export default {
  name: 'App',
  components: {
    TheHeader,
    SongAudio,
    PlayBar,
    ScrollTop,
    TheAside,
    TheFooter
  }
}
</script>

<style  lang="scss" scoped>
@import './assets/css/app.scss';
</style>
