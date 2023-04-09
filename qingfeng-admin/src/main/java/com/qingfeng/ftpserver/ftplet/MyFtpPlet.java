package com.qingfeng.ftpserver.ftplet;

import org.apache.ftpserver.ftplet.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;

/**
 * @ProjectName MyFtpPlet
 * @author qingfeng
 * @version 1.0.0
 * @Description MyFtpPlet
 * @createTime 2022/4/21 0021 23:24
 */
public class MyFtpPlet extends DefaultFtplet {

	private static final Logger logger = LoggerFactory.getLogger(MyFtpPlet.class);
	
	@Override
	public FtpletResult onLogin(FtpSession session, FtpRequest request) throws FtpException, IOException {
		// 获取上传文件的上传路径
		String path = session.getUser().getHomeDirectory();
		// 获取上传用户
		String name = session.getUser().getName();
		//校验文件夹路径是否存在
		viladateDir(path);
		
		logger.info("用户:'{}'登录成功, 目录地址: '{}'", name, path);
		System.out.println("用户:'" + name + "'登录成功, 目录地址：'" + path + "'");

		/**
		 * 二次验证 第一次验证是通过账号和密码进行验证的。
		 * 权限验证、有没有某个文件夹的权限。
		 * /home/  A模块  B模块
		 *
		 * 判断用户是否有对模块的上传权限，如果都没有，禁止登录。
		 *
		 * ---------------多目录如何指定-----------------
		 * 一般部署到linux服务器，采用目录挂载的模式进行授权。
		 * /home    mount /home /usr/www/A
		 *
		 */
		session.write(new DefaultFtpReply(550, "没有目录权限，禁止登录!"));

		return super.onLogin(session, request);
	}

	@Override
	public FtpletResult onUploadStart(FtpSession session, FtpRequest request) throws FtpException, IOException {
		// 获取上传文件的上传路径
		String path = session.getUser().getHomeDirectory();
		//校验文件夹路径是否存在
		viladateDir(path);
		
		// 获取上传用户
		String name = session.getUser().getName();
		// 获取上传文件名
		String filename = request.getArgument();
		logger.info("用户:'{}'，上传文件到目录：'{}'，文件名称为：'{}，状态：开始上传~'", name, path, filename);
		System.out.println("用户:'" + name + "'，上传文件到目录：'" + path + "'，文件名称为：'" + filename + "'，状态：开始上传~");
		session.write(new DefaultFtpReply(550, "附件格式不正确!"));
		return super.onUploadStart(session, request);
	}

	@Override
	public FtpletResult onUploadEnd(FtpSession session, FtpRequest request) throws FtpException, IOException {
		// 获取上传文件的上传路径
		String path = session.getUser().getHomeDirectory();
		// 获取上传用户
		String name = session.getUser().getName();
		// 获取上传文件名
		String filename = request.getArgument();
		logger.info("用户:'{}'，上传文件到目录：'{}'，文件名称为：'{}，状态：成功！'", name, path, filename);
		System.out.println("用户:'" + name + "'，上传文件到目录：'" + path + "'，文件名称为：'" + filename + "'，状态：成功！'");
		return super.onUploadEnd(session, request);
	}

	@Override
	public FtpletResult onDownloadStart(FtpSession session, FtpRequest request) throws FtpException, IOException {
		// todo servies...
		return super.onDownloadStart(session, request);
	}

	@Override
	public FtpletResult onDownloadEnd(FtpSession session, FtpRequest request) throws FtpException, IOException {
		// todo servies...
		return super.onDownloadEnd(session, request);
	}
	
	
	//判断文件夹是否存在，不存在则创建文件夹
	public void viladateDir(String path) {
		File file = new File(path);

		// 如果文件夹不存在则创建
		if (!file.exists() && !file.isDirectory()){
			System.out.println("文件夹不存在，创建新的文件夹");
			file.mkdir();
		}
	}

}