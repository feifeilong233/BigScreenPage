package com.qingfeng.ftpserver.mysqldatasource;

import com.qingfeng.ftpserver.config.YmlProperties;
import com.qingfeng.ftpserver.ftplet.MyFtpPlet;
import org.apache.ftpserver.ConnectionConfigFactory;
import org.apache.ftpserver.DataConnectionConfigurationFactory;
import org.apache.ftpserver.FtpServer;
import org.apache.ftpserver.FtpServerFactory;
import org.apache.ftpserver.ftplet.FtpException;
import org.apache.ftpserver.ftplet.Ftplet;
import org.apache.ftpserver.listener.ListenerFactory;
import org.apache.ftpserver.usermanager.ClearTextPasswordEncryptor;
import org.apache.ftpserver.usermanager.DbUserManagerFactory;
import org.apache.ftpserver.usermanager.Md5PasswordEncryptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @ProjectName MyFtpServer
 * @author qingfeng
 * @version 1.0.0
 * @Description
 * 注意：被@Configuration标记的类会被加入ioc容器中，而且类中所有带 @Bean注解的方法都会被动态代理，因此调用该方法返回的都是同一个实例。
 * ftp服务访问地址：
 * ftp://localhost:2121/
 * @createTime 2022/4/21 0021 23:21
 */
@Configuration("MyFtp")
public class MyFtpServer {

	private static final Logger logger = LoggerFactory.getLogger(MyFtpServer.class);

	// springboot配置好数据源直接注入即可
	private DataSource dataSource;
	
	private YmlProperties yml;

	protected FtpServer server;

	// 我们这里利用spring加载@Configuration的特性来完成ftp server的初始化
	public MyFtpServer(DataSource dataSource, YmlProperties yml) {
		this.dataSource = dataSource;
		this.yml = yml;
		initFtp();
		logger.info("Apache ftp server is already instantiation complete!");
		System.out.println("Apache ftp server is already instantiation complete!");
	}

	/**
	 * ftp server init
	 * @throws IOException
	 */
	public void initFtp() {
		FtpServerFactory serverFactory = new FtpServerFactory();
		ListenerFactory listenerFactory = new ListenerFactory();
		// 1、设置服务端口
		listenerFactory.setPort(new Integer(this.yml.getFtpport()));
		
		// 2、设置被动模式数据上传的接口范围,云服务器需要开放对应区间的端口给客户端
		DataConnectionConfigurationFactory dataConnectionConfFactory = new DataConnectionConfigurationFactory();
		dataConnectionConfFactory.setPassivePorts(this.yml.getPassiveports());
		listenerFactory.setDataConnectionConfiguration(dataConnectionConfFactory.createDataConnectionConfiguration());
		
		// 3、增加SSL安全配置
		/*
		SslConfigurationFactory ssl = new SslConfigurationFactory();
		ssl.setKeystoreFile(new File("src/main/resources/ftpserver.jks"));
		ssl.setKeystorePassword("password");
		ssl.setSslProtocol("SSL");
		//set the SSL configuration for the listener
		listenerFactory.setSslConfiguration(ssl.createSslConfiguration());
		listenerFactory.setImplicitSsl(true);
		*/
		
		//替换默认的监听器
		serverFactory.addListener("default", listenerFactory.createListener());
		
		// 4、设置最大连接数
		ConnectionConfigFactory connectionConfigFactory = new ConnectionConfigFactory();
		connectionConfigFactory.setMaxLogins(new Integer(this.yml.getMaxlogins()));
		serverFactory.setConnectionConfig(connectionConfigFactory.createConnectionConfig());
		
		// 5、配置自定义用户事件
		Map<String, Ftplet> ftpLets = new HashMap<String, Ftplet>();
		ftpLets.put("ftpService", new MyFtpPlet());
		serverFactory.setFtplets(ftpLets);
		
		// 6、读取用户的配置信息
		// 注意：配置文件位于resources目录下，如果项目使用内置容器打成jar包发布，FTPServer无法直接直接读取Jar包中的配置文件。
		// 解决办法：将文件复制到指定目录(本文指定到根目录)下然后FTPServer才能读取到。
		/*
		PropertiesUserManagerFactory userManagerFactory = new PropertiesUserManagerFactory();
		String tempPath = System.getProperty("java.io.tmpdir") + System.currentTimeMillis() + ".properties";
		File tempConfig = new File(tempPath);
		ClassPathResource resource = new ClassPathResource("users.properties");
		IOUtils.copy(resource.getInputStream(), new FileOutputStream(tempConfig));
		userManagerFactory.setFile(tempConfig);
		userManagerFactory.setPasswordEncryptor(new ClearTextPasswordEncryptor());  //密码以明文的方式
		serverFactory.setUserManager(userManagerFactory.createUserManager());
		*/
		
		// 6.2、基于数据库来存储用户实例
		DbUserManagerFactory dbUserManagerFactory = new DbUserManagerFactory();
		// todo....
		System.out.println("======================================");
		System.out.println(this.yml.getAdminname());
		dbUserManagerFactory.setDataSource(dataSource);
		dbUserManagerFactory.setAdminName(this.yml.getAdminname());
		dbUserManagerFactory.setSqlUserAdmin(this.yml.getSqluseradmin());
		dbUserManagerFactory.setSqlUserInsert(this.yml.getSqluserinsert());
		dbUserManagerFactory.setSqlUserDelete(this.yml.getSqluserdelete());
		dbUserManagerFactory.setSqlUserUpdate(this.yml.getSqluserupdate());
		dbUserManagerFactory.setSqlUserSelect(this.yml.getSqluserselect());
		dbUserManagerFactory.setSqlUserSelectAll(this.yml.getSqluserselectall());
		dbUserManagerFactory.setSqlUserAuthenticate(this.yml.getSqluserauthenticate());
		dbUserManagerFactory.setPasswordEncryptor(new Md5PasswordEncryptor());  //密码以明文的方式
		serverFactory.setUserManager(dbUserManagerFactory.createUserManager());
		
		// 7、实例化FTP Server
		server = serverFactory.createServer();
	}

	/**
	 * ftp server start
	 */
	public void start() {
		try {
			server.start();
			logger.info("Apache Ftp server is starting!");
		} catch (FtpException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ftp server stop
	 */
	public void stop() {
		server.stop();
		logger.info("Apache Ftp server is stoping!");
	}

}