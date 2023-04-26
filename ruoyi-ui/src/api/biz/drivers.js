import request from '@/utils/request'

// 查询司机管理列表
export function listDrivers(query) {
  return request({
    url: '/biz/drivers/list',
    method: 'get',
    params: query
  })
}

// 查询司机管理详细
export function getDrivers(driversId) {
  return request({
    url: '/biz/drivers/' + driversId,
    method: 'get'
  })
}

// 新增司机管理
export function addDrivers(data) {
  return request({
    url: '/biz/drivers',
    method: 'post',
    data: data
  })
}

// 修改司机管理
export function updateDrivers(data) {
  return request({
    url: '/biz/drivers',
    method: 'put',
    data: data
  })
}

// 删除司机管理
export function delDrivers(driversId) {
  return request({
    url: '/biz/drivers/' + driversId,
    method: 'delete'
  })
}
