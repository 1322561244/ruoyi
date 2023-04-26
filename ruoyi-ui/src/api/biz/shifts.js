import request from '@/utils/request'

// 查询班次管理列表
export function listShifts(query) {
  return request({
    url: '/biz/shifts/list',
    method: 'get',
    params: query
  })
}

// 查询班次管理详细
export function getShifts(shiftsId) {
  return request({
    url: '/biz/shifts/' + shiftsId,
    method: 'get'
  })
}

// 新增班次管理
export function addShifts(data) {
  return request({
    url: '/biz/shifts',
    method: 'post',
    data: data
  })
}

// 修改班次管理
export function updateShifts(data) {
  return request({
    url: '/biz/shifts',
    method: 'put',
    data: data
  })
}

// 删除班次管理
export function delShifts(shiftsId) {
  return request({
    url: '/biz/shifts/' + shiftsId,
    method: 'delete'
  })
}
