import service from './request'
// import qs from 'qs'

export default {
  install (Vue, options) {
    Vue.prototype.getData = function (params, url) {
      return service.request({
        method: 'get',
        url: url,
        params
      })
    }

    Vue.prototype.postData = function (params, url) {
      // var data = qs.stringify(params)
      var data = params
      return service.request({
        method: 'post',
        url: url,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        data
      })
    }
  }
}
