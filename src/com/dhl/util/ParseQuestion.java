package com.dhl.util;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.dhl.domain.QuestionData;
public class ParseQuestion {
	public static List<Element> getChildNode(Element element){
		List<Element> childList = element.elements();
		return childList;
	}
	
	public static List<QuestionData> changetohtml(String xml,int id)
	{
		try
		{
		String html="";
		String regEx="</br>"; 
        Pattern pat=Pattern.compile(regEx);  
        Matcher mat=pat.matcher(xml);  
        String s=mat.replaceAll("\r"); 
		Document doc = DocumentHelper.parseText(s);
		Element root = doc.getRootElement();
		String parent_name=root.getName();
		List<Element> list=getChildNode(root);
		List<QuestionData> problem_list = new ArrayList();
		QuestionData qd = new QuestionData(id);
		String problem_html=parse_html(list,html,parent_name,problem_list,qd,null,null,id);
		//for(QuestionData str:problem_list){System.out.println(str);}
		return problem_list;
		}
		catch(Exception e)
		{
			return null;
		}
	}
		public static Map<String,String> getNodeAttrName(Element element){
			int n=element.attributeCount();
			Map<String,String> attrname=new HashMap<String,String>();
			for(int i=0;i<n;i++){
				String name=element.attribute(i).getName();
				attrname.put(name, element.attributeValue(name));
			}
			return attrname;
		}
		
	/**
	 * @param args
	 */
		private static String parse_html(List<Element> list,String html,String parent_name,List<QuestionData>problem_list,QuestionData qd,List<String> content,List<String> answer,int id){
			
			int len=list.size();
			if(len>0){
				for(int i=0;i<len;i++){
					List<Element> list_new=getChildNode(list.get(i));
					String name=list.get(i).getName();
					String value=list.get(i).getText();
					if (name=="p"&&parent_name=="problem"){
						String title_value=value;
						for(int j=i+1;j<len;j++){
							if (list.get(j).getName()=="p"){
								title_value+='\r'+list.get(j).getText();
							}
							else {
								i=j-1;
								break;
							}
						}
						qd.setTitle(title_value);
					}
					else if(name=="p"&&parent_name!="problem"){
						String title_value=value;
						qd.setExplain(title_value);
					}
					else if((name=="stringresponse"&&i==len-1)||(name=="stringresponse"&&i<len-1&&list.get(i+1).getName()!="solution")){
						Map<String,String> attr=getNodeAttrName(list.get(i));
						String attrname=attr.get("answer");
						List<String> answe=new ArrayList();
						answe.add(attrname);
						qd.setAnswer(answe);
						qd.setType(4);
						problem_list.add(qd);
						qd = new QuestionData(id);
					}
					else if(name=="stringresponse"&&i!=len-1){
						Map<String,String> attr=getNodeAttrName(list.get(i));
						String attrname=attr.get("answer");
						List<String> answe=new ArrayList();
						answe.add(attrname);
						qd.setAnswer(answe);
						qd.setType(4);
					}
					else if((name=="textareainput"&&i==len-1)||(name=="textareainput"&&i<len-1&&list.get(i+1).getName()!="solution")){
						List<String> answe=new ArrayList();
						html=parse_html(list_new,html,name,problem_list,qd,null,answe,id);
						qd.setType(5);
						qd.setAnswer(answe);
						problem_list.add(qd);
						qd = new QuestionData(id);
					}
					else if(name=="textareainput"&&i!=len-1){
						List<String> answe=new ArrayList();
						html=parse_html(list_new,html,name,problem_list,qd,null,answe,id);
						qd.setType(5);
						qd.setAnswer(answe);
//						problem_list.add(qd);
					}
					else if(name=="areainput"){
						Map<String,String> attr=getNodeAttrName(list.get(i));
						String attrname=attr.get("answer");
						System.out.println(attrname);
						answer.add(attrname);
					}
					else if(((name=="choiceresponse"||name=="multiplechoiceresponse")&&i==len-1)||((name=="choiceresponse"||name=="multiplechoiceresponse")&&i<len-1&&list.get(i+1).getName()!="solution")){
						html=parse_html(list_new,html,name,problem_list,qd,null,null,id);
						if(name=="multiplechoiceresponse"){
							qd.setType(2);
						}
						if(name=="choiceresponse"){
							qd.setType(3);
						}
						problem_list.add(qd);
						qd = new QuestionData(id);
						html="";
					}
					else if((name=="choiceresponse"||name=="multiplechoiceresponse")&&i!=len-1){
						html=parse_html(list_new,html,name,problem_list,qd,null,null,id);
						if(name=="multiplechoiceresponse"){
							qd.setType(2);
						}
						if(name=="choiceresponse"){
							qd.setType(3);
						}
					}
					
					else if(name=="checkboxgroup"){
						List<String> conte=new ArrayList();
						List<String> answe=new ArrayList();
						html=parse_html(list_new,html,name,problem_list,qd,conte,answe,id);
						qd.setContent(conte);
						qd.setAnswer(answe);
					}
					else if(name=="choicegroup"){
						List<String> conte=new ArrayList();
						List<String> answe=new ArrayList();
						html=parse_html(list_new,html,name,problem_list,qd,conte,answe,id);
						qd.setContent(conte);
						qd.setAnswer(answe);
					}
					else if (name=="choice"&&parent_name=="checkboxgroup"){
						content.add(value);
						if(list.get(i).attribute(0).getValue().equals("true")){
							answer.add(value);
						}
					}
					else if (name=="choice"&&parent_name=="choicegroup"){
						content.add(value);
						if(list.get(i).attribute(0).getValue().equals("true")){
							answer.add(value);
						}
					}
					else if (name=="solution"){
						html=parse_html(list_new,html,name,problem_list,qd,null,null,id);
						problem_list.add(qd);
						qd = new QuestionData(id);
					}
					else
						html=parse_html(list_new,html,name,problem_list,qd,null,null,id);
				}
			}
			return html;
		}

}
