package com.dhl.domain;

/**
 * @author dhl
 * 返回结果
 */
public class RestShell {

	private String result;
	private String condition;
	
	private String ip;
	private String userName;
	private String passWord;
	private String path;//controller脚本存放路径
	private String shellparameter;//脚本参数
	public String getShellparameter() {
		return shellparameter;
	}
	public void setShellparameter(String shellparameter) {
		this.shellparameter = shellparameter;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
}
