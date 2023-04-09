package com.qingfeng.ftpserver.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "ftp")
public class YmlProperties {
	private String homedirectory;
	private String ftpport;
	private String passiveports;
	private String maxlogins;
	private String adminname;
	private String sqluseradmin;
	private String sqluserinsert;
	private String sqluserdelete;
	private String sqluserupdate;
	private String sqluserselect;
	private String sqluserselectall;
	private String sqluserauthenticate;

	public String getHomedirectory() {
		return homedirectory;
	}

	public void setHomedirectory(String homedirectory) {
		this.homedirectory = homedirectory;
	}

	public String getFtpport() {
		return ftpport;
	}

	public void setFtpport(String ftpport) {
		this.ftpport = ftpport;
	}

	public String getPassiveports() {
		return passiveports;
	}

	public void setPassiveports(String passiveports) {
		this.passiveports = passiveports;
	}

	public String getMaxlogins() {
		return maxlogins;
	}

	public void setMaxlogins(String maxlogins) {
		this.maxlogins = maxlogins;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getSqluseradmin() {
		return sqluseradmin;
	}

	public void setSqluseradmin(String sqluseradmin) {
		this.sqluseradmin = sqluseradmin;
	}

	public String getSqluserinsert() {
		return sqluserinsert;
	}

	public void setSqluserinsert(String sqluserinsert) {
		this.sqluserinsert = sqluserinsert;
	}

	public String getSqluserdelete() {
		return sqluserdelete;
	}

	public void setSqluserdelete(String sqluserdelete) {
		this.sqluserdelete = sqluserdelete;
	}

	public String getSqluserupdate() {
		return sqluserupdate;
	}

	public void setSqluserupdate(String sqluserupdate) {
		this.sqluserupdate = sqluserupdate;
	}

	public String getSqluserselect() {
		return sqluserselect;
	}

	public void setSqluserselect(String sqluserselect) {
		this.sqluserselect = sqluserselect;
	}

	public String getSqluserselectall() {
		return sqluserselectall;
	}

	public void setSqluserselectall(String sqluserselectall) {
		this.sqluserselectall = sqluserselectall;
	}

	public String getSqluserauthenticate() {
		return sqluserauthenticate;
	}

	public void setSqluserauthenticate(String sqluserauthenticate) {
		this.sqluserauthenticate = sqluserauthenticate;
	}

}