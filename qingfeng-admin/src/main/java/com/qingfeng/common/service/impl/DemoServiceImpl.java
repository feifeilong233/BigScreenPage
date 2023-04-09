package com.qingfeng.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingfeng.base.entity.QueryRequest;
import com.qingfeng.common.entity.Demo;
import com.qingfeng.common.mapper.DemoMapper;
import com.qingfeng.common.service.IDemoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ProjectName DemoServiceImpl
 * @author Administrator
 * @version 1.0.0
 * @Description DemoServiceImpl接口
 * @createTime 2022/1/19 0019 22:55
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class DemoServiceImpl extends ServiceImpl<DemoMapper, Demo> implements IDemoService {


    /**
     * @ProjectName DemoServiceImpl
     * @author Administrator
     * @version 1.0.0
     * @Description 查询数据分页列表
     * @createTime 2022/1/19 0019 22:55
     */
    public IPage<Demo> findListPage(Demo demo, QueryRequest request){
        Page<Demo> page = new Page<>(request.getPageNum(), request.getPageSize());
        return this.baseMapper.findListPage(page, demo);
    }

    /**
     * @ProjectName DemoServiceImpl
     * @author Administrator
     * @version 1.0.0
     * @Description 查询数据列表
     * @createTime 2022/1/19 0019 22:55
     */
    public List<Demo> findList(Demo demo){
        return this.baseMapper.findList(demo);
    }


}