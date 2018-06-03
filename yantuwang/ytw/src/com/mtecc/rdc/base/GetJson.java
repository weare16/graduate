package com.mtecc.rdc.base;

import java.util.List;

import net.sf.json.JSONArray;




import com.mtecc.rdc.pojo.SysMenu;



public class GetJson {
	
	// 获取dao
			MenuFuncDao dao = (MenuFuncDao) MteccContext
								.getApplicationContext().getBean("menuFuncDao");
	
	public JSONArray  loadMenu(String menuid,String menulv){
		JSONArray menuJson = null;
		List<SysMenu>  meunList=dao.loadMenu(menuid, menulv);
		menuJson = JSONArray.fromObject(meunList);
		return  menuJson;
	}
	
	
	
	
	
}
