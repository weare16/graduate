package com.mtecc.rdc.util;

import java.util.List;









import com.mtecc.rdc.base.MteccContext;


public class BusinUtil{
	//获取不同的业务字典
//	public static List<YwPublicDictionary> findByBuTyId(String param)
//			throws Exception {
//		DailyCheckDao dao = (DailyCheckDao) MteccContext
//				.getApplicationContext().getBean("dailyCheckDao");
//		List<YwPublicDictionary>   dictionary=	dao.findByBuTyId(param);
//		return dictionary;
//	}
	//获取一个字符串的第一位值
	public static String getFirstChar(String str){
		String charStr="";
		if (!EmptyUtil.isEmpty(str)) {
			charStr=str.substring(0, 1);
		}
		return charStr;
		
	}
//	//判断系统机构等级
//		public static SysOrganization getOrgMinLevel()
//				throws Exception {
//			DailyCheckDao dao = (DailyCheckDao) MteccContext
//					.getApplicationContext().getBean("dailyCheckDao");
//			SysOrganization   org=	dao.getOrgMinLevel();
//			return org;
//		}
}
