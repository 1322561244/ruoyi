import request from '@/utils/request'
import axios from "axios";

// 查询车长管理列表
export function listLeader(query) {
  return request({
    url: '/biz/leader/list',
    method: 'get',
    params: query
  })
}

// 查询车长管理详细
export function getLeader(leaderId) {
  return request({
    url: '/biz/leader/' + leaderId,
    method: 'get'
  })
}

// 新增车长管理
export function addLeader(data) {
  return request({
    url: '/biz/leader',
    method: 'post',
    data: data
  })
}

// 修改车长管理
export function updateLeader(data) {
  return request({
    url: '/biz/leader',
    method: 'put',
    data: data
  })
}

// 删除车长管理
export function delLeader(leaderId) {
  return request({
    url: '/biz/leader/' + leaderId,
    method: 'delete'
  })
}


export function enterpriseList(data){
  return axios.request({
    url: '/biz/leader/enterpriseList',
    method: 'get',
    data:JSON.stringify(data)
  })
}

// export function enterpriseList(params) {
//   return axios.get('/biz/enterpriseList', { params })
// }
