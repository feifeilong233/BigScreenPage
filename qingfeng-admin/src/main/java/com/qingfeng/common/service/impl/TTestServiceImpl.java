package com.qingfeng.common.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingfeng.base.entity.QueryRequest;
import com.qingfeng.common.entity.Tdemo;
import com.qingfeng.common.mapper.TdemoMapper;
import com.qingfeng.common.service.ITdemoService;
import com.qingfeng.common.service.ITestService;
import com.qingfeng.utils.DateTimeUtil;
import com.qingfeng.utils.PageData;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Recover;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ProjectName TdemoServiceImpl
 * @author Administrator
 * @version 1.0.0
 * @Description TdemoServiceImpl接口
 * @createTime 2022/1/19 0019 22:55
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class TTestServiceImpl implements ITestService {


    private final static int TOTAL_NUM = 100000;

    @Retryable(value = Exception.class, maxAttempts = 3, backoff = @Backoff(delay = 5000L, multiplier = 2))
    public int getRetryNum(int num) throws Exception {
        System.out.println("getRemainingAmount======" + DateTimeUtil.getDateTimeStr());
        if (num <= 0) {
            throw new Exception("数量不对");
        }
        System.out.println("getRemainingAmount======执行结束");
        return TOTAL_NUM - num;
    }



    @Recover
    public int recover(Exception e) {
        // 回调方法,业务逻辑处理
        System.out.println("执行了回调方法");
        return -1;
    }


    public int getRetryTemplateNum(int num) throws Exception {
        System.out.println("getRemainingAmount======" + DateTimeUtil.getDateTimeStr());
        if (num <= 0) {
            throw new Exception("数量不对");
        }
        System.out.println("getRemainingAmount======执行结束");
        return TOTAL_NUM - num;
    }


}