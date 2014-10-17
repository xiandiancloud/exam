package com.dhl.util;

import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;

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
	public static void writeTitle(WordprocessingMLPackage wordMLPackage,Exam exam)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addParagraphOfText(exam.getName());
	}
	
	//文档章节
	public static void writeChapter(WordprocessingMLPackage wordMLPackage,ExamChapter ec)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addParagraphOfText(ec.getName());
	}
	
	//文档小节
	public static void writeSequential(WordprocessingMLPackage wordMLPackage,ExamSequential es)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addParagraphOfText(es.getName());
	}
		
	//文档单元
	public static void writeVertical(WordprocessingMLPackage wordMLPackage,ExamVertical ev)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addParagraphOfText(ev.getName());
	}
	
	//文档问题
	public static void writeQuestion(WordprocessingMLPackage wordMLPackage,ExamQuestion eq)
	{
		MainDocumentPart mdp = wordMLPackage.getMainDocumentPart();
		mdp.addParagraphOfText("问题");
	}
}
