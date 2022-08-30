<!--
 * @Author: your name
 * @Description: 返回页面顶部
 * @FilePath: \music-client\src\components\scrollTop.vue
-->
<template>
  <div class="scroll-top" @click="returnTop">
    <div class="box-in"/>
  </div>
</template>

<script>
export default {
  name: 'scroll-top',
  methods: {
    returnTop () {
      document.documentElement.scrollTop = document.body.scrollTop = 0
    }
  }
}
</script>

<style lang="scss" scoped>
@import "../assets/css/scroll-top";
</style>
