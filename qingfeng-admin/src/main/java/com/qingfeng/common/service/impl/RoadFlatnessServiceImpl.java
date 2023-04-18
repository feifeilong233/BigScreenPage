package com.qingfeng.common.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingfeng.common.entity.RoadStructure;
import com.qingfeng.common.mapper.RoadStuctureMapper;
import com.qingfeng.common.service.IRoadStructureService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class RoadStuctureServiceImpl extends ServiceImpl<RoadStuctureMapper,RoadStructure> implements IRoadStructureService {

}
