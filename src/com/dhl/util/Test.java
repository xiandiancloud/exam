package com.dhl.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;


public class Test {

	/**
     * 对字符串加密,加密算法使用MD5,SHA-1,SHA-256,默认使用SHA-256
     * 
     * @param strSrc
     *            要加密的字符串
     * @param encName
     *            加密类型
     * @return
     */
    public static String Encrypt(String strSrc, String encName) {
        MessageDigest md = null;
        String strDes = null;

        byte[] bt = strSrc.getBytes();
        try {
            if (encName == null || encName.equals("")) {
                encName = "SHA-256";
            }
            md = MessageDigest.getInstance(encName);
            md.update(bt);
            strDes = bytes2Hex(md.digest()); // to HexString
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
        return strDes;
    }

    public static String bytes2Hex(byte[] bts) {
        String des = "";
        String tmp = null;
        for (int i = 0; i < bts.length; i++) {
            tmp = (Integer.toHexString(bts[i] & 0xFF));
            if (tmp.length() == 1) {
                des += "0";
            }
            des += tmp;
        }
        return des;
    }
    private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式  
    private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式  
    private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式  
    private static final String regEx_space = "\\s*|\t|\r|\n";//定义空格回车换行符  
    
    public static String delHTMLTag(String htmlStr) {  
        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);  
        Matcher m_script = p_script.matcher(htmlStr);  
        htmlStr = m_script.replaceAll(""); // 过滤script标签  
  
        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);  
        Matcher m_style = p_style.matcher(htmlStr);  
        htmlStr = m_style.replaceAll(""); // 过滤style标签  
  
        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);  
        Matcher m_html = p_html.matcher(htmlStr);  
        htmlStr = m_html.replaceAll(""); // 过滤html标签  
  
        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);  
        Matcher m_space = p_space.matcher(htmlStr);  
        htmlStr = m_space.replaceAll(""); // 过滤空格回车标签  
        return htmlStr.trim(); // 返回文本字符串  
    }  
      
    public static String getTextFromHtml(String htmlStr){  
        htmlStr = delHTMLTag(htmlStr);  
        htmlStr = htmlStr.replaceAll("&nbsp;", "");  
//        htmlStr = htmlStr.substring(0, htmlStr.indexOf("。")+1);  
        return htmlStr;  
    }  
    
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		String REGEX = "11111#22222#333333";
//		String[] regex = REGEX.split("#");
		String fileName = "fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf" +
				" fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf f" +
				"safasdfaf fsdafsdafafsafaf fsfasf fsafasdf" +
				"af fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf fsfasf fsafasdfaf fsdafsdafafsafaf ";
		String returnFileName = "";
		try {
			returnFileName = URLEncoder.encode(fileName, "UTF-8");
//			returnFileName = StringUtils.replace(returnFileName, "+", "%20");
			System.out.println(returnFileName);
			System.out.println(returnFileName.length());
//			if (returnFileName.length() > 150) {
//				returnFileName = new String(fileName.getBytes("GB2312"),
//						"ISO8859-1");
//				returnFileName = StringUtils
//						.replace(returnFileName, " ", "%20");
//			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
//		String str = "1Bar12";
//		System.out.println(str.matches("pl[a-z]in")); //false
//		System.out.println(str.toLowerCase().matches(".{0,}"+"bar".toLowerCase()+".{0,}"));//true
		
		
//		String str = "<div style='text-align:center;'> 整治“四风”   清弊除垢<br/><span style='font-size:14px;'> </span><span style='font-size:18px;'>公司召开党的群众路线教育实践活动动员大会</span><br/></div>";  
//        System.out.println(getTextFromHtml(str)); 
        
//		int score = 10;
//		float b = score * (1f/5);
//		 System.out.println(b);
//		 DecimalFormat formater = new DecimalFormat("#0.##");
//		 System.out.println(formater.format(b));
		 
//		System.out.println(b);
//		System.out.println("------ "+UtilTools.timeTostrHMS(new Date()));
		
//		for (int i=0;i<5;i++)
//		{
//			for (int j=0;j<4;j++)
//			{
//				for (int k=0;k<3;k++)
//				{
//					for (int l=0;l<2;l++)
//					{
//						System.out.println("index == "+(l+1+k*2+j*6+i*24));
//					}
//				}
//			}
//		}
//		String aaa = "shell/fsafasfaaa.sh";
//		String[] strs = aaa.split("/");
//		System.out.println(strs[1]);
//		
//		int[] value = null;
//		System.out.println("int[] ----------"+value);
//		File file = new File("D:\\work\\apache-tomcat-6.0.20\\webapps\\train\\export\\2014-07-15\\static");
//		if (!file.exists())
//			file.mkdir();
		
//		Keystone keystone = new Keystone(ExamplesConfiguration.KEYSTONE_AUTH_URL);
//		Access access = keystone.tokens().authenticate(new UsernamePassword(ExamplesConfiguration.KEYSTONE_USERNAME, ExamplesConfiguration.KEYSTONE_PASSWORD))
//				.withTenantName("admin")
//				.execute();
//		
//		//use the token in the following requests
//		keystone.token(access.getToken().getId());
//			
//		//NovaClient novaClient = new NovaClient(KeystoneUtils.findEndpointURL(access.getServiceCatalog(), "compute", null, "public"), access.getToken().getId());
//		Nova novaClient = new Nova(ExamplesConfiguration.NOVA_ENDPOINT.concat("/").concat(access.getToken().getTenant().getId()));
//		novaClient.token(access.getToken().getId());
//		//novaClient.enableLogging(Logger.getLogger("nova"), 100 * 1024);
//		
//		Servers servers = novaClient.servers().list(true).execute();
//		String id = null;
//		for(Server server : servers) {
//			id = server.getId();
//			System.out.println(server);
//		}
//		//use server id to get its spice console
//		if (id != null)
//		{
//			GetSpiceConsoleServer cs = novaClient.servers().getSpiceConsole(id, "spice-html5");//novnc"spice-html5"
//			SpiceConsole console = cs.execute();		
//			
//			System.out.println(console.getUrl());		
//			
//		}
		
//		String s=Test.Encrypt("default123456", "");
//	     System.out.println(s);
	     
//		UtilTools.createServer();
		
//		UtilTools.stopServer("9b087620-aa6f-4d55-abc4-0307eb6a9826");
		
//		UtilTools.startServer("9b087620-aa6f-4d55-abc4-0307eb6a9826");
		
//		UtilTools.getServer("d9fcc80d-c639-42cd-b449-3f30c2600300");
		
//		UtilTools.delServer("d9fcc80d-c639-42cd-b449-3f30c2600300");
		
//		 String hostname = "192.168.1.110";  
//	        String username = "dhl";  
//	        String password = "123456";  
//	        //指明连接主机的IP地址  
//	        Connection conn = new Connection(hostname);  
//	        Session ssh = null;  
//	        try {  
//	            //连接到主机  
//	            conn.connect();  
//	            //使用用户名和密码校验  
//	            boolean isconn = conn.authenticateWithPassword(username, password);  
//	            if(!isconn){  
//	                System.out.println("用户名称或者是密码不正确");  
//	            }else{  
//	                System.out.println("已经连接OK");  
//	                ssh = conn.openSession();  
//	                
//	                SCPClient scpClient = conn.createSCPClient(); 
//		            scpClient.put("D:/aaa.sh","/home/dhl/work","0755"); 
//		            
//	                //使用多个命令用分号隔开  
////	              ssh.execCommand("pwd;cd /tmp;mkdir hb;ls;ps -ef|grep weblogic");  
//	                ssh.execCommand("cd /home/dhl/work;./aaa.sh &");  
//	                //只允许使用一行命令，即ssh对象只能使用一次execCommand这个方法，多次使用则会出现异常  
////	               ssh.execCommand("mkdir hb");  
//	                //将屏幕上的文字全部打印出来  
//	                String rdata = "";
//					String result = "";
//	                InputStream  is = new StreamGobbler(ssh.getStdout());  
//	                BufferedReader brs = new BufferedReader(new InputStreamReader(is));  
//	                while(true){  
//	                    String line = brs.readLine();  
//	                    if(line==null){  
//	                        break;  
//	                    }  
//	                    rdata+=line;
//	                    
//	                    System.out.println("------------------- "+line);  
//	                }  
//	                System.out.println("----------rdata--------- "+rdata);  
//	                String[] strs = rdata.split("&&&&&&");
//	                System.out.println("----------111--------- "+strs[0]);  
//	                System.out.println("----------111--------- "+strs[1]);  
//	            }  
//	           
//	            //连接的Session和Connection对象都需要关闭  
//	            ssh.close();  
//	            conn.close();  
//	              
//	        } catch (IOException e) {  
//	            // TODO Auto-generated catch block  
//	            e.printStackTrace();  
//	        }  
	}

}
