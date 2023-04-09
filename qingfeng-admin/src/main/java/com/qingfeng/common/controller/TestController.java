package com.qingfeng.common.controller;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.qingfeng.base.controller.BaseController;
import com.qingfeng.base.entity.QueryRequest;
import com.qingfeng.common.entity.Demo;
import com.qingfeng.common.service.IDemoService;
import com.qingfeng.common.service.ITestService;
import com.qingfeng.framework.exception.BizException;
import com.qingfeng.system.entity.UserOrganize;
import com.qingfeng.system.service.IUserOrganizeService;
import com.qingfeng.system.service.IUserService;
import com.qingfeng.utils.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.retry.support.RetryTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName DemoController
 * @author Administrator
 * @version 1.0.0
 * @Description 测试案例
 * @createTime 2022/1/19 0019 22:52
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/common/test")
public class TestController extends BaseController {

    @Autowired
    private ITestService testService;
    @Autowired
    private RetryTemplate retryTemplate;


    @GetMapping("/t1")
    public MyResponse t1(HttpServletRequest request) throws IOException  {
        PageData pd = new PageData(request);
        System.out.println(pd.toString());
        System.out.println("--------测试t1-----------");
        return new MyResponse().data(null);
    }


    @GetMapping("/retryTest")
    public String retryTest(@RequestParam int num) throws Exception {
        int retrynum = testService.getRetryNum(num);
        log.info("剩余数量===" + retrynum);
        return "success";
    }


    @GetMapping("/retryTemplateTest")
    public Object retryTemplateTest(@RequestParam int num) throws Exception {
        try {
            Object result = retryTemplate.execute(arg -> testService.getRetryTemplateNum(num));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
