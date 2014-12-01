package com.dhl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.ExamDao;
import com.dhl.dao.ExamQuestionDao;
import com.dhl.dao.ExamVerticalDao;
import com.dhl.dao.LogDao;
import com.dhl.dao.QuestionDao;
import com.dhl.dao.TrainDao;
import com.dhl.dao.TrainExtDao;
import com.dhl.dao.UserQuestionChildDao;
import com.dhl.dao.UserQuestionDao;
import com.dhl.domain.ExamQuestion;
import com.dhl.domain.Train;
import com.dhl.domain.TrainExt;
import com.dhl.domain.UserQuestion;
import com.dhl.domain.UserQuestionChild;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class UserQuestionService {

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	@Autowired
	private UserQuestionChildDao userQuestionChildDao;
	@Autowired
	private TrainDao trainDao;
	@Autowired
	private TrainExtDao trainExtDao;
	@Autowired
	private ExamQuestionDao examQuestionDao;
	@Autowired
	private ExamDao examDao;
	@Autowired
	private ExamVerticalDao examVerticalDao;
	@Autowired
	private LogDao logDao;
	
	public String getTrainQuestion(int trainId)
	{
		StringBuffer buffer = new StringBuffer();
		buffer.append("{");
		buffer.append("\"basiclist\":");
		Train t = trainDao.get(trainId);
		String con = UtilTools.replaceBackett(t.getConContent());
		String conanswer = UtilTools.replaceBackett(t.getConAnswer());
		String str = "{'name':'"+t.getName()+"','codenum':'"+t.getCodenum()
				+"','envname':'"+t.getEnvname()+"','conContent':'"+con+"','conAnswer':'"+conanswer+"','score':'"+t.getScore()+"'},";
		buffer.append(str);
		
		List<TrainExt> zyList = trainExtDao.getTrainExtList(trainId);
		if (zyList != null)
		{
			int len = zyList.size();
			if (len >0)
			{
				buffer.append("\"extlist\":[");
				String temp="";
				for (int i=0;i<len;i++)
				{
					TrainExt pm = zyList.get(i);
					temp += "{\"shellpath\":\""+pm.getShellpath()+"\",\"devinfo\":\""+pm.getDevinfo()+"\",\"scoretag\":\""+pm.getScoretag()+"\",\"shellparameter\":\""+pm.getShellparameter()+"\",\"shellname\":\""+pm.getShellname()+"\"},";
				}
				if (temp.length() > 1)
				{
					temp = temp.substring(0, temp.length() -1 );
					buffer.append(temp);
				}
				buffer.append("],");
			}
		}
		String tt = buffer.toString();
		if (tt.length() > 1)
		{
			tt = tt.substring(0,tt.length() -1 );
		}
		return tt+"}";
	}
	
	public void updateTrainQuestion(List<Map<String,Object>> list)
	{
		for (Map<String,Object> map:list)
		{
			System.out.println(map.get("basiclist").getClass());
			Map<String,Object> usermap = (Map)map.get("basiclist");
			Train t = trainDao.get((int)usermap.get("trainId"));
			if (t != null)
			{
				t.setName((String)usermap.get("name"));
				t.setCodenum((String)usermap.get("codenum"));
				t.setEnvname((String)usermap.get("envname"));
				t.setConContent((String)usermap.get("conContent"));
				t.setConAnswer((String)usermap.get("conAnswer"));
				t.setScore((int)usermap.get("score"));
				trainDao.update(t);
				
				ArrayList slist = (ArrayList)map.get("shelllist");
				if (slist != null)
				{
					int size = slist.size();					
	//				if (size > 0)
					{
						trainExtDao.removeByTrainId(t.getId());
					}
					for (int i=0;i<size;i++)
					{
						Map<String,Object> shellmap  = (Map)slist.get(i);
						//实训的扩展信息：shell，参数等信息
						TrainExt te = new TrainExt();
						te.setTrainId(t.getId());
						te.setShellpath((String)shellmap.get("shellpath"));
						te.setDevinfo((String)shellmap.get("devinfo"));
						te.setShellparameter((String)shellmap.get("shellparameter"));
						te.setShellname((String)shellmap.get("shellname"));
						te.setScoretag((String)shellmap.get("scoretag"));
						trainExtDao.save(te);
					}
				}
			}
		}
	}
	
	public void saveTrainQuestion(List<Map<String,Object>> list) {
	
		for (Map<String,Object> map:list)
		{
			System.out.println(map.get("basiclist").getClass());
			Map<String,Object> usermap = (Map)map.get("basiclist");
			Train t = new Train();
			t.setName((String)usermap.get("name"));
			t.setCodenum((String)usermap.get("codenum"));
			t.setEnvname((String)usermap.get("envname"));
			t.setConContent((String)usermap.get("conContent"));
//			t.setConShell(conShell);
			t.setConAnswer((String)usermap.get("conAnswer"));
			t.setScore((int)usermap.get("score"));
			trainDao.save(t);
			
			ArrayList slist = (ArrayList)map.get("shelllist");
			if (slist != null)
			{
				int size = slist.size();					
//				if (size > 0)
				{
					trainExtDao.removeByTrainId(t.getId());
				}
				for (int i=0;i<size;i++)
				{
					Map<String,Object> shellmap  = (Map)slist.get(i);
					//实训的扩展信息：shell，参数等信息
					TrainExt te = new TrainExt();
					te.setTrainId(t.getId());
					te.setShellpath((String)shellmap.get("shellpath"));
					te.setDevinfo((String)shellmap.get("devinfo"));
					te.setShellparameter((String)shellmap.get("shellparameter"));
					te.setShellname((String)shellmap.get("shellname"));
					te.setScoretag((String)shellmap.get("scoretag"));
					trainExtDao.save(te);
				}
			}
			//考试跟实训联系起来
			ExamQuestion eq = new ExamQuestion();
			eq.setExam(examDao.get((int)usermap.get("examId")));
			eq.setTrain(t);
			eq.setExamVertical(examVerticalDao.get((int)usermap.get("everticalId")));
			examQuestionDao.save(eq);
		}
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestion getQuestion(int userId,int examId,int questionId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		return uq;
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestionChild getQuestionChild(UserQuestion uq,int userId,int number)
	{
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
		return uqc;
	}
	
	/**
	 * 得到用户提交的答案
	 */
	public UserQuestionChild getQuestionChild(int userId,int examId,int questionId,int number)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
			return uqc;
		}
		return null;
	}
	
	/**
	 * 得到用户提交的答案列表
	 */
	public List<UserQuestionChild> getQuestionList(int userId,int examId,int questionId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq != null)
		{
			return userQuestionChildDao.getUserQuestionByuserquestionId(userId,uq.getId());
		}
		return null;
	}
	
	/**
	 * 得到用户关于单元下的实验类型的问题
	 */
	public UserQuestion getUserExamTrainQuestion(int userId,int examId,int trainId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, examId, trainId);
		return uq;
	}
	
	/**
	 * 得到用户关于单元下的实验类型的问题
	 */
	public UserQuestionChild getUserExamTrainQuestionChild(int userId,int examId,int trainId)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionBytrain(userId, examId, trainId);
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByusertrainId(userId,uq.getId());
			return uqc;
		}
		return null;
	}
	
	/**
	 * 保存考试系统的实训答案
	 * @param userId
	 * @param examId
	 * @param trainId
	 */
	public void saveQuestionTrain(String username,int userId,int examId,int trainId,String rdata,int number)
	{
		UserQuestion uq = new UserQuestion();
		uq.setExamId(examId);
		uq.setQuestion(null);
		uq.setUserId(userId);
		uq.setTrain(trainDao.get(trainId));
		userQuestionDao.save(uq);
		
		
		UserQuestionChild uqc = new UserQuestionChild();
		uqc.setUserId(userId);
		uqc.setNumber(number);
		uqc.setRevalue(rdata);
		uqc.setUserquestionId(uq.getId());
		userQuestionChildDao.save(uqc);
		logDao.saveLog(username,CommonConstant.LOG_1+"examId:"+examId+" , trainId:"+trainId);
	}
	
	/**
	 * 保存考试系统的实训答案
	 * @param userId
	 * @param examId
	 * @param trainId
	 */
	public void saveUserAnswer(int userId,int examId,int trainId,String useranswer)
	{
		UserQuestion uq = new UserQuestion();
		uq.setExamId(examId);
		uq.setQuestion(null);
		uq.setUserId(userId);
		uq.setTrain(trainDao.get(trainId));
		userQuestionDao.save(uq);
		
		
		UserQuestionChild uqc = new UserQuestionChild();
		uqc.setUserId(userId);
		uqc.setNumber(1);
		uqc.setUseranswer(useranswer);
		uqc.setUserquestionId(uq.getId());
		userQuestionChildDao.save(uqc);
		
	}
	/**
	 * 更新考试系统的实训答案
	 */
	public void updateUserAnswer(UserQuestion uq,int userId,String useranswer)
	{
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,1,uq.getId());
		if (uqc != null)
		{
			uqc.setUseranswer(useranswer);
			userQuestionChildDao.update(uqc);
		}
	}
	
	/**
	 * 更新考试系统的实训答案
	 */
	public void updateQuestionTrain(String username,UserQuestion uq,int userId,int examId,int trainId,String rdata,int number)
	{
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByusertrainId(userId,uq.getId());
		if (uqc != null)
		{
			uqc.setRevalue(rdata);
			userQuestionChildDao.update(uqc);
			logDao.saveLog(username,CommonConstant.LOG_5+"examId:"+examId+" , trainId:"+trainId);
		}
		else
		{
			uqc = new UserQuestionChild();
			uqc.setUserId(userId);
			uqc.setNumber(number);
			uqc.setRevalue(rdata);
			uqc.setUserquestionId(uq.getId());
			userQuestionChildDao.save(uqc);
			logDao.saveLog(username,CommonConstant.LOG_1+"examId:"+examId+" , trainId:"+trainId);
		}
	}
	
	/**
	 * 提交答案
	 */
	public void saveQuestion(String username,int userId,int examId,int questionId,int number,String useranswer)
	{
		UserQuestion uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		if (uq == null)
		{
			uq = new UserQuestion();
			uq.setExamId(examId);
			uq.setQuestion(questionDao.get(questionId));
			uq.setUserId(userId);
			uq.setTrain(null);
			userQuestionDao.save(uq);
		}
		else
		{
			uq.setExamId(examId);
			uq.setQuestion(questionDao.get(questionId));
			uq.setUserId(userId);
			uq.setTrain(null);
			userQuestionDao.update(uq);
		}
		
		UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
		if (uqc == null)
		{
			UserQuestionChild uqc2 = new UserQuestionChild();
			uqc2.setUserId(userId);
			uqc2.setNumber(number);
			uqc2.setUseranswer(useranswer);
			uqc2.setUserquestionId(uq.getId());
			userQuestionChildDao.save(uqc2);
			logDao.saveLog(username,CommonConstant.LOG_1+"examId:"+examId+" , questionId:"+questionId+" , number:"+number);
		}
		else
		{
			uqc.setNumber(number);
			uqc.setUseranswer(useranswer);
			uqc.setUserquestionId(uq.getId());
			userQuestionChildDao.update(uqc);
			logDao.saveLog(username,CommonConstant.LOG_5+"examId:"+examId+" , questionId:"+questionId+" , number:"+number);
		}
	}
	
	/**
	 * 提交答案
	 */
	public boolean updateQuestion(String username,int type,int userId,int examId,int questionId,int number,String pfscore)
	{
		UserQuestion uq;
		if (type == CommonConstant.QTYPE_6)
		{
			uq = userQuestionDao.getUserQuestionBytrain(userId, examId, questionId);
		}
		else
		{
			uq = userQuestionDao.getUserQuestionByquestion(userId, examId, questionId);
		}
		if (uq != null)
		{
			UserQuestionChild uqc = userQuestionChildDao.getUserQuestionByuserquestionId(userId,number,uq.getId());
			if (uqc != null)
			{
				uqc.setPfscore(pfscore);
				userQuestionChildDao.update(uqc);
				logDao.saveLog(username,CommonConstant.LOG_3+"examId:"+examId+" , questionId:"+questionId+" , number:"+number+" , pfscore:"+pfscore);
				return true;
			}
		}
		return false;
	}
	/**
	 * 提交答案
	 */
	public void saveTrainQuestion(int userId,int examId,int trainId)
	{
		
	}
}
