import request from '@/utils/request'

// 查询企业管理列表
export function listEnterprise(query) {
  return request({
    url: '/biz/enterprise/list',
    method: 'get',
    params: query
  })
}

// 查询企业管理详细
export function getEnterprise(enterpriseId) {
  return request({
    url: '/biz/enterprise/' + enterpriseId,
    method: 'get'
  })
}

// 新增企业管理
export function addEnterprise(data) {
  return request({
    url: '/biz/enterprise',
    method: 'post',
    data: data
  })
}

// 修改企业管理
export function updateEnterprise(data) {
  return request({
    url: '/biz/enterprise',
    method: 'put',
    data: data
  })
}

// 删除企业管理
export function delEnterprise(enterpriseId) {
  return request({
    url: '/biz/enterprise/' + enterpriseId,
    method: 'delete'
  })
}
