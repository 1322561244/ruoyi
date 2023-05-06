import request from '@/utils/request'

// 查询班次日期管理列表
export function listDate(query) {
  return request({
    url: '/biz/date/list',
    method: 'get',
    params: query
  })
}

// 查询班次日期管理详细
export function getDate(dateId) {
  return request({
    url: '/biz/date/' + dateId,
    method: 'get'
  })
}

// 新增班次日期管理
export function addDate(data) {
  return request({
    url: '/biz/date',
    method: 'post',
    data: data
  })
}

// 修改班次日期管理
export function updateDate(data) {
  return request({
    url: '/biz/date',
    method: 'put',
    data: data
  })
}

// 删除班次日期管理
export function delDate(dateId) {
  return request({
    url: '/biz/date/' + dateId,
    method: 'delete'
  })
}
