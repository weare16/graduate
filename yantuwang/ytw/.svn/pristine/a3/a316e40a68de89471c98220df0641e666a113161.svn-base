package com.mtecc.rdc.system.sys.service;

import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import net.sf.json.JSONArray;

import org.springframework.web.multipart.MultipartFile;

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

public interface SysService {


	public String getOrgMinLevel()throws Exception;
	public List<SysOrganization> getSonOrg(String orgid)throws Exception;
	public List<SysUser> getOrgUser(Integer orgid)throws Exception;
	public List<SysOrganization> getAllOrg()throws Exception;
	public boolean save(SysOrganization  org) throws  Exception;
	public boolean update(SysOrganization org) throws  Exception;
	public boolean delete(SysOrganization org) throws Exception;
	public SysOrganization  getOrgById(Integer orgid) throws Exception;
	
	
	public List queryUsers(UserManageCondition condition, int start, int page) throws Exception;
	public int count(UserManageCondition condition) throws Exception;
	public Integer saveUser(SysUser  user) throws  Exception;
	public boolean updateUser(SysUser  user) throws  Exception;
	public boolean deleteUser(SysUser  user) throws  Exception;
	public SysUser getUserById(Integer  userid) throws Exception;
	public Integer saveUserGroup(SysUserGroup  ug) throws  Exception;
	public List<SysUser> getAllUser() throws Exception;
	
	
	
	public Integer saveGroup(SysGroup  group) throws  Exception;
	public boolean updateGroup(SysGroup group) throws  Exception;
	public boolean  deleteGroup(SysGroup  group) throws  Exception;
	public SysGroup getGroupById(Integer groupid) throws Exception;
	public List queryGroup(RoleManageCondition condition, int start, int page) throws Exception;
	public int count(RoleManageCondition condition) throws Exception;
	public List<SysGroup> getAllGroup() throws Exception;
	public List<SysUserGroup> getGroupByUserid(Integer userid) throws Exception;
	public boolean deleteGroupByUserid(Integer userid) throws Exception;
	
	public List queryMenu(MenuManageCondition condition, int start, int page) throws Exception;
	public int count(MenuManageCondition condition) throws Exception;
	public Integer saveMenu(SysMenu menu)throws  Exception;
	public boolean  updateMenu(SysMenu  menu) throws  Exception;
	public boolean  deleteMenu(SysMenu  menu) throws  Exception;
	public SysMenu  getMenuById(Integer menuid) throws  Exception;
	public List<SysMenu> getAllMneu() throws Exception;
	public List<SysGroupMenu> getMneuByGroupId(Integer groupid) throws Exception;
	public List<SysMenu> getMenuByLevel(String menulv) throws Exception;
	public List<SysMenu> getSonMenu(Integer menuid)throws Exception;
	public Integer  saveGropMenu(SysGroupMenu gm)throws  Exception;
	public boolean  deleteMenuByGroupId(Integer  groupid) throws  Exception;


	public List queryDic(DicManageCondition condition, int start, int page) throws Exception;
	public int count(DicManageCondition condition) throws Exception;
	public Integer saveDic(SysDictionary dic) throws  Exception;
	public boolean  updateDic(SysDictionary  dic) throws  Exception;
	public boolean  deleteDic(SysDictionary dic) throws Exception;
	public SysDictionary getDicById(Integer did) throws  Exception;
	public List queryDicByType(String busintypeid) throws Exception;
	public boolean deleteDicByType(String busintypeid) throws  Exception;
	
	
	
	
	
	
	
	
	
	
	
}
