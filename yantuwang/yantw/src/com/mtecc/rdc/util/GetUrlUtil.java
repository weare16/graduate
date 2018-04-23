package com.mtecc.rdc.util;

import java.io.InputStream;
import java.util.Properties;

public class GetUrlUtil {
	public static String imgIp = getUrl("img_ip");
	public static String getUrl(String key){
		
		String url = "";
		/*File pf = new File(System.getProperty("user.dir")
				+ "/src/sysconfig.properties");

		// 生成文件输入流
		FileInputStream inpf = null;
		try {
			inpf = new FileInputStream(pf);
		} catch (Exception e) {
			e.printStackTrace();
		}*/

		InputStream ins=GetUrlUtil.class.getClassLoader().getResourceAsStream("sysconfig.properties");  
        // 生成properties对象  
        Properties p = new Properties();  
        try {  
            p.load(ins);  
        } catch (Exception e) {  
           e.printStackTrace();  
        }
        url = p.getProperty(key);
		return url;
	}
	

}
