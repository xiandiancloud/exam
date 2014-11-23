package com.dhl.bean;


/**
 * 分析用户数据的时候交换数据的类
 * @author dhl
 */
public class UserQuestionData {

	private String useranswer;
	private String pfscore;
	private String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
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
