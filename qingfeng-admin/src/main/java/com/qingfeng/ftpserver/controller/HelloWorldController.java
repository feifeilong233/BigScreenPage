package com.qingfeng.ftpserver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ProjectName HelloWorldController
 * @author qingfeng
 * @version 1.0.0
 * @Description HelloWorldController
 * @createTime 2022/4/21 0021 23:25
 */
@RestController
public class HelloWorldController {

	@Autowired
	private Environment env;

	@RequestMapping("/getFooProperties")
	public void getFooProperties() {
		System.out.println(env.getProperty("ftp.homedirectory"));
	}
}