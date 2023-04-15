import request from '@/utils/request'
import querystring from 'querystring'

//查询数据分页列表
export function getListPage (params) {
  let queryString = querystring.stringify(params);
  return request({
    url: '/common/tdemo/listPage?'+queryString,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}

//根据id查询
export function getTdemoById (id) {
  return request({
    url: '/common/tdemo/queryById/'+id,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}
  
//保存或更新数据
export function saveOrUpdate (params) {
  let url = '/common/tdemo';
  let method = 'post';
  if(params.id!=''&&params.id!=undefined){
    method = 'put';
  }
  return request({
    url: url,
    method: method,
    data: params
  })
}

//保存或更新数据
export function updateBatch (params) {
  let url = '/common/tdemo/batch-update';
  return request({
    url: url,
    method: 'put',
    data: params
  })
}

//保存或更新数据
export function saveBatch (params) {
  let url = '/common/tdemo/batch';
  return request({
    url: url,
    method: 'post',
    data: params
  })
}

//删除数据
export function delData (ids) {
  return request({
    url: '/common/tdemo/'+ids,
    method: 'delete',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
    }
  })
}

//更新状态
export function updateStatus(id,status) {
  return request({
    url: '/common/tdemo/updateStatus',
    method: 'post',
    data: {
      id,
      status
    }
  })
}

//查询字典列表
export async function findList (params) {
  let queryString = querystring.stringify(params);
  return await request({
    url: '/common/tdemo/list?'+queryString,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}




