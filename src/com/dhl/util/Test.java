package com.dhl.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


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
    
    
    public static void readFileByLines(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            String aaa = "";
//            while ((tempString = reader.readLine()) != null) {
//                // 显示行号
//                System.out.println("line " + line + ": " + tempString);
//                aaa += tempString;
//                line++;
//            }
            while (true) {
				String bbb = reader.readLine();
				if (bbb == null) {
					break;
				}
				line++;
				aaa += bbb + "</br>";
			}
            System.out.println("aaaa---- "+aaa+"  ,   "+aaa.length());
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }
    
    
    public static String string2Json(String s) {        
        StringBuffer sb = new StringBuffer();        
        for (int i=0; i<s.length(); i++) {  
            char c = s.charAt(i);    
             switch (c){  
             case '\"':        
                 sb.append("\\\"");        
                 break;        
             case '\\':        
                 sb.append("\\\\");        
                 break;        
             case '/':        
                 sb.append("\\/");        
                 break;        
             case '\b':        
                 sb.append("\\b");        
                 break;        
             case '\f':        
                 sb.append("\\f");        
                 break;        
             case '\n':        
                 sb.append("\\n");        
                 break;        
             case '\r':        
                 sb.append("\\r");        
                 break;        
             case '\t':        
                 sb.append("\\t");        
                 break;        
             default:        
                 sb.append(c);     
             }  
         }      
        return sb.toString();     
        }  
    
    
    public static void StringControl(String s){
        String[] ma = Pattern.compile("<IMG.*src=(.*?)[^>]*?>").split(s);
        List<String> strL=new ArrayList<String>();
        for(int i=0;i<ma.length;i++){
            System.out.println(ma[i]);
        }
    }
    
    public static void aaa(String s,String regex,int bbb)
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
			 System.out.println("one ---- "+one);
			 }
			 String two = regex;
			 bbb++;
			 System.out.println(bbb);
			 System.out.println("two ---- "+two);
			 String three = s.substring(index+regex.length());
			 System.out.println("three ---- "+three);
			 s = three;
//				 System.out.println("s ---- "+s);
			 aaa(s,regex, bbb);
		 }
		 else
		 {
			 System.out.println("four -------- "+s);
		 }
    }
    public static int aaaa = 0;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		 String s="11111TtTtTt33333333TtTtTt22TtTtTt2222"; 
		 String regex = "TtTtTt";
//		 String regex="<(img|a|p|b|div|br)\\s*([\\w]*=(\"|\')([^\"\'<]*)(\"|\')\\s*)*(/>|>)";
		 int bbb = 0;
		 aaa(s,regex,bbb);
//		readFileByLines("D://aaa.txt");
//		String REGEX = "11111 22222 333333";
//		String[] regex = REGEX.split("#");
////		String[] tstrs = shellparameter.split("#");
//		for (String s:regex)
//		{
//			System.out.println(s);
//		}
		
//		 int s=24*60*60+6;
////		  int L = s/86400;
////		  s = s%86400;
//	       int N = s/3600;
//	       s = s%3600;
//	       int K = s/60;
//	       s = s%60;
//	       int M = s;
//	       System.out.println("时间是："+N+"小时 "+K+"分钟 "+M+"秒"); 
	      
//		Map<String, Object> metadata = new HashMap<String, Object>();
//		metadata.put("isDir", "false");
//		metadata.put("path", "sssss");
//		System.out.println(metadata.get("path"));
		
		
		
//		Pattern p = Pattern.compile("controller*192.168.10.10(\\s|\\S)*Permissive(\\s|\\S)*192.168.10.20(\\s|\\S)*Permissive(\\s|\\S)*baseurl=ftp://192.168.10.10//icehouse-allinone/(\\s|\\S)*");
//		Pattern p = Pattern.compile("controller(.|\\s)*192.168.10.10(.|\\s)*Permissive(.|\\s)*192.168.10.20(.|\\s)*Permissive(.|\\s)*baseurl=ftp://192.168.10.10//icehouse-allinone/(.|\\s)*");
//		Matcher m = p.matcher("controllereth0      Link encap:Ethernet  HWaddr 0C:C4:7A:05:C3:22            inet addr:192.168.10.10  Bcast:192.168.10.255  Mask:255.255.255.0          inet6 addr: fe80::ec4:7aff:fe05:c322/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:5263 errors:0 dropped:0 overruns:0 frame:0          TX packets:5563 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:1317655 (1.2 MiB)  TX bytes:3053398 (2.9 MiB)          Interrupt:16 Memory:fbc00000-fbc20000 eth1      Link encap:Ethernet  HWaddr 0C:C4:7A:05:C3:23            inet6 addr: fe80::ec4:7aff:fe05:c323/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:7 errors:0 dropped:0 overruns:0 frame:0          TX packets:18 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:508 (508.0 b)  TX bytes:1292 (1.2 KiB)          Interrupt:17 Memory:fbb00000-fbb20000 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4::1         localhost localhost.localdomain localhost6 localhost6.localdomain6192.168.10.10 controller192.168.10.20 computePermissivecentos6.5icehouse-allinone[centos]baseurl=file:///opt/centos6.5/gpgcheck=0enabled=1name=centos[openstack-icehouse]name=OpenStack Icehouse Repositorybaseurl=file:///opt/icehouse-allinone/gpgcheck=0enabled=1anonymous_enable=YESlocal_enable=YESwrite_enable=YESlocal_umask=022dirmessage_enable=YESxferlog_enable=YESconnect_from_port_20=YESxferlog_std_format=YESlisten=YESpam_service_name=vsftpduserlist_enable=YEStcp_wrappers=YESanon_root=/optcomputeeth0      Link encap:Ethernet  HWaddr 00:25:90:AA:8B:F8            inet addr:192.168.10.20  Bcast:192.168.10.255  Mask:255.255.255.0          inet6 addr: fe80::225:90ff:feaa:8bf8/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:2920 errors:0 dropped:0 overruns:0 frame:0          TX packets:2508 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:2107687 (2.0 MiB)  TX bytes:598597 (584.5 KiB)          Interrupt:16 Memory:fbc00000-fbc20000 eth1      Link encap:Ethernet  HWaddr 00:25:90:AA:8B:F9            inet6 addr: fe80::225:90ff:feaa:8bf9/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:0 errors:0 dropped:0 overruns:0 frame:0          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:0 (0.0 b)  TX bytes:538 (538.0 b)          Interrupt:17 Memory:fbb00000-fbb20000 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4::1         localhost localhost.localdomain localhost6 localhost6.localdomain6192.168.10.10 controller192.168.10.20 computePermissiverh[centos]baseurl=ftp://192.168.10.10//centos6.5/gpgcheck=0enabled=1name=centos[openstack-icehouse]name=OpenStack Icehouse Repositorybaseurl=ftp://192.168.10.10//icehouse-allinone/gpgcheck=0enabled=1");
//	    if (m.find())
//	    {
//	    	System.out.println("111111");
//	    }
//		String regex = "controller*192.168.10.10(\\s|\\S)*Permissive(\\s|\\S)*192.168.10.20(\\s|\\S)*Permissive(\\s|\\S)*baseurl=ftp://192.168.10.10//icehouse-allinone/(\\s|\\S)*";
//		String aaa = "controllereth0      Link encap:Ethernet  HWaddr 0C:C4:7A:05:C3:22            inet addr:192.168.10.10  Bcast:192.168.10.255  Mask:255.255.255.0          inet6 addr: fe80::ec4:7aff:fe05:c322/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:5263 errors:0 dropped:0 overruns:0 frame:0          TX packets:5563 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:1317655 (1.2 MiB)  TX bytes:3053398 (2.9 MiB)          Interrupt:16 Memory:fbc00000-fbc20000 eth1      Link encap:Ethernet  HWaddr 0C:C4:7A:05:C3:23            inet6 addr: fe80::ec4:7aff:fe05:c323/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:7 errors:0 dropped:0 overruns:0 frame:0          TX packets:18 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:508 (508.0 b)  TX bytes:1292 (1.2 KiB)          Interrupt:17 Memory:fbb00000-fbb20000 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4::1         localhost localhost.localdomain localhost6 localhost6.localdomain6192.168.10.10 controller192.168.10.20 computePermissivecentos6.5icehouse-allinone[centos]baseurl=file:///opt/centos6.5/gpgcheck=0enabled=1name=centos[openstack-icehouse]name=OpenStack Icehouse Repositorybaseurl=file:///opt/icehouse-allinone/gpgcheck=0enabled=1anonymous_enable=YESlocal_enable=YESwrite_enable=YESlocal_umask=022dirmessage_enable=YESxferlog_enable=YESconnect_from_port_20=YESxferlog_std_format=YESlisten=YESpam_service_name=vsftpduserlist_enable=YEStcp_wrappers=YESanon_root=/optcomputeeth0      Link encap:Ethernet  HWaddr 00:25:90:AA:8B:F8            inet addr:192.168.10.20  Bcast:192.168.10.255  Mask:255.255.255.0          inet6 addr: fe80::225:90ff:feaa:8bf8/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:2920 errors:0 dropped:0 overruns:0 frame:0          TX packets:2508 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:2107687 (2.0 MiB)  TX bytes:598597 (584.5 KiB)          Interrupt:16 Memory:fbc00000-fbc20000 eth1      Link encap:Ethernet  HWaddr 00:25:90:AA:8B:F9            inet6 addr: fe80::225:90ff:feaa:8bf9/64 Scope:Link          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1          RX packets:0 errors:0 dropped:0 overruns:0 frame:0          TX packets:7 errors:0 dropped:0 overruns:0 carrier:0          collisions:0 txqueuelen:1000           RX bytes:0 (0.0 b)  TX bytes:538 (538.0 b)          Interrupt:17 Memory:fbb00000-fbb20000 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4::1         localhost localhost.localdomain localhost6 localhost6.localdomain6192.168.10.10 controller192.168.10.20 computePermissiverh[centos]baseurl=ftp://192.168.10.10//centos6.5/gpgcheck=0enabled=1name=centos[openstack-icehouse]name=OpenStack Icehouse Repositorybaseurl=ftp://192.168.10.10//icehouse-allinone/gpgcheck=0enabled=1";
//		boolean flag = aaa.matches(regex);
//		System.out.println("0000----------- "+flag);
//		String answer = "fffff11111xxxxfsa" +
//				"22fzzz2333";
//		String regex = "11111&22,33&333";
//		boolean flag = UtilTools.matches(answer, regex);
//		System.out.println(flag);
		
//		String s ="shell\\8958772f-13bd-4eeb-a84a-12f5a63c1b4eunit3.4.1.sh";
//		//把s中的反斜杠\ 替换为\\
////		System.out.println(s);
//		System.out.println(s.replaceAll("\\\\", "\\\\\\\\"));
//		System.out.println(s.replace("\\", "\\\\"));
//		String aaa = "-P INPUT ACCEPT" +
//				"-P FORWARD ACCEPT" +
//				"-P OUTPUT ACCEPT" +
//				"-N nova-api-FORWARD" +
//				"-N nova-api-INPUT";
//		
//		
//		String tempuseranswer = UtilTools.getTextFromHtml(aaa);
//		{
//			String regex = ".{0,}"+"FORWARD"+".{0,}";
//			regex = "-P FORWARD ACCEPT";
//			Pattern p = Pattern.compile(regex);
//		    Matcher m = p.matcher(tempuseranswer);
//		    boolean aa = tempuseranswer.matches(regex);
//		    System.out.println("--------- aa "+aa);
//		    if (m.find())
//		    {
//		    	System.out.println("--------- 111111111");
//		    }
//		}
		
//		try
//		{
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		java.util.Date end = df.parse("2014-12-09 16:28:40");
//		java.util.Date start=new Date();
//		long l=end.getTime()-start.getTime();
//		if (l > 0)
//		System.out.println(l/1000+"秒");
////		long day=l/(24*60*60*1000);
////		long hour=(l/(60*60*1000)-day*24);
////		long min=((l/(60*1000))-day*24*60-hour*60);
////		long s=(l/1000-day*24*60*60-hour*60*60-min*60);
////		System.out.println(""+day+"天"+hour+"小时"+min+"分"+s+"秒");
//		}
//		catch(Exception e)
//		{}
//		String str = "范德萨发生大发放大师傅172.16.15.2飞洒发萨菲答复";
		
//		String endt = str.substring(str.lastIndexOf(".")+1);
//		
//		System.out.println(endt);
		
		
//		System.out.println(str.matches("pl[a-z]in")); //false
//		System.out.println(str.toLowerCase().matches(".{0,}"+"172.16.15.1".toLowerCase()+".{0,}"));//true
		
		
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
