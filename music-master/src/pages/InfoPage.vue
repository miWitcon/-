<template>
  <div>
    <el-row :gutter="20" class="mgb20">
      <el-col :span="8">
        <el-card>
          <div class="grid-content">
            <div class="grid-cont-center">
              <div class="num-size" style="color: #30a4fc">{{ userNum }}</div>
              <div>用户数量</div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card>
          <div class="grid-content">
            <div class="grid-cont-center">
              <div class="num-size" style="color: green">{{songCount}}</div>
              <div>歌曲总数</div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card>
          <div class="grid-content">
            <div class="grid-cont-center">
              <div class="num-size" style="color: #ca1aff">{{songListCount}}</div>
              <div>歌单数量</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20" class="mgb20">
      <el-col :span="12">
        <div ref="pieChart" class="bkg"></div>
      </el-col>
      <el-col :span="12">
        <div ref="pieChart2" class="bkg"></div>
      </el-col>
    </el-row>
    <el-row :gutter="20" class="mgb20">
      <el-col :span="12">
        <div ref="barChart" class="bkg"></div>
      </el-col>
      <el-col :span="12">
        <div id="lineChart" class="bkg"></div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return {
      userNum: '', // 用户数目
      songCount: '', // 歌曲总数
      songListCount: '', // 歌单数量
      getAllStyleUrl: 'songList/allStyle',
      getUserNumUrl: 'user/sexRatio',
      getAvgScoreColNumUrl: 'song/avgScoreAndColNum',
      getWeekUploadNumUrl: 'song/weekUploadNum',
      getSongNumUrl: 'song/songNum'
    }
  },
  created () {
    this.getUserNum(val => {
      this.drawUserPieChart(val)
    })
    this.getAllListStyle(val => {
      this.drawSongStylePieChart(val)
    })
    this.getAvgScoreAndColNum(val => {
      this.drawAvgScoreLine(val)
    })
    this.getWeekUploadNum(val => {
      this.drawWeekUploadLine(val)
    })
    this.getSongNum()
  },
  mounted () {},
  methods: {
    getSongNum () {
      this.getData({}, this.getSongNumUrl)
        .then(res => {
          this.songCount = res.data
        })
        .catch(err => {
          console.log('getSongNum_err=>', err)
        })
    },
    // 获取用户数量
    getUserNum (callback) {
      this.getData({}, this.getUserNumUrl)
        .then(res => {
          this.userNum = res.data.boyNum + res.data.girlNum
          callback(res.data)
        })
        .catch(err => {
          console.log('getUserNum_err=>', err)
        })
    },
    drawUserPieChart (val) {
      let pieChart = this.$echarts.init(this.$refs.pieChart)
      pieChart.setOption({
        backgroundColor: '#fff',
        color: ['#f40', '#4386f5'],
        title: {
          text: '用户性别比例',
          // subtext: 'Fake Data',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '10%',
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            type: 'pie',
            radius: ['2%', '50%'],
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            data: [
              { value: val.boyNum, name: '男' },
              { value: val.girlNum, name: '女' }
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      })
      // echarts大小自适应
      window.addEventListener('resize', function () {
        pieChart.resize()
      })
    },
    getAllListStyle (callback) {
      this.getData({}, this.getAllStyleUrl)
        .then(res => {
          var num = 0
          for (let item of res.data) {
            num += item.songListNum
          }
          this.songListCount = num
          callback(res.data)
        })
        .catch(err => {
          console.log('getAllListStyle_err', err)
        })
    },
    drawSongStylePieChart (val) {
      let pieChart = this.$echarts.init(this.$refs.pieChart2)
      var songListData = []
      for (var i = 0; i < val.length; i++) {
        songListData.push({value: '', name: ''})
        songListData[i].value = val[i].songListNum
        songListData[i].name = val[i].style
      }
      pieChart.setOption({
        backgroundColor: '#fff',
        title: {
          text: '歌单类型百分比',
          // subtext: 'Fake Data',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '10%',
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            type: 'pie',
            radius: ['2%', '50%'],
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            data: songListData,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      })
      // echarts大小自适应
      window.addEventListener('resize', function () {
        pieChart.resize()
      })
    },
    getAvgScoreAndColNum (callback) {
      this.getData({}, this.getAvgScoreColNumUrl)
        .then(res => {
          callback(res.data)
        })
        .catch(err => {
          console.log('getAvgScoreAndColNum_err=>', err)
        })
    },
    drawAvgScoreLine (val) {
      // 基于准备好的dom，初始化echarts实例
      let barChart = this.$echarts.init(this.$refs.barChart)
      var songNameData = []
      var avgScoreData = []
      var colNumData = []
      for (var i = 0; i < val.length; i++) {
        songNameData.push(val[i].songName)
        avgScoreData.push(val[i].avgScore)
        colNumData.push(val[i].colNum)
      }
      // 绘制图表
      barChart.setOption({
        height: '60%',
        backgroundColor: '#fff',
        title: {
          text: '评分top10歌曲',
          left: 'center'
        },
        legend: {
          top: '5%',
          // orient: 'vertical',
          left: 'center'
        },
        tooltip: {},
        xAxis: {
          data: songNameData,
          axisLabel: {
            rotate: 60
          }
        },
        yAxis: {},
        series: [
          {
            name: '评分',
            type: 'bar',
            data: avgScoreData
          },
          {
            name: '收藏量',
            type: 'line',
            data: colNumData
          }
        ]
      })
      // echarts大小自适应
      window.addEventListener('resize', function () {
        barChart.resize()
      })
    },
    getWeekUploadNum (callback) {
      this.getData({}, this.getWeekUploadNumUrl)
        .then(res => {
          callback(res.data)
        })
        .catch(err => {
          console.log('getWeekUploadNum_err=>', err)
        })
    },
    drawWeekUploadLine (val) {
      let lineChart = this.$echarts.init(document.getElementById('lineChart'))
      var weekData = []
      var uploadNum = []
      for (var i = val.length - 1; i >= 0; i--) {
        weekData.push(val[i].week)
        uploadNum.push(val[i].weekCount)
      }
      lineChart.setOption({
        backgroundColor: '#fff',
        title: {
          // top: '5%',
          left: 'center',
          text: '周上传量'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          top: '5%'
        },
        toolbox: {
          show: true,
          feature: {
            dataView: { readOnly: false },
            magicType: { type: ['line', 'bar'] },
            restore: {},
            saveAsImage: {}
          }
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: weekData
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            name: '数量',
            type: 'line',
            data: uploadNum,
            markPoint: {
              data: [
                { type: 'max', name: 'Max' },
                { type: 'min', name: 'Min' }
              ]
            },
            markLine: {
              data: [{ type: 'average', name: 'Avg' }]
            },
            itemStyle: {
              color: 'rgba(21, 156, 205, 1)'
            },
            lineStyle: {
              color: 'rgba(28, 21, 162, 1)'
            }
          }
        ]
      })
      // echarts大小自适应
      window.addEventListener('resize', function () {
        lineChart.resize()
      })
    }

    // // 获取歌单数量
    // getSongListCount () {
    //   getSongList(this.current, this.limit, this.findObj)
    //     .then(res => {
    //       this.songListCount = res.data.total
    //     })
    // },
    // // 获取歌曲数量
    // getSongCount () {
    //   getSongtotal()
    //     .then(res => {
    //       this.songCount = res.data
    //     })
    // }
  }
}
</script>

<style scoped>
.bkg{
  /* border: 2px solid red; */
  border-radius: 2%;
  width: 100%;
  height: 400px;
  overflow: hidden;
}
.grid-content{
  display: flex;
  align-items: center;
  height: 50px;
}
.grid-cont-center{
  flex: 1;
  text-align: center;
  font-size: 14px;
}
.num-size{
  font-size: 40px;
  margin-top: 10px;
}
</style>
