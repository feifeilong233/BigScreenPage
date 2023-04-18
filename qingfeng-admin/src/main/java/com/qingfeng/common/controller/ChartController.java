package com.qingfeng.common.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.qingfeng.base.controller.BaseController;
import com.qingfeng.common.entity.RoadStructure;
import com.qingfeng.common.service.IRoadStructureService;
import com.qingfeng.utils.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Administrator
 * @version 1.0.0
 * @ProjectName ChartController
 * @Description 图表
 * @createTime 2023/4/19 0019 22:52
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/chart/workplace")
public class ChartController extends BaseController {
    @Autowired
    IRoadStructureService roadStructureService;

    @GetMapping("/queryByPid/{id}")
    public MyResponse queryById(@PathVariable String id) {
        List<RoadStructure> dataTable = roadStructureService.list(Wrappers.lambdaQuery(RoadStructure.class).eq(RoadStructure::getPid, id));
        return new MyResponse().data(dataTable);
    }

    @GetMapping("/queryByParentName/{name}")
    public MyResponse queryByParentName(@PathVariable String name) {
        List<RoadStructure> dataTable = roadStructureService.list(Wrappers.lambdaQuery(RoadStructure.class).eq(RoadStructure::getPid_name, name));
        return new MyResponse().data(dataTable);
    }

    @GetMapping("/getList")
    public MyResponse getList() {
        List<RoadStructure> dataTable = roadStructureService.list();
        return new MyResponse().data(dataTable);
    }
}
