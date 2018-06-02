
package com.mtecc.rdc.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Base64 {

	/**
	 * 将字符串以base64的编码加密
	 * @param s
	 * @return
	 */
	public static String getBASE64(String s) {
		BASE64Encoder encoder = new BASE64Encoder();
		if (s == null)
			return null;
		return encoder.encode(s.getBytes());
	}

	/**
	 * 将以base64编码加密的字符串解密
	 * @param s
	 * @return
	 */
	public static String getFromBASE64(String s) {
		if (s == null)
			return null;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] b = decoder.decodeBuffer (s);
			return new String(b,"utf-8");
		} catch (Exception e) {
			return null;
		} 
	}

	public static void main(String args[]) {
		String s1=getBASE64("sinosoft");
		String ss = getFromBASE64("c2lub3NvZnQ=");
	
		try {
		
			//ss=ss.getBytes("UTF-8");
			//ss=new String(ss.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {
			
		} 
	}
}

