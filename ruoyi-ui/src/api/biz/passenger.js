import request from '@/utils/request'

// 查询乘客表列表
export function listPassenger(query) {
  return request({
    url: '/biz/passenger/list',
    method: 'get',
    params: query
  })
}

// 查询乘客表详细
export function getPassenger(passengerId) {
  return request({
    url: '/biz/passenger/' + passengerId,
    method: 'get'
  })
}

// 新增乘客表
export function addPassenger(data) {
  return request({
    url: '/biz/passenger',
    method: 'post',
    data: data
  })
}

// 修改乘客表
export function updatePassenger(data) {
  return request({
    url: '/biz/passenger',
    method: 'put',
    data: data
  })
}

// 删除乘客表
export function delPassenger(passengerId) {
  return request({
    url: '/biz/passenger/' + passengerId,
    method: 'delete'
  })
}
