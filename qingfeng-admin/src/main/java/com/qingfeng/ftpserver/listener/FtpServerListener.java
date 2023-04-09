package com.qingfeng.ftpserver.listener;

import com.qingfeng.ftpserver.mysqldatasource.MyFtpServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * @ProjectName FtpServerListener
 * @author qingfeng
 * @version 1.0.0
 * @Description FtpServerListener
 * @createTime 2022/4/21 0021 23:24
 */
@WebListener
public class FtpServerListener implements ServletContextListener {

    private static final Logger logger = LoggerFactory.getLogger(MyFtpServer.class);
    private static final String SERVER_NAME="FTP-SERVER";

    @Autowired
    private MyFtpServer server;


    //容器初始化调用方法start ftpServer
    public void contextInitialized(ServletContextEvent sce) {
        WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext())
                .getAutowireCapableBeanFactory().autowireBean(this);//必须添加的代码

        sce.getServletContext().setAttribute(SERVER_NAME,server);
        try {
            System.out.println("===================111===================");
            System.out.println(server);
            //项目启动时已经加载好了
            server.start();
            System.out.println("Apache Ftp server is started!");
            logger.info("Apache Ftp server is started!");
        } catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("Apache Ftp server start failed!", e);
        }
    }

    //容器关闭时调用方法stop ftpServer
    public void contextDestroyed(ServletContextEvent sce) {
        server.stop();
        sce.getServletContext().removeAttribute(SERVER_NAME);
        logger.info("Apache Ftp server is stoped!");
        System.out.println("Apache Ftp server is stoped!");
    }

}