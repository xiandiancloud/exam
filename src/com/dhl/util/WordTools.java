package com.dhl.util;



import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.xml.bind.JAXBException;

import org.docx4j.XmlUtils;
import org.docx4j.dml.wordprocessingDrawing.Inline;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.BinaryPartAbstractImage;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.wml.Drawing;
import org.docx4j.wml.ObjectFactory;
import org.docx4j.wml.P;
import org.docx4j.wml.R;

import sun.misc.BASE64Decoder;

import com.dhl.bean.QuestionData;
import com.dhl.domain.Exam;
import com.dhl.domain.ExamChapter;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.ExamSequential;
import com.dhl.domain.ExamVertical;

/**
 * 试卷转成word文档的工具类
 * @author dhl
 *
 */
public class WordTools {
	//文档标题
	private static void writeTitle(WordprocessingMLPackage wordMLPackage,Exam exam) throws Docx4JException
	{   
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("a5", exam.getName());
//		mdp.addStyledParagraphOfText("1", "部分1");

	}
	//文档章节
	private static void writeChapter(WordprocessingMLPackage wordMLPackage,ExamChapter ec)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("2", ec.getName());
	}

	//文档小节
	private static void writeSequential(WordprocessingMLPackage wordMLPackage,ExamSequential es)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addStyledParagraphOfText("3", es.getName());
	}

	//文档单元
	private static void writeVertical(WordprocessingMLPackage wordMLPackage,ExamVertical ev)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		/*mdp.addStyledParagraphOfText("4", ev.getName());*/
	}

	public static void writeALLQuestion(WordprocessingMLPackage wordMLPackage,Exam exam) throws Exception
	{
		writeTitle(wordMLPackage, exam);
		Set<ExamChapter> chapterset = exam.getExamchapters();
		Iterator it = chapterset.iterator();
		int numberIndex = 0;
		while (it.hasNext()) {
			ExamChapter chapter = (ExamChapter) it.next();
			writeChapter(wordMLPackage, chapter);
			Set<ExamSequential> sequentialset = chapter.getEsequentials();
			Iterator it2 = sequentialset.iterator();
			while (it2.hasNext()) {
				ExamSequential sequential = (ExamSequential) it2.next();
				writeSequential(wordMLPackage, sequential);
				Set<ExamVertical> verticalset = sequential.getExamVerticals();
				Iterator it3 = verticalset.iterator();
				while (it3.hasNext()) {
					ExamVertical vertical = (ExamVertical) it3.next();
//					writeVertical(wordMLPackage, vertical);
					Set<ExamQuestion> vt = vertical.getExamQuestion();
					for (ExamQuestion eq:vt)
					{
						MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
						if (eq.getQuestion()!= null)
						{
							//1.html描述
							if (eq.getQuestion().getType()==1) 
							{
								String con = eq.getQuestion().getContent();
								List<String> listSrc=UtilTools.getImgStrOfSrc(con);
//								BASE64Decoder decoder = new BASE64Decoder();
//								for (int i = 0; i < listSrc.size(); i++) {
//									String str=listSrc.get(i).toString().split(",")[1];
//									String srcstr;
//									if (str.indexOf("=")!=-1&&str.indexOf("=")>0) 
//									{
//										srcstr=str.substring(0, str.lastIndexOf("="));
//									}
//									else 
//									{
//										srcstr=str.substring(0, str.length());
//									}
//									byte[] bytes=decoder.decodeBuffer(srcstr);
//									addImageToPackage(wordMLPackage, bytes);
//								}
								//mdp.addStyledParagraphOfText("a", s+"、");
								String contents=UtilTools.delTagSpan(con);
								contents=UtilTools.getTextFromHtmlIMG(contents);
								
								addText(contents,UtilTools.SPLIT_IMG,0,listSrc,wordMLPackage);
//								mdp.addStyledParagraphOfText("a", contents);
							}
							else {
								{
									List<QuestionData> list=ParseQuestion.changetohtml(eq.getQuestion().getContent(), eq.getId());
									for (int i = 0; i < list.size(); i++) {	//2.单选
										numberIndex ++;
//										String tindex = "<w:p xmlns:w =\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\"><w:r w:rsidRPr=\"00CF4B0B\"><w:rPr><w:rFonts w:hint=\"eastAsia\"/><w:sz w:val=\"30\"/><w:szCs w:val=\"30\"/></w:rPr><w:t>"+numberIndex+"</w:t></w:r>< w:r >< w:t >";
//										String endindex = "</w:t></w:r></w:p>";
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
											
											addObject(mdp, sampleTextBold, numberIndex+" ",title);
											
//											mdp.addStyledParagraphOfText("a",tindex + title + endindex);
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
											
											addObject(mdp, sampleTextBold, numberIndex+" ",title);
											
//											mdp.addStyledParagraphOfText("a",tindex + title  + endindex);
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
											
											addObject(mdp, sampleTextBold, numberIndex+" ",blank);
											
//											mdp.addStyledParagraphOfText("a", blank);
//											mdp.addObject(tindex + blank + endindex);  
											/*mdp.addStyledParagraphOfText("a", s+"、"+list.get(i).getTitle()+" (本题共"+list.get(i).getScore()+"分)");*/
//											mdp.addStyledParagraphOfText("a", "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
										}
										//5.多行填空题
										else if (list.get(i).getType()==5) {

											String multiblank = list.get(i).getTitle();
											multiblank=UtilTools.delTagSpan(multiblank);
											multiblank = UtilTools.getTextFromHtml(multiblank);//
											
											addObject(mdp, sampleTextBold, numberIndex+" ",multiblank);
//											mdp.addStyledParagraphOfText("a", multiblank);
//											mdp.addObject(tindex + multiblank + endindex);  
											/*mdp.addStyledParagraphOfText("a",s+"、"+ss+" (本题共"+list.get(i).getScore()+"分)");*/
//											mdp.addStyledParagraphOfText("a", "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
										}
										mdp.addStyledParagraphOfText("a", "");
									}
								}
							}
						}
						if(null!=eq.getTrain()) {
							
							numberIndex ++;
							//实验名称
							String trainTitle=eq.getTrain().getName();
							/*//实验编号
							String traincode=eq.getTrain().getCodenum();
							//环境模板
							String envmodel=eq.getTrain().getEnvname();*/
							//实验内容
							//			String strTrain=UtilTools.htmlText(eq.getTrain().getConContent());
							
							String con = eq.getTrain().getConContent();
							List<String> listSrc=UtilTools.getImgStrOfSrc(con);
							
							String contents=UtilTools.delTagSpan(con);
							contents=UtilTools.getTextFromHtmlIMG(contents);
							
							//分值
							int score=eq.getTrain().getScore();
							addObject(mdp, sampleTextBold, numberIndex+" ",trainTitle+"(本题"+score+"分)");
							
							addText(contents,UtilTools.SPLIT_IMG,0,listSrc,wordMLPackage);
							
							
//							String strTrain=UtilTools.delTagSpan(eq.getTrain().getConContent());
//							strTrain=UtilTools.getTextFromHtml(strTrain);
							/*System.out.println("字符串aa:"+strTrain);*/
							//分值
//							int score=eq.getTrain().getScore();
							/*mdp.addStyledParagraphOfText("a", traincode);*/
//							addObject(mdp, sampleTextBold, numberIndex+" ",trainTitle+"(本题"+score+"分)");
//							mdp.addStyledParagraphOfText("a", numberIndex + trainTitle+"(本题"+score+"分)");
							/*mdp.addStyledParagraphOfText("a", "环境模板："+envmodel);*/
//							mdp.addStyledParagraphOfText("a", strTrain);
//							int index=eq.getTrain().getConContent().indexOf("img");
//							if(index!=-1&&index>0){
//								List<String> listSrc=UtilTools.getImgStrOfSrc(eq.getTrain().getConContent());
//								BASE64Decoder decoder = new BASE64Decoder();
//								for (int i = 0; i < listSrc.size(); i++)
//								{
//									String str=listSrc.get(i).toString().split(",")[1];
//									if (str.indexOf("=")!=-1&&str.indexOf("=")>0) 
//									{
//										String srcstr=str.substring(0, str.lastIndexOf("="));
//										byte[] bytes=decoder.decodeBuffer(srcstr);
//										addImageToPackage(wordMLPackage, bytes);
//									}
//									else 
//									{
//										String srcstr=str.substring(0, str.length());
//										byte[] bytes=decoder.decodeBuffer(srcstr);
//										addImageToPackage(wordMLPackage, bytes);
//									}
//								}
//							}
							mdp.addStyledParagraphOfText("a", "");
						}
					}
				}
			}
		}
	}
	
	private static void insertImg(String imgStr,WordprocessingMLPackage wordMLPackage)
	{
		try
		{
			BASE64Decoder decoder = new BASE64Decoder();
			String str=imgStr.split(",")[1];
			String srcstr;
			if (str.indexOf("=")!=-1&&str.indexOf("=")>0) 
			{
				srcstr=str.substring(0, str.lastIndexOf("="));
			}
			else 
			{
				srcstr=str.substring(0, str.length());
			}
			byte[] bytes=decoder.decodeBuffer(srcstr);
			addImageToPackage(wordMLPackage, bytes);
		}
		catch(Exception e)
		{}
	}
	private static void addText(String s,String regex,int numberindex,List<String> list,WordprocessingMLPackage wordMLPackage)
    {
    	 int index = s.indexOf(regex);
		 if (index != -1)
		 {
			 String one = s.substring(0,index);
			 if (one ==null || "".equals(one))
			 {
				 
			 }
			 else
			 {
//				 System.out.println("one ---- "+one);
				 wordMLPackage.getMainDocumentPart().addStyledParagraphOfText("a", one);
			 }
//			 String two = regex;
			 insertImg(list.get(numberindex),wordMLPackage);
			 numberindex ++;
//			 System.out.println("two ---- "+two);
			 String three = s.substring(index+regex.length());
//			 System.out.println("three ---- "+three);
			 s = three;
//				 System.out.println("s ---- "+s);
			 addText(s,regex,numberindex,list,wordMLPackage);
		 }
		 else
		 {
			 wordMLPackage.getMainDocumentPart().addStyledParagraphOfText("a", s);
//			 System.out.println("four -------- "+s);
		 }
    }
	
	final static String sampleTextBold =	"<w:p xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">"
		+"<w:r w:rsidRPr=\"00EB7A5D\"><w:rPr><w:rFonts w:hint=\"eastAsia\"/><w:b/><w:sz w:val=\"30\"/><w:szCs w:val=\"30\"/></w:rPr>"
		+"<w:t>${fontname}</w:t>"
		+"</w:r>"
		+"<w:r>"	
		+"<w:rPr><w:rFonts w:hint=\"eastAsia\"/></w:rPr>"
		+"<w:t>${fontname2}</w:t>"
		+"</w:r>"
		+"</w:p>";
	
	private static void addObject(MainDocumentPart wordDocumentPart, String template, String fontName,String fontName2 ) throws JAXBException {
		
	    HashMap substitution = new HashMap();
	    substitution.put("fontname", fontName);
	    substitution.put("fontname2", fontName2);
	    Object o = XmlUtils.unmarshallFromTemplate(template, substitution);
	    wordDocumentPart.addObject(o);    		    
		
	}
	
	//文档问题
	public static void writeQuestion(WordprocessingMLPackage wordMLPackage,ExamQuestion eq,Integer numberIndex) throws Exception
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		if (eq.getQuestion()!= null)
		{
			//1.html描述
			if (eq.getQuestion().getType()==1) 
			{
				String con = eq.getQuestion().getContent();
				List<String> listSrc=UtilTools.getImgStrOfSrc(con);
				BASE64Decoder decoder = new BASE64Decoder();
				for (int i = 0; i < listSrc.size(); i++) {
					String str=listSrc.get(i).toString().split(",")[1];
					String srcstr;
					if (str.indexOf("=")!=-1&&str.indexOf("=")>0) 
					{
						srcstr=str.substring(0, str.lastIndexOf("="));
					}
					else 
					{
						srcstr=str.substring(0, str.length());
					}
					byte[] bytes=decoder.decodeBuffer(srcstr);
//					addImageToPackage(wordMLPackage, bytes);
				}
				//mdp.addStyledParagraphOfText("a", s+"、");
				String contents=UtilTools.delTagSpan(con);
				contents=UtilTools.getTextFromHtmlIMG(contents);
				numberIndex ++;
				mdp.addStyledParagraphOfText("a", numberIndex + contents);
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
						numberIndex ++;
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
							mdp.addStyledParagraphOfText("a",numberIndex + title);
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
							mdp.addStyledParagraphOfText("a",numberIndex + title);
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
							mdp.addStyledParagraphOfText("a", numberIndex + "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
						}
						//5.多行填空题
						else if (list.get(i).getType()==5) {

							String multiblank = list.get(i).getTitle();
							multiblank=UtilTools.delTagSpan(multiblank);
							multiblank = UtilTools.getTextFromHtml(multiblank);//
							mdp.addStyledParagraphOfText("a", multiblank);

							/*mdp.addStyledParagraphOfText("a",s+"、"+ss+" (本题共"+list.get(i).getScore()+"分)");*/
							mdp.addStyledParagraphOfText("a", numberIndex + "\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f\u005f");
						}
					}
				}
			}
		}
		if(null!=eq.getTrain()) {
			

			//实验名称
			String trainTitle=eq.getTrain().getName();
			/*//实验编号
			String traincode=eq.getTrain().getCodenum();
			//环境模板
			String envmodel=eq.getTrain().getEnvname();*/
			//实验内容
			//			String strTrain=UtilTools.htmlText(eq.getTrain().getConContent());
			String strTrain=UtilTools.delTagSpan(eq.getTrain().getConContent());
			strTrain=UtilTools.getTextFromHtml(strTrain);
			/*System.out.println("字符串aa:"+strTrain);*/
			//分值
			int score=eq.getTrain().getScore();
			/*mdp.addStyledParagraphOfText("a", traincode);*/
			mdp.addStyledParagraphOfText("a", trainTitle+"(本题"+score+"分)");
			/*mdp.addStyledParagraphOfText("a", "环境模板："+envmodel);*/
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
