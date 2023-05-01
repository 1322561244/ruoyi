import request from '@/utils/request'

// 查询预约管理列表
export function listReservation(query) {
  return request({
    url: '/biz/reservation/list',
    method: 'get',
    params: query
  })
}

// 查询预约管理详细
export function getReservation(reservationId) {
  return request({
    url: '/biz/reservation/' + reservationId,
    method: 'get'
  })
}

// 新增预约管理
export function addReservation(data) {
  return request({
    url: '/biz/reservation',
    method: 'post',
    data: data
  })
}

// 修改预约管理
export function updateReservation(data) {
  return request({
    url: '/biz/reservation',
    method: 'put',
    data: data
  })
}

// 删除预约管理
export function delReservation(reservationId) {
  return request({
    url: '/biz/reservation/' + reservationId,
    method: 'delete'
  })
}


// 查询预约管理详细
export function getReservation2(reservationId) {
  return request({
    url: '/biz/reservation/2' + reservationId,
    method: 'get'
  })
}
