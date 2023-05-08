import request from "@/utils/request";

// 查询部门列表
export function listDept(query) {
  return request({
    url: "/system/dept/list",
    method: "get",
    params: query,
  });
}

// 根据企业Id查询部门列表
export function listDept_enterpriseId(enterpriseId) {
  return request({
    url: "/system/dept/listEnterpriseId",
    method: "get",
  });
}

// 查询部门列表（排除节点）
export function listDeptExcludeChild(deptId) {
  return request({
    url: "/system/dept/list/exclude/" + deptId,
    method: "get",
  });
}

// 查询部门详细
export function getDept(deptId) {
  return request({
    url: "/system/dept/" + deptId,
    method: "get",
  });
}

// 新增部门
export function addDept(data) {
  return request({
    url: "/system/dept",
    method: "post",
    data: data,
  });
}

// 修改部门
export function updateDept(data) {
  return request({
    url: "/system/dept",
    method: "put",
    data: data,
  });
}

// 删除部门
export function delDept(deptId) {
  return request({
    url: "/system/dept/" + deptId,
    method: "delete",
  });
}

//根据所属部门查找部门id和部门名
export function selectDept(enterpriseId) {
  return request({
    url: "/system/dept/eid/" + enterpriseId,
    method: "get",
  });
}

//根据所属部门查找部门id和部门名
export function selectDept2(enterpriseId, query) {
  return request({
    url: "/system/dept/eid2/" + enterpriseId,
    method: "get",
    params: query,
  });
}
