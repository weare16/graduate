package com.mtecc.rdc.base;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * @author pyue
 * 常用方法帮助类
 */

public class MteccHelp {
	
	/** 
	 * 不传参数默认编码格式为 utf-8
	 * @param str
	 * @return
	 */
	public static String getEncodeString(String str,String type){
		String s = "";
		if(str!=null&&!str.equals("")){
			try {
				if(type!=null&&!type.equals("")){
					s = URLEncoder.encode(str, type);
				}else{
					s = URLEncoder.encode(str, "utf-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return s;
	}
	
	/** 
	 * 对中文进行二次编码
	 * 不传参数默认编码格式为 utf-8
	 * @param str
	 * @return
	 */
	public static String getEncodeString_s(String str,String type){
		String s = "";
		if(str!=null&&!str.equals("")){
			try {
				if(type!=null&&!type.equals("")){
					s = URLEncoder.encode(str, type);
					s = URLEncoder.encode(s, type);
				}else{
					s = URLEncoder.encode(str, "utf-8");
					s = URLEncoder.encode(s, "utf-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return s;
	}
	
	
	/** 
	 * 对中文进行二次解码
	 * 不传参数默认编码格式为 utf-8
	 * @param str
	 * @return
	 */	
	public static String getDecodeString_s(String str,String type){
		String s = "";
		if(str!=null&&!str.equals("")){
			try {
				if(type!=null&&!type.equals("")){
					s = URLDecoder.decode(str, type);
					s = URLDecoder.decode(s, type);
				}else{
					s = URLDecoder.decode(str, "utf-8");
					s = URLDecoder.decode(s, "utf-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return s;
	}
	
	
}
