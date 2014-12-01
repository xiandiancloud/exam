package com.dhl.bean;


/**
 * 分析用户数据的时候交换数据的类
 * @author dhl
 */
public class UserQuestionData {

	private String useranswer;
	private String pfscore;
	private String revalue;//返回结果
	public String getRevalue() {
		return revalue;
	}
	public void setRevalue(String revalue) {
		this.revalue = revalue;
	}
	public String getUseranswer() {
		return useranswer;
	}
	public void setUseranswer(String useranswer) {
		this.useranswer = useranswer;
	}
	public String getPfscore() {
		return pfscore;
	}
	public void setPfscore(String pfscore) {
		this.pfscore = pfscore;
	}
}
