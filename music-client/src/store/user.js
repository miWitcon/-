const user = {
  state: {
    userId: '',
    username: '',
    avator: '',
    unReadMsgNum: 0 // 未读公告数
  },
  getters: {
    userId: state => {
      let userId = state.userId
      if (!userId) {
        userId = JSON.parse(window.sessionStorage.getItem('userId') || null)
      }
      return userId
    },
    username: state => {
      let username = state.username
      if (!username) {
        username = JSON.parse(window.sessionStorage.getItem('username') || null)
      }
      return username
    },
    avator: state => {
      let avator = state.avator
      if (!avator) {
        avator = JSON.parse(window.sessionStorage.getItem('avator') || null)
      }
      return avator
    },
    unReadMsgNum: state => {
      let unReadMsgNum = state.unReadMsgNum
      if (!unReadMsgNum) {
        unReadMsgNum = JSON.parse(window.sessionStorage.getItem('unReadMsgNum') || null)
      }
      return unReadMsgNum
    }
  },
  mutations: {
    setUserId: (state, userId) => {
      state.userId = userId
      window.sessionStorage.setItem('userId', JSON.stringify(userId))
    },
    setUsername: (state, username) => {
      state.username = username
      window.sessionStorage.setItem('username', JSON.stringify(username))
    },
    setAvator: (state, avator) => {
      state.avator = avator
      window.sessionStorage.setItem('avator', JSON.stringify(avator))
    },
    setUnReadMsgNum: (state, unReadMsgNum) => {
      state.unReadMsgNum = unReadMsgNum
      window.sessionStorage.setItem('unReadMsgNum', JSON.stringify(unReadMsgNum))
    }
  },
  actions: {}
}

export default user
