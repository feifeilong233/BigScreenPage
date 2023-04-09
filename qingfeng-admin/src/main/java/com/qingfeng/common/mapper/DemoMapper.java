package com.qingfeng.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingfeng.common.entity.Demo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ProjectName DemoMapper
 * @author Administrator
 * @version 1.0.0
 * @Description DemoMapper
 * @createTime 2022/1/19 0019 22:54
 */
public interface DemoMapper extends BaseMapper<Demo> {

    //查询数据分页列表
    IPage<Demo> findListPage(Page page, @Param("obj") Demo demo);

    //查询数据列表
    List<Demo> findList(Demo demo);

}