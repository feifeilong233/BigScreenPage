package com.qingfeng.common.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingfeng.common.entity.RoadFlatness;
import com.qingfeng.common.mapper.RoadFlatnessMapper;
import com.qingfeng.common.service.IRoadFlatnessService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class RoadFlatnessServiceImpl extends ServiceImpl<RoadFlatnessMapper, RoadFlatness> implements IRoadFlatnessService {

}
