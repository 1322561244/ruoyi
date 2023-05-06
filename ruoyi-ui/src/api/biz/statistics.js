import request from '@/utils/request'

// 查询搭乘统计列表
export function listStatistics(query) {
  return request({
    url: '/biz/statistics/list',
    method: 'get',
    params: query
  })
}

// 查询搭乘统计详细
export function getStatistics(shiftsName) {
  return request({
    url: '/biz/statistics/' + shiftsName,
    method: 'get'
  })
}

// 新增搭乘统计
export function addStatistics(data) {
  return request({
    url: '/biz/statistics',
    method: 'post',
    data: data
  })
}

// 修改搭乘统计
export function updateStatistics(data) {
  return request({
    url: '/biz/statistics',
    method: 'put',
    data: data
  })
}

// 删除搭乘统计
export function delStatistics(shiftsName) {
  return request({
    url: '/biz/statistics/' + shiftsName,
    method: 'delete'
  })
}
