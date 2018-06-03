package com.mtecc.rdc.system.sys.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mtecc.rdc.pojo.SysDictionary;
import com.mtecc.rdc.pojo.SysGroup;
import com.mtecc.rdc.pojo.SysGroupMenu;
import com.mtecc.rdc.pojo.SysMenu;
import com.mtecc.rdc.pojo.SysOrganization;
import com.mtecc.rdc.pojo.SysUser;
import com.mtecc.rdc.pojo.SysUserGroup;
import com.mtecc.rdc.system.login.dao.UserDao;
import com.mtecc.rdc.system.login.service.UserService;
import com.mtecc.rdc.system.sys.condition.DicManageCondition;
import com.mtecc.rdc.system.sys.condition.MenuManageCondition;
import com.mtecc.rdc.system.sys.condition.RoleManageCondition;
import com.mtecc.rdc.system.sys.condition.UserManageCondition;
import com.mtecc.rdc.system.sys.dao.SysDao;
import com.mtecc.rdc.system.sys.service.SysService;

@Service
@Transactional
public class SysServiceImp implements SysService {

	@Autowired
	private SysDao dao;
	

	public String getOrgMinLevel() throws Exception {
		return dao.getOrgMinLevel();
	}

	public List<SysOrganization> getSonOrg(String orgid) throws Exception {
		return dao.getSonOrg(orgid);
	}

	public List<SysUser> getOrgUser(Integer orgid) throws Exception {
		return dao.getOrgUser(orgid);
	}
	public List<SysOrganization> getAllOrg()throws Exception{
		return dao.getAllOrg();
	}

	public boolean save(SysOrganization org) throws Exception {
		String sql="insert into sys_organization values("+org.getOrgid()+","
				+ "'"+org.getOrgname()+"',"
				+ "'"+org.getOrglevel()+"',"
				+ "'"+org.getOrgaddress()+"',"
				+ "'"+org.getParentorg()+"',"
				+ "'"+org.getState()+"',"
				+ "'"+org.getRemark()+"')";
		return dao.updateBySql(sql);
	}

	public boolean update(SysOrganization org) throws Exception {
		return dao.update(org);
		
	}

	public boolean delete(SysOrganization org) throws Exception {
		return dao.delete(org);
	}

	public SysOrganization getOrgById(Integer orgid) throws Exception {
		return (SysOrganization) dao.get(SysOrganization.class, orgid);
	}

	public List queryUsers(UserManageCondition condition, int start, int page)
			throws Exception {
		return dao.queryUsers(condition, start, page);
	}

	public int count(UserManageCondition condition) throws Exception {
		return dao.count(condition);
	}

	public Integer saveGroup(SysGroup group) throws Exception {
		return (Integer) dao.save(group);
	}

	public boolean updateGroup(SysGroup group) throws Exception {
		return dao.update(group);
		
	}

	public boolean deleteGroup(SysGroup group) throws Exception {
		return dao.delete(group);
	}

	public List queryGroup(RoleManageCondition condition, int start, int page)
			throws Exception {
		return dao.queryGroup(condition, start, page);
	}

	public int count(RoleManageCondition condition) throws Exception {
		return dao.count(condition);
	}

	public SysGroup getGroupById(Integer groupid) throws Exception {
		return (SysGroup) dao.get(SysGroup.class, groupid);
	}

	public List<SysGroup> getAllGroup() throws Exception {
		return dao.getAllGroup();
	}

	public Integer saveUser(SysUser user) throws Exception {
		return (Integer) dao.save(user);
	}

	public boolean updateUser(SysUser user) throws Exception {
		return dao.update(user);
	}

	public boolean deleteUser(SysUser user) throws Exception {
		return dao.delete(user);
	}

	public SysUser getUserById(Integer userid) throws Exception {
		return (SysUser) dao.get(SysUser.class,userid);
	}

	public Integer saveUserGroup(SysUserGroup ug) throws Exception {
		return (Integer) dao.save(ug);
	}

	public List<SysUserGroup> getGroupByUserid(Integer userid) throws Exception {
		return dao.getGroupByUserid(userid);
	}
		
	public boolean deleteGroupByUserid(Integer userid) throws Exception{
		boolean flag=true;
		List<SysUserGroup> list=dao.getGroupByUserid(userid);
		if (list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				flag=dao.delete(list.get(i));
				if(!flag){
					break;
				}
			}
			
		}
		return flag;
	}
	public List<SysUser> getAllUser() throws Exception{
		return dao.getAllUser();
	}

	public List queryMenu(MenuManageCondition condition, int start, int page)
			throws Exception {
		return dao.queryMenu(condition, start, page);
	}

	public int count(MenuManageCondition condition) throws Exception {
		return dao.count(condition);
	}

	public Integer saveMenu(SysMenu menu) throws Exception {
		return (Integer) dao.save(menu);
	}

	public boolean updateMenu(SysMenu menu) throws Exception {
		return dao.update(menu);
	}

	public boolean deleteMenu(SysMenu menu) throws Exception {
		return dao.delete(menu);
	}

	public SysMenu getMenuById(Integer menuid) throws Exception {
		return (SysMenu) dao.get(SysMenu.class, menuid);
	}

	public List<SysMenu> getAllMneu() throws Exception{
		return dao.getAllMneu();
	}
	
	public List<SysGroupMenu> getMneuByGroupId(Integer groupid) throws Exception{
		return dao.getMneuByGroupId(groupid);
	}
	
	public List<SysMenu> getMenuByLevel(String menulv) throws Exception{
		return dao.getMenuByLevel(menulv);
	}
	
	public List<SysMenu> getSonMenu(Integer menuid)throws Exception{
		return dao.getSonMenu(menuid);
	}

	public Integer saveGropMenu(SysGroupMenu gm) throws Exception {
		return (Integer) dao.save(gm);
	}
	
	public boolean  deleteMenuByGroupId(Integer  groupid) throws  Exception{
		boolean flag=true;
		List<SysGroupMenu> list=dao.getMneuByGroupId(groupid);
		if (list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				flag=dao.delete(list.get(i));
				if(!flag){
					break;
				}
			}
			
		}
		return flag;
	}

	public List queryDic(DicManageCondition condition, int start, int page)
			throws Exception {
		return dao.queryDic(condition, start, page);
	}

	public int count(DicManageCondition condition) throws Exception {
		return dao.count(condition);
	}

	public Integer saveDic(SysDictionary dic) throws Exception {
		return (Integer) dao.save(dic);
	}

	public boolean updateDic(SysDictionary dic) throws Exception {
		return dao.update(dic);
	}

	public boolean deleteDic(SysDictionary dic) throws Exception {
		return dao.delete(dic);
	}

	public SysDictionary getDicById(Integer dic) throws Exception {
		return (SysDictionary) dao.get(SysDictionary.class, dic);
	}
	
	public List queryDicByType(String busintypeid) throws Exception{
		return dao.queryDicByType(busintypeid);
	}
	
	public boolean deleteDicByType(String busintypeid) throws  Exception{
		boolean  flag=true;
		List<SysDictionary> dlist=dao.queryDicByType(busintypeid);
		if(dlist.size()>0){
			for (int i = 0; i < dlist.size(); i++) {
			  boolean dflag=	deleteDic(dlist.get(i));
			  if(!dflag){
				  flag=false;
				  break;
			  }
			}
		}
		return flag;
		
	}
	
	
	
	
}
