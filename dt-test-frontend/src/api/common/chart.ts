import request from '@/utils/request'

//根据pid查询
export function queryRoadStructureByPid (id) {
    return request({
        url: '/chart/workplace/queryByPid/'+id,
        method: 'get',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8',
        }
    })
}

export function queryRoadStructureByParentName (name) {
    return request({
        url: '/chart/workplace/queryByParentName/'+name,
        method: 'get',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8',
        }
    })
}

//查询数据列表
export function getRoadStructureList () {
    return request({
        url: '/chart/workplace/getList',
        method: 'get',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8',
        }
    })
}
