package com.dhl.util;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
public class ParseQuestion {
	public static List<Element> getChildNode(Element element){
		List<Element> childList = element.elements();
		return childList;
	}
	
	public static String changetohtml(String xml)
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
		String problem_html=parse_html(list,html,parent_name);
		String final_html="<div class=\"xblock xblock-student_view xmodule_display xmodule_CapaModule xblock-initialized\" data-block-type=\"problem\" data-type=\"Problem\" data-usage-id=\"i4x://edx/jsj_1/problem/9dd5a966540e4378a2e666f7334ed0a7\" data-runtime-version=\"1\" data-init=\"XBlockToXModuleShim\" data-runtime-class=\"PreviewRuntime\">"+'\r'+"<div class=\"problem\" role=\"application\">"+"<div>"+'\r'+problem_html+"</div>"+'\r'+"</div>"+'\r'+"</div>";
		System.out.println(final_html);
		return final_html;
		}
		catch(Exception e)
		{
			return "";
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
		public static void main(String[] args) throws Exception {
			String html="";
			String xml ="<problem></br><p>问题题目请在这儿修改</p></br><choiceresponse></br>  <checkboxgroup label=\"问题题目请在这儿修改\" direction=\"vertical\"></br>    <choice correct=\"true\">选项内容</choice></br>    <choice correct=\"false\">选项内容</choice></br>    <choice correct=\"true\">选项内容</choice></br>  </checkboxgroup></br></choiceresponse></br></br><solution></br><div class=\"detailed-solution\"></br><p>Explanation</p></br></br><p>问题解释</p></br></br></div></br></solution></br></problem>";
	        String regEx="</br>"; 
	        Pattern pat=Pattern.compile(regEx);  
	        Matcher mat=pat.matcher(xml);  
	        String s=mat.replaceAll("\r"); 
			Document doc = DocumentHelper.parseText(s);
			Element root = doc.getRootElement();
			String parent_name=root.getName();
			List<Element> list=getChildNode(root);
			String problem_html=parse_html(list,html,parent_name);
			String final_html="<div class=\"xblock xblock-student_view xmodule_display xmodule_CapaModule xblock-initialized\" data-block-type=\"problem\" data-type=\"Problem\" data-usage-id=\"i4x://edx/jsj_1/problem/9dd5a966540e4378a2e666f7334ed0a7\" data-runtime-version=\"1\" data-init=\"XBlockToXModuleShim\" data-runtime-class=\"PreviewRuntime\">"+'\r'+"<div class=\"problem\" role=\"application\">"+"<div>"+'\r'+problem_html+"</div>"+'\r'+"</div>"+'\r'+"</div>";
			System.out.println(final_html);
			
		}
		private static String parse_html(List<Element> list,String html,String parent_name){
			
			int len=list.size();
			if(len>0){
				for(int i=0;i<len;i++){
					List<Element> list_new=getChildNode(list.get(i));
					String name=list.get(i).getName();
					String value=list.get(i).getText();
					if (name=="p"){
						html+="<p>"+'\r'+value+'\r'+"</p>"+'\r';
					}
					else if(name=="stringresponse"){
						Map<String,String> attr=getNodeAttrName(list.get(i));
						String attrname=attr.get("answer");
						html+="<span>"+'\r'+"<div class=\" capa_inputtype  textline\" id=\"inputtype_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\">"+'\r'
					+"<div id=\"status_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\" class=\"unanswered \">"+'\r'
								+"<input type=\"text\" size=\"20\" value=\"\" aria-describedby=\"answer_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\" aria-label=\"\" id=\"input_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\" name=\"input_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\">  "+'\r'
					+"<p aria-describedby=\"input_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\" aria-hidden=\"true\" class=\"status\">"+'\r'
								+"-"+'\r'+"unanwer"+'\r'+"</p>"+
					"<p aria-hidden=\"true\" class=\"answer\" id=\"answer_i4x-edx-jsj_1-problem-10f8a16262c9492aabfbb5ee5f75d1ef_2_1\">"+attrname+"</p>"+'\r'+"</div>"+'\r'+"</div>"+"</span>"+'\r';
					}
					else if(name=="choiceresponse"||name=="multiplechoiceresponse"){
						html+="<span><form class=\"choicegroup capa_inputtype\" id=\"inputtype_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1\">"
								+'\r'+"<div class=\"indicator_container\">"+'\r'+"<span class=\"status unanswered\" id=\"status_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1\" aria-describedby=\"inputtype_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1\">"
								+'\r'+"<span class=\"sr\">"+'\r'+"</span>"+'\r'+"</span>"+'\r'+"</div>"+'\r';
						html=parse_html(list_new,html,name);
						html+="</form>"+'\r'+"</span>"+'\r';
					}
					
					else if(name=="checkboxgroup"){
						html+="<fieldset role=\"checkboxgroup\" aria-label=\"Select the answer that matches\">"+'\r';
						html=parse_html(list_new,html,name);
						html+="</fieldset>"+'\r';
					}
					else if(name=="choicegroup"){
						html+="<fieldset aria-label=\"\" role=\"radiogroup\">"+'\r';
						html=parse_html(list_new,html,name);
						html+="</fieldset>"+'\r';
					}
					else if (name=="choice"&&parent_name=="checkboxgroup"){
						html+="<label  for=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1_choice_0\">"+'\r'
					+"<input type=\"checkbox\" name=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1[]\" id=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1_choice_0\" aria-role=\"radio\" aria-describedby=\"answer_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1\" value=\"choice_0\" aria-multiselectable=\"true\"/> "+value+'\r'+"</lable>"+'\r';
					}
					else if (name=="choice"&&parent_name=="choicegroup"){
						html+="<label  for=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1_choice_0\">"+'\r'
					+"<input type=\"radio\" name=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1[]\" id=\"input_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1_choice_0\" aria-role=\"radio\" aria-describedby=\"answer_i4x-edx-jsj_1-problem-9dd5a966540e4378a2e666f7334ed0a7_2_1\" value=\"choice_0\" aria-multiselectable=\"true\"/> "+value+'\r'+"</lable>"+'\r';
					}
					else if (name=="solution"){
						html+="<section class=\"solution-span\">"+'\r'+"<span id=\"solution_i4x-edx-jsj_1-problem-3641754940cb452eb3739f97a31a78aa_solution_1\"><solution id=\"i4x-edx-jsj_1-problem-3641754940cb452eb3739f97a31a78aa_solution_1\">"+'\r'+"<div class=\"detailed-solution\">"+'\r';
						html=parse_html(list_new,html,name);
						html+="</div>"+'\r'+"</solution>"+"</span>"+'\r'+"</section>"+'\r';
					}
					else
						html=parse_html(list_new,html,name);
				}
			}
			return html;
		}

}
