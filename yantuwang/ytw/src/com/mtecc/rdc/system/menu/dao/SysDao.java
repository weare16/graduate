package com.mtecc.rdc.system.menu.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Repository;

import com.mtecc.base.MteccBaseDao;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.system.menu.condition.MenuManageCondition;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;

@Repository
public class SysDao extends MteccBaseDao {

	
	/**************************系统菜单管理begin***********************************/
	public List queryMenu(MenuManageCondition condition, int start, int page) throws Exception{
		List<SysMenu> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysMenu s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getMenuname())) {
			buffer.append(" and s.menuname like '%"+condition.getMenuname()+"%'");
		}
		if (!EmptyUtil.isEmpty(condition.getMenulv())) {
			buffer.append(" and s.menulv= '"+condition.getMenulv()+"'");
		}
		if (!EmptyUtil.isEmpty(condition.getIsactive())) {
			buffer.append(" and s.isactive ='"+condition.getIsactive()+"'");
		}
		buffer.append(" order by s.menuid desc");
		list=(List<SysMenu>) this.findByHQLWithPage(buffer.toString(), start, page);
		return list;
	}
	public int count(MenuManageCondition condition) throws Exception{
		int count ;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select count(*) from SysMenu s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getMenuname())) {
			buffer.append(" and s.menuname like '%"+condition.getMenuname()+"%'");
		}
		if (!EmptyUtil.isEmpty(condition.getMenulv())) {
			buffer.append(" and s.menulv= '"+condition.getMenulv()+"'");
		}
		if (!EmptyUtil.isEmpty(condition.getIsactive())) {
			buffer.append(" and s.isactive ='"+condition.getIsactive()+"'");
		}
		count= this.countByHql(buffer.toString());
		return count;
	}
	/**
	 * 获取全部菜单
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysMenu> getAllMneu() throws Exception{
		List<SysMenu> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysMenu s where 1=1 and s.isactive='0'");//可用菜单
		buffer.append(" order by s.menuid desc");
		list=(List<SysMenu>) this.findByHQL(buffer.toString());
		return list;
	}
	/**
	 * 根据角色ID获取菜单
	 * @param menulv,groupid
	 * @return
	 * @throws Exception
	 */
	public List getMenuByLevel(String menulv,Integer groupid) throws Exception{
		List list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select  s.menuid from SysGroupMenu s where 1=1 and s.menuid.isactive='0'");//可用菜单
		buffer.append(" and s.menuid.menulv='"+menulv+"'");
		if(!EmptyUtil.isEmpty(groupid)){
			buffer.append(" and s.groupid="+groupid+"");
		}
		buffer.append(" order by s.menuid.menuorder ");
		list= this.findByHQL(buffer.toString());
		return list;
	}
	
	
	
	/**************************系统菜单管理end***********************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 执行SQL 更新
	 */
	public boolean updateBySql(String sql) throws Exception{
		boolean flag = false;
		Session session = null;
		Transaction transaction = null;
		try {
			session = getSession();
			transaction = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(sql);
			Integer num = query.executeUpdate();
			if(num != null&&num>0){
				flag = true;
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		return flag;
	}
	
	
	
	
	



}
