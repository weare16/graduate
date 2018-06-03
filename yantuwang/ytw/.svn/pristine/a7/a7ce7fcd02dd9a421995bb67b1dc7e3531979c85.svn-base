package com.mtecc.rdc.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class StringUtils {

	/**
	 * @author zhangdandan
	 * @date 2016年6月20日 下午5:38:23
	 * @description 判断字符串不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		boolean flag = false;
		if(str!=null&&!"".equals(str)){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
	/**
	 * 截取审核分派（fpdept）最后一个单位ID加最后的逗号
	 * @author zhangdandan
	 * @date 2016年10月31日 下午12:14:37
	 * @description
	 * @param fpdept
	 * @return
	 */
	public static String subStringFpdept(String fpdept){
		String[] tempStr = fpdept.split(",");
		int len = tempStr[tempStr.length-1].length();//最后一个元素的长度
		if(tempStr.length>2){
			return fpdept.substring(0, fpdept.length()-1-len);
		}else{
			return fpdept.substring(0, fpdept.length()-1-len-1);
		}
	}
	/**
	 * 判断字符串为空
	 * @author zhangdandan
	 * @date 2016年11月1日 下午6:25:02
	 * @description
	 * @param id
	 * @return
	 */
	public static boolean isNull(String id) {
		boolean flag = false;
		if(id!=null&&!"".equals(id)){
			flag = false;
		}else{
			flag = true;
		}
		return flag;
	}
	
	/**
	 * 获取当前时间减去30天
	 * @author lxy
	 * @description
	 * @param id
	 * @return
	 */
	public static String getdate() {
		SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DAY_OF_MONTH, -30);
		return dft.format(date.getTime());
	}
	
	/**
	 * 关系判断
	 * */
	public static StringBuffer addRelation (String str,StringBuffer sql){
		if(isNotEmpty(str)){
			if("01".equals(str)){
				sql.append(" and ");
			}else{
				sql.append(" or ");
			}
		}
		return sql;
	}
}
