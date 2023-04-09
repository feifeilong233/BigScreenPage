package com.qingfeng.common.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qingfeng.base.entity.QueryRequest;
import com.qingfeng.common.entity.Demo;

import java.util.List;

/**
 * @ProjectName IDemoService
 * @author Administrator
 * @version 1.0.0
 * @Description IDemoService接口
 * @createTime 2022/1/19 0019 22:55
 */
public interface IDemoService extends IService<Demo> {

    //查询数据分页列表
    IPage<Demo> findListPage(Demo demo, QueryRequest request);

    //查询数据列表
    List<Demo> findList(Demo demo);

}