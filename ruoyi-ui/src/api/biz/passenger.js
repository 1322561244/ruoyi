import request from '@/utils/request'

// 查询乘客管理列表
export function listPassenger(query) {
  return request({
    url: '/biz/passenger/list',
    method: 'get',
    params: query
  })
}

// 查询乘客管理详细
export function getPassenger(passengerId) {
  return request({
    url: '/biz/passenger/' + passengerId,
    method: 'get'
  })
}

// 新增乘客管理
export function addPassenger(data) {
  return request({
    url: '/biz/passenger',
    method: 'post',
    data: data
  })
}

// 修改乘客管理
export function updatePassenger(data) {
  return request({
    url: '/biz/passenger',
    method: 'put',
    data: data
  })
}

// 删除乘客管理
export function delPassenger(passengerId) {
  return request({
    url: '/biz/passenger/' + passengerId,
    method: 'delete'
  })
}

// 查询乘客管理详细
export function getPassenger2(passengerId) {
  return request({
    url: '/biz/passenger/2' + passengerId,
    method: 'get'
  })
}
