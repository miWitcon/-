import axios from 'axios'
import { BASE_URL } from './config'
import router from '../router'

const service = axios.create({
  baseURL: BASE_URL, // url = base url + request url
  withCredentials: true, // send cookies when cross-domain requests
  timeout: 50000 // request timeout
})

/**
 * 请求接口前，做一些数据处理（请求拦截）
 */
// service.interceptors.request.use(
//   config => {
//     /**
//      * 在发送请求前做些什么
//      * 后台需要前端这边传相关的参数（在请求头添加参数）
//      * 业务需求
//      */

//     console.log('method - ' + config.method)
//     return config
//   },
//   error => {
//     // 请求错误做些什么
//     console.log('request error:', error) // for debug
//     return Promise.reject(error)
//   }
// )

/**
 * 请求接口后，返回数据进行拦截（响应拦截器）
 */
service.interceptors.response.use(
  response => {
    console.log('respond')
    // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据
    // 否则的话抛出错误
    if (response.status === 200) {
      return Promise.resolve(response)
    } else {
      return Promise.reject(response)
    }
  },
  // 服务器状态码不是2开头的的情况
  error => {
    console.log('respone err')
    if (error.response.status) {
      switch (error.response.status) {
        // 401: 未登录
        case 401:
          router.replace({
            path: '/',
            query: {
              redirect: router.currentRoute.fullPath
            }
          })
          break
        case 403:
          // console.log('管理员权限已修改请重新登录')
          // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面
          setTimeout(() => {
            router.replace({
              path: '/',
              query: {
                redirect: router.currentRoute.fullPath
              }
            })
          }, 1000)
          break

        // 404请求不存在
        case 404:
          // console.log('请求页面飞到火星去了')
          break
      }
      return Promise.reject(error.response)
    }
  }
)

export default service
