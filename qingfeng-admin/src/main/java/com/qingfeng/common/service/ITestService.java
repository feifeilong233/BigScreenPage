package com.qingfeng.common.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qingfeng.base.entity.QueryRequest;
import com.qingfeng.common.entity.Demo;

import java.util.List;

public interface ITestService {

    public int getRetryNum(int num) throws Exception;

    public int getRetryTemplateNum(int num) throws Exception;

}