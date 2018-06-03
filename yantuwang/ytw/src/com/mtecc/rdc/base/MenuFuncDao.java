package com.mtecc.rdc.base;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;



import com.mtecc.base.MteccBaseDao;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.util.EmptyUtil;

@Repository
public class MenuFuncDao extends MteccBaseDao {
	
	
	
	public List<SysMenu> loadMenu(String menuid, String menulv) {
		StringBuilder sb = new StringBuilder();
		sb.append("  from SysMenu m where 1=1");
		if (!EmptyUtil.isEmpty(menuid)) {
			sb.append("  and m.pmenuid='"+menuid+"'");
		}
	   if( !EmptyUtil.isEmpty(menulv)){
			sb.append("  and m.menulv='"+menulv+"'");
	   }
        sb.append("  and m.menuid.isactive='0'");//有效菜单		
        List<SysMenu> list=null;
		try {
			  list = (List<SysMenu>) this.findByHQL(sb.toString());
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return list;
	}

	
}
