package com.dhl.util;



import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.ParserConfigurationException;
import org.docx4j.dml.wordprocessingDrawing.Inline;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.BinaryPartAbstractImage;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.wml.Drawing;
import org.docx4j.wml.ObjectFactory;
import org.docx4j.wml.P;
import org.docx4j.wml.R;
import org.dom4j.DocumentException;

import org.xml.sax.SAXException;

import sun.misc.BASE64Decoder;
import com.dhl.bean.QuestionData;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;
import com.sun.org.apache.bcel.internal.util.ByteSequence;

/**
 * 试卷转成word文档的工具类
 * @author dhl
 *
 */
public class WordTools {
	//文档标题
	public static void writeTitle(WordprocessingMLPackage wordMLPackage,Exam exam) throws Docx4JException
	{   
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("a5", exam.getName());
		mdp.addStyledParagraphOfText("1", "部分1");

	}
	//文档章节
	public static void writeChapter(WordprocessingMLPackage wordMLPackage,ExamChapter ec)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("2", ec.getName());
	}

	//文档小节
	public static void writeSequential(WordprocessingMLPackage wordMLPackage,ExamSequential es)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("3", es.getName());
	}

	//文档单元
	public static void writeVertical(WordprocessingMLPackage wordMLPackage,ExamVertical ev)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("4", ev.getName());
	}

	//文档问题
	public static void writeQuestion(WordprocessingMLPackage wordMLPackage,int s,ExamQuestion eq) throws Exception
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		if (eq.getQuestion()!= null)
		{
			//1.html描述
			if (eq.getQuestion().getType()==1) 
			{
				List<String> listSrc=UtilTools.getImgStrOfSrc(eq.getQuestion().getContent());
				BASE64Decoder decoder = new BASE64Decoder();
				for (int i = 0; i < listSrc.size(); i++) {
					String str=listSrc.get(i).toString().split(",")[1];
					if (str.indexOf("=")!=-1&&str.indexOf("=")>0) {
						String srcstr=str.substring(0, str.lastIndexOf("="));
						/*System.out.println("++"+srcstr);*/
						byte[] bytes=decoder.decodeBuffer(srcstr);
						addImageToPackage(wordMLPackage, bytes);
					}
					else 
					{
						String srcstr=str.substring(0, str.length());
						/*System.out.println("srr是为:"+srcstr);*/
						byte[] bytes=decoder.decodeBuffer(srcstr);
						addImageToPackage(wordMLPackage, bytes);
					}
				}
				//mdp.addStyledParagraphOfText("a", s+"、");
				String contents=UtilTools.delTagSpan(eq.getQuestion().getContent());
				contents=UtilTools.delHTMLTag(contents);
				mdp.addStyledParagraphOfText("a", contents);
				//找出img标签
				/*	String imgString="<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>";
				//匹配正则表达式
				Pattern p = Pattern.compile(imgString);*/
				//处理图片前面的文字
				/*
				int endtext=contents.indexOf("<img");
				if (endtext!=0) {
					String foretext=contents.substring(0, endtext);
					mdp.addStyledParagraphOfText("a", foretext);
					System.out.println("wenzi"+foretext);
				}

				 处理图片
				Matcher m=p.matcher(contents);
				if (m.find()) {
					String strimage=m.group(1).split(",")[1];
					String text=m.group().split(",")[1];
					String imgcode=text.substring(0, text.length()-2);
					byte[] b=decoder.decodeBuffer(imgcode);
					addImageToPackage(wordMLPackage, b);
				}
				String strcontent=HtmlText(contents);
				String behindtext=strcontent.substring(endtext,strcontent.length());
				System.out.println("------"+behindtext);
				mdp.addStyledParagraphOfText("a", behindtext); */
			}
			else {
				{
					List<QuestionData> list=ParseQuestion.changetohtml(eq.getQuestion().getContent(), eq.getId());
					for (int i = 0; i < list.size(); i++) {	//2.单选
						if (list.get(i).getType()==2) 
						{
							/*String string=list.get(i).getContent().toString();
							int beginindex=list.get(i).getContent().toString().indexOf("[");
							int endindex=list.get(i).getContent().toString().lastIndexOf("]");
							String str=string.substring(beginindex+1, endindex);
							String[] strs=str.split(",");*/
							String title=UtilTools.getTextFromHtml(list.get(i).getTitle());
							title=UtilTools.delTagSpan(title);
							String choiceString=UtilTools.delTagSpan(list.get(i).getContent().toString());
							choiceString=UtilTools.getTextFromHtml(choiceString);
							String[] strs=choiceString.split(",");
							mdp.addStyledParagraphOfText("a",title);
							//					mdp.addStyledParagraphOfText("a",s+"、"+list.get(i).getTitle()+"（本题共"+String.valueOf(list.get(i).getScore())+"分)");
							for (int j = 0; j < strs.length; j++) {
								mdp.addStyledParagraphOfText("b", "\u25CB"+strs[j]);
							}
						}
						//多选
						else if (list.get(i).getType()==3) 
						{
							/*String string=list.get(i).getContent().toString();
							int beginindex=list.get(i).getContent().toString().indexOf("[");
							int endindex=list.get(i).getContent().toString().lastIndexOf("]");
							String str=string.substring(beginindex+1, endindex);
							String[] strs=str.split(",");*/
							String title=list.get(i).getTitle();
							title=UtilTools.delTagSpan(title);
							title=UtilTools.getTextFromHtml(title);
							String multichoice=list.get(i).getContent().toString();
							multichoice=UtilTools.getTextFromHtml(multichoice);
							String[] strs=multichoice.split(",");
							mdp.addStyledParagraphOfText("a",title);
							//					mdp.addStyledParagraphOfText("a", s+"、"+list.get(i).getTitle()+"（本题共"+String.valueOf(list.get(i).getScore())+"分)");
							for (int j = 0; j < strs.length; j++) {
								mdp.addStyledParagraphOfText("b", "\u25A1"+strs[j]);
							}
						}
						//4.填空题
						else if (list.get(i).getType()==4) {
							String blank=list.get(i).getTitle();
							blank=UtilTools.delTagSpan(blank);
							blank=UtilTools.getTextFromHtml(blank);
							mdp.addStyledParagraphOfText("a", blank);
							/*mdp.addStyledParagraphOfText("a", s+"、"+list.get(i).getTitle()+" (本题共"+list.get(i).getScore()+"分)");*/
							mdp.addStyledParagraphOfText("a", "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
						}
						//5.多行填空题
						else if (list.get(i).getType()==5) {

							String multiblank = list.get(i).getTitle();
							multiblank=UtilTools.delTagSpan(multiblank);
							multiblank = UtilTools.getTextFromHtml(multiblank);//
							mdp.addStyledParagraphOfText("a", multiblank);

							/*mdp.addStyledParagraphOfText("a",s+"、"+ss+" (本题共"+list.get(i).getScore()+"分)");*/
							mdp.addStyledParagraphOfText("a", "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
						}
					}
				}
			}
		}
		if(null!=eq.getTrain()) {
			

			//实验名称
			String trainTitle=eq.getTrain().getName();
			//实验编号
			String traincode=eq.getTrain().getCodenum();
			//环境模板
			String envmodel=eq.getTrain().getEnvname();
			//实验内容
			//			String strTrain=UtilTools.htmlText(eq.getTrain().getConContent());
			String strTrain=UtilTools.delTagSpan(eq.getTrain().getConContent());
			strTrain=UtilTools.delHTMLTag(strTrain);
			/*System.out.println("字符串aa:"+strTrain);*/
			//分值
			int score=eq.getTrain().getScore();
			mdp.addStyledParagraphOfText("a", traincode);
			mdp.addStyledParagraphOfText("a", trainTitle+"(本题"+score+"分)");
			mdp.addStyledParagraphOfText("a", "环境模板："+envmodel);
			mdp.addStyledParagraphOfText("a", strTrain);
			int index=eq.getTrain().getConContent().indexOf("img");
			if(index!=-1&&index>0){
				List<String> listSrc=UtilTools.getImgStrOfSrc(eq.getTrain().getConContent());
				BASE64Decoder decoder = new BASE64Decoder();
				for (int i = 0; i < listSrc.size(); i++)
				{
					String str=listSrc.get(i).toString().split(",")[1];
					if (str.indexOf("=")!=-1&&str.indexOf("=")>0) 
					{
						String srcstr=str.substring(0, str.lastIndexOf("="));
						/*System.out.println("++"+srcstr);*/
						byte[] bytes=decoder.decodeBuffer(srcstr);
						addImageToPackage(wordMLPackage, bytes);
					}
					else 
					{
						String srcstr=str.substring(0, str.length());
						/*System.out.println("srr是为:"+srcstr);*/
						byte[] bytes=decoder.decodeBuffer(srcstr);
						addImageToPackage(wordMLPackage, bytes);
					}
				}
			}
		}

	}  
	/** 
	 *  Docx4j拥有一个由字节数组创建图片部件的工具方法, 随后将其添加到给定的包中. 为了能将图片添加 
	 *  到一个段落中, 我们需要将图片转换成内联对象. 这也有一个方法, 方法需要文件名提示, 替换文本,  
	 *  两个id标识符和一个是嵌入还是链接到的指示作为参数. 
	 *  一个id用于文档中绘图对象不可见的属性, 另一个id用于图片本身不可见的绘制属性. 最后我们将内联 
	 *  对象添加到段落中并将段落添加到包的主文档部件. 
	 */  
	private static void addImageToPackage(WordprocessingMLPackage wordMLPackage,  
			byte[] bytes) throws Exception {  
		BinaryPartAbstractImage imagePart = BinaryPartAbstractImage.createImagePart(wordMLPackage, bytes);  
		int docPrId = 1;  
		int cNvPrId = 2;  
		Inline inline = imagePart.createImageInline("Filename hint","Alternative text", docPrId, cNvPrId, false);  
		P paragraph = addInlineImageToParagraph(inline);  
		wordMLPackage.getMainDocumentPart().addObject(paragraph);  
	}  
	/** 
	 *  创建一个对象工厂并用它创建一个段落和一个可运行块R. 
	 *  然后将可运行块添加到段落中. 接下来创建一个图画并将其添加到可运行块R中. 最后我们将内联 
	 *  对象添加到图画中并返回段落对象. 
	 */  
	private static P addInlineImageToParagraph(Inline inline) {  
		// 添加内联对象到一个段落中  
		ObjectFactory factory = new ObjectFactory();  
		P paragraph = factory.createP();  
		R run = factory.createR();  
		paragraph.getContent().add(run);  
		Drawing drawing = factory.createDrawing();  
		run.getContent().add(drawing);  
		drawing.getAnchorOrInline().add(inline);  
		return paragraph;  
	}  

	/*private static void parseImgContent(String contents) throws DocumentException, SAXException, ParserConfigurationException
	{


		String imgString="<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>";//找出img标签
		Pattern p = Pattern.compile(imgString);//匹配正则表达式
		//处理图片前面的文字
		int endtext=contents.indexOf("<img");
		if (endtext!=0) {
			String foretext=contents.substring(0, endtext);
			System.out.println("wenzi"+foretext);
		}
		//处理图片
		Matcher m=p.matcher(contents);
		if (m.find()) {
			String strimage=m.group(1).split(",")[1];
			String imgtext=m.group().split(",")[1];
			System.out.println("++++"+imgtext);
		}
		String strcontent=HtmlText(contents);
		System.out.println("zifuchuanshi-------"+strcontent);
		String behindtext=strcontent.substring(endtext,strcontent.length());
		System.out.println("---"+behindtext);

	}*/
	//过滤字符串中的所有标签,获取字符串中的文本内容
	/*public static String HtmlText(String inputString) { 
		String htmlStr = inputString; //含html标签的字符串 
		String textStr =""; 
		java.util.regex.Pattern p_script; 
		java.util.regex.Matcher m_script; 
		java.util.regex.Pattern p_style; 
		java.util.regex.Matcher m_style; 
		java.util.regex.Pattern p_html; 
		java.util.regex.Matcher m_html; 
		try { 
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> } 
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> } 
			String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式 
			p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
			m_script = p_script.matcher(htmlStr); 
			htmlStr = m_script.replaceAll(""); //过滤script标签 
			p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
			m_style = p_style.matcher(htmlStr); 
			htmlStr = m_style.replaceAll(""); //过滤style标签 

			p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
			m_html = p_html.matcher(htmlStr); 
			htmlStr = m_html.replaceAll(""); //过滤html标签 

			 空格 ——   
			// p_html = Pattern.compile("\\ ", Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = htmlStr.replaceAll(" ","");
			textStr = htmlStr; 
		}catch(Exception e){ 
		} 
		return textStr;
	} */
}
