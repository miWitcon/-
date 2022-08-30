<!--
 * @Author: your name
 * @Date: 2022-01-28 10:25:53
 * @LastEditTime: 2022-02-11 10:29:02
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \music-client\src\pages\Home.vue
-->
<template>
  <div class="swipper">
    <!--轮播图-->
    <el-carousel :interval="4000" type="card" height="280px">
      <el-carousel-item v-for="(item, index) in swiperList" :key="index">
        <img :src="item.picImg"/>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>

export default {
  name: 'swipper',
  components: {
  },
  data () {
    return {
      swiperList: [
        {
          picImg: require('@/assets/img/swiper/blur-1851426_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/concert-768722_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/boy-984293_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/ipad-605439_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/microphone-1209816_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/music-notes-3221097_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/piano-1655558_640.jpg')
        }, {
          picImg: require('@/assets/img/swiper/turntable-1337986_640.jpg')
        }
      ] // 轮播图列表
    }
  },
  created () {
  },
  methods: {
  }
}
</script>

<style lang="scss" scoped>
@import "../assets/css/swipper.scss";
</style>
