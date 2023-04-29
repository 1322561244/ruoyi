import request from '@/utils/request'

// 查询车辆管理列表
export function listVehicles(query) {
  return request({
    url: '/biz/vehicles/list',
    method: 'get',
    params: query
  })
}

// 查询车辆管理详细
export function getVehicles(vehiclesId) {
  return request({
    url: '/biz/vehicles/' + vehiclesId,
    method: 'get'
  })
}

// 新增车辆管理
export function addVehicles(data) {
  return request({
    url: '/biz/vehicles',
    method: 'post',
    data: data
  })
}

// 修改车辆管理
export function updateVehicles(data) {
  return request({
    url: '/biz/vehicles',
    method: 'put',
    data: data
  })
}

// 删除车辆管理
export function delVehicles(vehiclesId) {
  return request({
    url: '/biz/vehicles/' + vehiclesId,
    method: 'delete'
  })
}
