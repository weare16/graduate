package com.mtecc.rdc.system.sys.dao;

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
import com.mtecc.rdc.pojo.SysDictionary;
import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysGroupMenu;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.system.sys.condition.DicManageCondition;
import com.mtecc.rdc.system.sys.condition.MenuManageCondition;
import com.mtecc.rdc.system.sys.condition.RoleManageCondition;
import com.mtecc.rdc.system.sys.condition.UserManageCondition;
import com.mtecc.rdc.util.Base64;
import com.mtecc.rdc.util.EmptyUtil;

@Repository
public class SysDao extends MteccBaseDao {

	/**
	 * 获取机构最小等级
	 * @return
	 */
	public String getOrgMinLevel()throws Exception{
		String level="";
		StringBuilder sb = new StringBuilder();
		sb.append("from SysOrganization s where 1=1 and s.state='0' ");//有效机构
		sb.append(" order by cast(s.orglevel as int) desc");
		List<SysOrganization>  orglist=(List<SysOrganization>) this.findByHQL(sb.toString());
		if(orglist.size()>0){
			level=orglist.get(0).getOrglevel();
		}
		return level;
	}
	/**
	 * 根据自己ID获取子机构
	 * @return
	 */
	public List<SysOrganization> getSonOrg(String orgid)throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("from SysOrganization s where 1=1  ");
		sb.append(" and s.parentorg='"+orgid+"'");
		sb.append(" order by s.orgid desc");
		List<SysOrganization>  orglist=(List<SysOrganization>) this.findByHQL(sb.toString());
		return orglist;
	}
	/**
	 * 根据机构ID获取机构人员
	 * @return
	 */
	public List<SysUser> getOrgUser(Integer orgid)throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("from SysUser s where 1=1  ");
		sb.append(" and s.org.orgid="+orgid+"");
		sb.append(" order by s.userid desc");
		List<SysUser>  list=(List<SysUser>) this.findByHQL(sb.toString());
		return list;
	}
	/**
	 * 获取机构最小等级
	 * @return
	 */
	public List<SysOrganization> getAllOrg()throws Exception{
		String level="";
		StringBuilder sb = new StringBuilder();
		sb.append("from SysOrganization s where 1=1 and s.state='0' ");//有效机构
		sb.append(" order by cast(s.orglevel as int) ");
		List<SysOrganization>  orglist=(List<SysOrganization>) this.findByHQL(sb.toString());
		return orglist;
	}
	
	/*************************用户管理begin***********************************/
	public List queryUsers(UserManageCondition condition, int start, int page) throws Exception{
		List<SysUser> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysUser s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getUsername())) {
			buffer.append(" and s.username like '%"+condition.getUsername()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getLogname())) {
			buffer.append(" and s.logname like '%"+condition.getLogname()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getOrgid())) {
			buffer.append(" and s.org.orgid ='"+condition.getOrgid()+"'");
		}
		buffer.append(" order by s.userid desc");
		list=(List<SysUser>) this.findByHQLWithPage(buffer.toString(), start, page);
		return list;
	}
	public int count(UserManageCondition condition) throws Exception{
		int count ;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select count(*) from SysUser s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getUsername())) {
			buffer.append(" and s.username like '%"+condition.getUsername()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getLogname())) {
			buffer.append(" and s.logname like '%"+condition.getLogname()+"%'");
		}if (!EmptyUtil.isEmpty(condition.getOrgid())) {
			buffer.append(" and s.org.orgid ='"+condition.getOrgid()+"'");
		}
		count= this.countByHql(buffer.toString());
		return count;
	}
	/**
	 * 获取全部用户
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysUser> getAllUser() throws Exception{
		List<SysUser> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysUser s where 1=1 ");
		buffer.append(" order by s.userid desc");
		list=(List<SysUser>) this.findByHQL(buffer.toString());
		return list;
	}
	/*************************用户管理end***********************************/
	
	/*************************用户组管理begin***********************************/
	public List queryGroup(RoleManageCondition condition, int start, int page) throws Exception{
		List<SysGroup> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysGroup s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getUsergpname())) {
			buffer.append(" and s.usergpname like '%"+condition.getUsergpname()+"%'");
		}
		buffer.append(" order by s.usergpid desc");
		list=(List<SysGroup>) this.findByHQLWithPage(buffer.toString(), start, page);
		return list;
	}
	public int count(RoleManageCondition condition) throws Exception{
		int count ;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" select count(*) from SysGroup s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getUsergpname())) {
			buffer.append(" and s.usergpname like '%"+condition.getUsergpname()+"%'");
		}
		count= this.countByHql(buffer.toString());
		return count;
	}
	/**
	 * 获取全部用户组
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysGroup> getAllGroup() throws Exception{
		List<SysGroup> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysGroup s where 1=1 and s.isactive='0'");//可用用户组
		buffer.append(" order by s.usergpid desc");
		list=(List<SysGroup>) this.findByHQL(buffer.toString());
		return list;
	}
	/**
	 * 获取某个用户的用户组
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysUserGroup> getGroupByUserid(Integer userid) throws Exception{
		List<SysUserGroup> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("  from SysUserGroup s where 1=1  and s.userid="+userid+"");
		list=(List<SysUserGroup>) this.findByHQL(buffer.toString());
		return list;
	}
	/*************************用户管理组end***********************************/
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
	 * 根据级别获取菜单
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysMenu> getMenuByLevel(String menulv) throws Exception{
		List<SysMenu> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysMenu s where 1=1 and s.isactive='0'");//可用菜单
		buffer.append(" and s.menulv='"+menulv+"'");
		buffer.append(" order by s.menuorder ");
		list=(List<SysMenu>) this.findByHQL(buffer.toString());
		return list;
	}
	/**
	 * 获取某一个用户组所绑定的菜单
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public List<SysGroupMenu> getMneuByGroupId(Integer groupid) throws Exception{
		List<SysGroupMenu> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysGroupMenu s where 1=1  and s.groupid='"+groupid+"'");
		buffer.append(" order by s.gmid desc");
		list=(List<SysGroupMenu>) this.findByHQL(buffer.toString());
		return list;
	}
	/**
	 * 根据自己ID获取子菜单
	 * @return
	 */
	public List<SysMenu> getSonMenu(Integer menuid)throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("from SysMenu s where 1=1  and s.isactive='0' ");//有效菜单
		sb.append(" and s.pmenuid='"+menuid+"'");
		sb.append(" order by s.menuorder ");
		List<SysMenu>  orglist=(List<SysMenu>) this.findByHQL(sb.toString());
		return orglist;
	}
	
	
	
	/**************************系统菜单管理end***********************************/
	
	/***************************业务字典begin**************************************/
	public List queryDic(DicManageCondition condition, int start, int page) throws Exception{
		List<SysDictionary> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysDictionary s where 1=1");
		if (!EmptyUtil.isEmpty(condition.getBusintypename())) {
			buffer.append(" and s.busintypename like '%"+condition.getBusintypename()+"%'");
		}
		buffer.append("  group by s.busintypeid  order by s.busintypeid desc");
		list=(List<SysDictionary>) this.findByHQLWithPage(buffer.toString(), start, page);
		return list;
	}
	public int count(DicManageCondition condition) throws Exception{
		int count ;
		StringBuffer buffer = new StringBuffer();
		buffer.append("  from SysDictionary s where 1=1");
		
		if (!EmptyUtil.isEmpty(condition.getBusintypename())) {
			buffer.append(" and s.busintypename like '%"+condition.getBusintypename()+"%'");
		}
		buffer.append("  group by s.busintypeid  ");
		List list=this.findByHQL(buffer.toString());
		count= list.size();
		return count;
	}
	public List queryDicByType(String busintypeid) throws Exception{
		List<SysDictionary> list = null;
		StringBuffer buffer = new StringBuffer();
		buffer.append(" from SysDictionary s where 1=1");
		if (!EmptyUtil.isEmpty(busintypeid)) {
			buffer.append(" and s.busintypeid = '"+busintypeid.trim()+"'");
		}
		buffer.append("   order by s.BUSINID ");
		list=(List<SysDictionary>) this.findByHQL(buffer.toString());
		return list;
	}
	/***************************业务字典end***************************************/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
