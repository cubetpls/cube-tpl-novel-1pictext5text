export default {
  data : {
    hover: 0,
    list: []
  },
  onReady(){
    /*cube 被添加到页面之后 */
    this.request({
      api:'serial',
      complete: (defaultData, res) => {
        if (res && res.errno === 0) {
          let data = this.formatData(res.data.topic_data)
          this.dataHandle(data)
          this.setStorage({
            key: 'data',
            data: data
          })
        } else {
          this.getStorage({
            key: 'data',
            success: res => {
              const data = res || defaultData
              this.dataHandle(data)
            }
          })
        }
      }
    })
  },
  formatData(data) {
    return data.map(({images, id, title, story_count, user, tag, link = ''}) => {
      const special_cls = title.indexOf('【') === 0 ? 'special' : ''
      return {
        images,
        title,
        author: user.name,
        update: this.updateText(story_count),
        link,
        tags: tag,
        special_cls
      }
    })
  },
  updateText(count) {
    return `更新到<i>${count}</i>章`
  },
  dataHandle(data) {
    this.setData({
      list: data
    })
  }
}