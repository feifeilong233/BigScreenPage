import request from '@/utils/request'
import querystring from 'querystring'

//查询表列表
export function getTableListPage (params) {
  console.log(params)
  return request({
    url: '/system/gencode/tableListPage',
    method: 'post',
    data: params
  })
}

//执行表的保存
export function save (params) {
  return request({
    url: '/system/gencode/save',
    method: 'post',
    data: params
  })
}

//查询分页列表
export function getListPage (params) {
  let queryString = querystring.stringify(params);
  return request({
    url: '/system/gencode/listPage?'+queryString,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}
  
//查询详情
export function findInfo (id) {
  return request({
    url: '/system/gencode/findInfo?id='+id,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}

//更新
export function update (params) {
  return request({
    url: '/system/gencode/update',
    method: 'post',
    data: params
  })
}

//执行删除
export function delData (ids) {
  return request({
    url: '/system/gencode/'+ids,
    method: 'delete',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}

//代码生成gencode
export function gencode(id) {
  return request({
    url: '/system/gencode/gencode?id='+id,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}

//预览代码
export function getViewCode(id) {
  return request({
    url: '/system/gencode/viewCode?id='+id,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}



